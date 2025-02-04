import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:assignment_week2_slicing_ui/controllers/product_controller.dart';
import 'package:assignment_week2_slicing_ui/pages/product_details.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final productController = Get.find<ProductController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: Obx(() {
        // Retrieve favorite products using productController
        final favoriteProducts = productController.products
            .where((product) => productController
                .isFavorite(product['id'])) // Filter favorite products
            .toList();

        if (favoriteProducts.isEmpty) {
          return const Center(
            child: Text('No favorite products yet!'),
          );
        }

        return ListView.builder(
          itemCount: favoriteProducts.length,
          itemBuilder: (context, index) {
            final product = favoriteProducts[index];
            return ListTile(
              leading: Image.network(
                product['thumbnail'],
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(product['title']),
              subtitle: Text('\$${product['price']}'),
              trailing: IconButton(
                icon: const Icon(Icons.remove_circle, color: Colors.red),
                onPressed: () {
                  // Remove from favorites when clicked
                  productController.toggleFavorite(product['id']);
                },
              ),
              onTap: () {
                // Navigate to Product Details page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetails(product: product),
                  ),
                );
              },
            );
          },
        );
      }),
    );
  }
}
