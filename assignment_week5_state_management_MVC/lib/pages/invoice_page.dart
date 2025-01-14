// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:assignment_week2_slicing_ui/util/custom_button_util.dart';
import 'package:assignment_week2_slicing_ui/util/custom_detail_row_util.dart';
import 'package:flutter/material.dart';

class InvoicePage extends StatelessWidget {
  const InvoicePage({super.key});

  @override
  Widget build(BuildContext context) {
    final totalPrice =
        ModalRoute.of(context)?.settings.arguments as double? ?? 0.0;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Invoice",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/extras/success_icon.png',
              height: 63,
              width: 63,
            ),
            const SizedBox(height: 10),
            const Text("Transaction Success", style: TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text(
              "\$${totalPrice.toStringAsFixed(2)}",
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Card(
              margin: const EdgeInsets.all(16.0),
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomDetailRow(
                        title: "Invoice Number", value: "000085752257"),
                    CustomDetailRow(
                        title: "Transaction Date", value: "18th December 2024"),
                    CustomDetailRow(
                        title: "Payment Method", value: "Bank Transfer"),
                  ],
                ),
              ),
            ),
            SizedBox(height: 37),
            Card(
              margin: const EdgeInsets.all(16.0),
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Detail Pesanan",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                    SizedBox(height: 10),
                    CustomDetailRow(
                        title: "Order Name", value: "Veiron Vaya Yarief"),
                    CustomDetailRow(
                        title: "Order Email",
                        value: "veironvayayarief41@gmail.com"),
                    CustomDetailRow(
                        title: "Total Price", value: "\$${totalPrice}.00"),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            CustomButtonUtil(
              label: "Back to Home",
              function: () {
                Navigator.pushNamed(context, '/home');
              },
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
