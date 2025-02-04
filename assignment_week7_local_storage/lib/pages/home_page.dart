import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'product_details.dart';
import '/controllers/product_controller.dart';
import 'profile_page.dart'; // Import ProfilePage
import 'favorite_page.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/extras/left.png',
              height: 15,
              width: 20,
            ),
            Image.asset(
              'assets/extras/logo.png',
              height: 47,
              width: 47,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/cart');
              },
              child: Image.asset(
                'assets/extras/bag.png',
                height: 23,
                width: 23,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            _buildHeader(),
            const SizedBox(height: 20),
            _buildSearchBar(),
            const SizedBox(height: 20),
            Obx(() {
              if (productController.isLoadingCategories.value) {
                return const Center(child: CircularProgressIndicator());
              }
              if (productController.categories.isEmpty) {
                return const Center(child: Text("No categories available"));
              }
              return _buildCategoryChips(); // Render categories
            }),
            const SizedBox(height: 20),
            _buildSectionTitle("Our Best Seller"),
            const SizedBox(height: 20),
            Expanded(
              child: Obx(
                () {
                  if (productController.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return _buildProductGrid();
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar:
          _buildBottomNavigationBar(context), // Pass context here
    );
  }

  Widget _buildHeader() {
    return const Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(left: 18),
        child: Text(
          "Our way of loving\nyou back",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 29),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    final TextEditingController searchController = TextEditingController();

    return Container(
      width: 370,
      height: 65,
      decoration: BoxDecoration(
        color: const Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 25, right: 10),
        child: Row(
          children: [
            const Icon(
              Icons.search,
              size: 40,
              color: Color(0xFF868A91),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: TextField(
                controller: searchController,
                onSubmitted: (query) {
                  if (query.isNotEmpty) {
                    productController.searchProducts(query);
                  }
                },
                decoration: const InputDecoration(
                  hintText: "Search",
                  hintStyle: TextStyle(
                    fontSize: 23,
                    color: Color(0xFF868A91),
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.close, color: Color(0xFF868A91)),
              onPressed: () {
                searchController.clear();
                productController.fetchProducts(); // Reset to all products
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryChips() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 18),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal, // Enable horizontal scrolling
          child: Row(
            children: productController.categories.map((category) {
              final isSelected =
                  category == productController.selectedCategory.value;
              return GestureDetector(
                onTap: () => productController.updateCategory(category),
                child: _buildCategoryChip(category, isSelected),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryChip(String title, bool isSelected) {
    return Container(
      margin: const EdgeInsets.symmetric(
          horizontal: 8), // Add some spacing between chips
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 40,
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF3A5A40) : const Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(20),
      ), // Adjust padding inside the chip
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Color(0xFF4D4D4D),
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 18),
        child: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
    );
  }

  Widget _buildProductGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: GridView.builder(
        itemCount: productController.products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.75,
        ),
        itemBuilder: (context, index) {
          final product = productController.products[index];
          final productId =
              product['id']; // Assuming each product has a unique 'id'

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetails(product: product),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(15)),
                      child: Image.network(
                        product['thumbnail'],
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product['title'],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '\$${product['price']}',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xFF00623B),
                          ),
                        ),
                        const SizedBox(height: 5),
                        // Wrap IconButton with Obx for reactivity
                        Obx(() {
                          final isFavorited =
                              productController.isFavorite(productId);

                          return IconButton(
                            icon: Icon(
                              isFavorited
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: isFavorited ? Colors.red : Colors.grey,
                            ),
                            onPressed: () {
                              productController.toggleFavorite(productId);
                            },
                          );
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return BottomAppBar(
      color: const Color(0xFF00623B),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: const Icon(
              Icons.home,
              color: Colors.white,
              size: 37,
            ),
            onPressed: () {
              // Navigate to Home Page
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage()),
              );
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.favorite_outline_rounded,
              color: Color(0xFFB4DCCC),
              size: 34,
            ),
            onPressed: () {
              // Navigate to Favorite Page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FavoritePage()),
              );
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.person_outline,
              color: Color(0xFFB4DCCC),
              size: 34,
            ),
            onPressed: () {
              // Navigate to Profile Page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
