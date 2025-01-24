import 'package:get/get.dart';

class CartController extends GetxController {
  var quantityItem1 = 1.obs;
  var quantityItem2 = 1.obs;

  final double priceItem1 = 54.00;
  final double priceItem2 = 12.00;

  void incrementItem1() => quantityItem1.value++;
  void decrementItem1() => quantityItem1.value--;

  void incrementItem2() => quantityItem2.value++;
  void decrementItem2() => quantityItem2.value--;

  double get totalPrice =>
      (quantityItem1.value * priceItem1) + (quantityItem2.value * priceItem2);
}
