import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:hive_flutter/hive_flutter.dart';

class ProductController extends GetxController {
  var products = <dynamic>[].obs;
  var categories = <String>[].obs;
  var selectedCategory = 'All'.obs;
  var isLoading = true.obs;
  var isLoadingCategories = true.obs;
  var searchQuery = ''.obs; // Store the current search query
  var favoriteProductIds = <int>{}.obs; // Set to track favorite product IDs

  @override
  void onInit() async {
    super.onInit();
    await _loadFavorites(); // Load favorites from Hive when controller is initialized
    fetchCategories();
    fetchProducts();
  }

  // Load favorite product IDs from Hive
  Future<void> _loadFavorites() async {
    var box =
        await Hive.openBox<int>('favorites'); // Open the Hive box for favorites
    favoriteProductIds.value =
        box.values.toSet(); // Load favorite IDs from the Hive box
  }

  // Save favorite product IDs to Hive
  Future<void> _saveFavorites() async {
    var box = await Hive.openBox<int>('favorites');
    await box.clear(); // Clear any existing favorites
    for (var id in favoriteProductIds) {
      await box.add(id); // Add each favorite product ID to the Hive box
    }
  }

  Future<void> fetchCategories() async {
    try {
      isLoadingCategories.value = true;
      final response = await http
          .get(Uri.parse('https://dummyjson.com/products/category-list'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data is List && data.isNotEmpty) {
          categories.value = ['All', ...List<String>.from(data)];
        } else {
          categories.value = ['All'];
        }
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      print('Error fetching categories: $e');
      categories.value = ['All'];
    } finally {
      isLoadingCategories.value = false;
    }
  }

  Future<void> fetchProducts([String? category]) async {
    isLoading.value = true;
    try {
      String url = category != null && category != 'All'
          ? 'https://dummyjson.com/products/category/$category'
          : 'https://dummyjson.com/products';
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        products.value = data['products'];
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      print('Error fetching products: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> searchProducts(String query) async {
    isLoading.value = true;
    try {
      final url = 'https://dummyjson.com/products/search?q=$query';
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        products.value = data['products'];
      } else {
        throw Exception('Failed to search products');
      }
    } catch (e) {
      print('Error searching products: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void updateCategory(String category) {
    selectedCategory.value = category;
    fetchProducts(category);
  }

  void toggleFavorite(int productId) {
    if (favoriteProductIds.contains(productId)) {
      favoriteProductIds.remove(productId); // Remove from favorites
    } else {
      favoriteProductIds.add(productId); // Add to favorites
    }
    _saveFavorites(); // Save updated favorites to Hive
  }

  // Check if a product is a favorite
  bool isFavorite(int productId) {
    return favoriteProductIds.contains(productId);
  }
}
