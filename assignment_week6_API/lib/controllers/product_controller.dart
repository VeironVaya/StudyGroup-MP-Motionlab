import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProductController extends GetxController {
  var products = <dynamic>[].obs;
  var categories = <String>[].obs;
  var selectedCategory = 'All'.obs;
  var isLoading = true.obs;
  var isLoadingCategories = true.obs;
  var searchQuery = ''.obs; // Store the current search query

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
    fetchProducts();
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
}
