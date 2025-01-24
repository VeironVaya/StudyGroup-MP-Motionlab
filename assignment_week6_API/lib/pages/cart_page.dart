import 'package:assignment_week2_slicing_ui/util/custom_button_util.dart';
import 'package:assignment_week2_slicing_ui/util/custom_cart_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:assignment_week2_slicing_ui/controllers/cart_controller.dart';
import 'package:assignment_week2_slicing_ui/pages/invoice_page.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.put(CartController());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Cart",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          CustomCartItem(
            image: 'assets/images/imband.png',
            name: "Mi Band 8 Pro - Brand New",
            price: "\$54.00",
            quantity: cartController.quantityItem1,
            onIncrement: cartController.incrementItem1,
            onDecrement: cartController.decrementItem1,
          ),
          const SizedBox(height: 20),
          CustomCartItem(
            image: 'assets/images/shirt.png',
            name: "Lycra Men's shirt",
            price: "\$12.00",
            quantity: cartController.quantityItem2,
            onIncrement: cartController.incrementItem2,
            onDecrement: cartController.decrementItem2,
          ),
          const Spacer(),
          Obx(() => Text(
                "Total: \$${cartController.totalPrice.toStringAsFixed(2)}",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )),
          const SizedBox(height: 10),
          CustomButtonUtil(
            label: "Buy Now",
            function: () {
              Navigator.pushNamed(
                context,
                '/invoice',
                arguments: cartController.totalPrice,
              );
            },
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
