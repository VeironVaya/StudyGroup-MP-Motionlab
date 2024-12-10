import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  final List<Map<String, dynamic>> products = [
    {
      'image': 'assets/images/imband.png',
      'title': 'Mi Band 8 Pro',
      'price': '\$54.00',
      'icon': Icons.favorite,
      'iconColor': Colors.red,
    },
    {
      'image': 'assets/images/shirt.png',
      'title': 'Lycra Men’s shirt',
      'price': '\$12.00',
      'icon': Icons.favorite_border,
      'iconColor': Colors.grey,
    },
    {
      'image': 'assets/images/headphone.png',
      'title': 'Siberia 800',
      'price': '\$45.00',
      'icon': Icons.favorite_border,
      'iconColor': Colors.grey,
    },
    {
      'image': 'assets/images/shoe.png',
      'title': 'Strawberry Frappucino',
      'price': '\$35.00',
      'icon': Icons.favorite_border,
      'iconColor': Colors.grey,
    },
  ];

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
            Image.asset(
              'assets/extras/bag.png',
              height: 23,
              width: 23,
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 18),
                child: Text(
                  "Our way of loving\nyou back",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 29),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: 370,
              height: 65,
              decoration: BoxDecoration(
                color: Color(0xFFF2F2F2),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      size: 40,
                      color: Color(0xFF868A91),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Search",
                      style: TextStyle(
                        fontSize: 23,
                        color: Color(0xFF868A91),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 18),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        child: Center(
                          child: Text(
                            "All",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        width: 122,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Color(0xFF3A5A40),
                            borderRadius: BorderRadius.circular(25)),
                      ),
                      SizedBox(width: 5),
                      Container(
                        child: Center(
                          child: Text(
                            "Watch",
                            style: TextStyle(
                              color: Color(0xFF4D4D4D),
                              fontSize: 20,
                            ),
                          ),
                        ),
                        width: 122,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Color(0xFFF2F2F2),
                            borderRadius: BorderRadius.circular(25)),
                      ),
                      SizedBox(width: 5),
                      Container(
                        child: Center(
                          child: Text(
                            "Shirt",
                            style: TextStyle(
                              color: Color(0xFF4D4D4D),
                              fontSize: 20,
                            ),
                          ),
                        ),
                        width: 122,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Color(0xFFF2F2F2),
                            borderRadius: BorderRadius.circular(25)),
                      ),
                      SizedBox(width: 5),
                      Container(
                        child: Center(
                          child: Text(
                            "Shoes",
                            style: TextStyle(
                              color: Color(0xFF4D4D4D),
                              fontSize: 20,
                            ),
                          ),
                        ),
                        width: 122,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Color(0xFFF2F2F2),
                            borderRadius: BorderRadius.circular(25)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 18),
                child: Text(
                  "Our Best Seller",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: GridView.builder(
                  itemCount: products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.75,
                  ),
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/product_detailes');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFF5F5F5),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(15)),
                                child: Image.asset(
                                  product['image'],
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
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    product['price'],
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.green,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Icon(
                                      product['icon'],
                                      color: product['iconColor'],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFF00623B),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(
                Icons.home,
                color: Colors.white,
                size: 37,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.account_balance_wallet,
                color: Color(0xFFB4DCCC),
                size: 34,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.favorite,
                color: Color(0xFFB4DCCC),
                size: 34,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.notifications,
                color: Color(0xFFB4DCCC),
                size: 34,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
