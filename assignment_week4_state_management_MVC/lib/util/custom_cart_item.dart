import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCartItem extends StatelessWidget {
  final String image;
  final String name;
  final String price;
  final RxInt quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const CustomCartItem({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: 70,
            width: 70,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  price,
                  style: const TextStyle(color: Color(0xFF00623B)),
                ),
              ],
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: onDecrement,
                icon: const Icon(Icons.remove),
                color: Color(0xFF00623B),
              ),
              Obx(() => Text(
                    "${quantity.value}",
                    style: const TextStyle(fontSize: 16),
                  )),
              IconButton(
                onPressed: onIncrement,
                icon: const Icon(Icons.add),
                color: Color(0xFF00623B),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
