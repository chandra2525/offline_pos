import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';
import '../models/cart_item_model.dart';

class CartController extends GetxController {
  final TextEditingController disconController = TextEditingController();
  var cartItems = <CartItem>[].obs;
  var totalDiscount = 0.0.obs;
  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    loadCartFromStorage();
  }

  void clearCart() {
    cartItems.clear();
    saveCartToStorage();
  }

  void saveCartToStorage() {
    List<Map<String, dynamic>> cartData =
        cartItems.map((item) => item.toJson()).toList();
    box.write('cart', cartData);
  }

  void loadCartFromStorage() {
    List<dynamic> storedCart = box.read<List<dynamic>>('cart') ?? [];
    cartItems.value =
        storedCart.map((item) => CartItem.fromJson(item)).toList();
  }

  void addDiscount(double discount) {
    totalDiscount.value = discount;
  }

  double get totalPrice {
    return cartItems.fold(
            0,
            (sum, item) => int.parse(
                (sum + (item.product.price * item.quantity)).toString())) -
        totalDiscount.value;
  }

  void increaseQuantity(CartItem item) {
    item.quantity++;
    cartItems.refresh();
    saveCartToStorage();
  }

  void decreaseQuantity(CartItem item) {
    if (item.quantity > 1) {
      item.quantity--;
      cartItems.refresh();
    }
    saveCartToStorage();
  }

  void removeFromCart(CartItem item) {
    cartItems.remove(item);
    saveCartToStorage();
  }

  String formatNumber(String s) {
    return NumberFormat.decimalPattern('id_ID').format(int.parse(s));
  }

  String currency() {
    return NumberFormat.compactSimpleCurrency(locale: 'id_ID').currencySymbol;
  }

  void alertDialogHapus(CartItem cartItem) {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          backgroundColor: const Color(0xff865439),
          title: Text(
            "Delete this product from cart?",
            style: GoogleFonts.poppins(color: Colors.white, fontSize: 16),
            textAlign: TextAlign.center,
          ),
          content: const Icon(
            LineIcons.trash,
            color: Colors.white,
            size: 75,
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
              ),
              child: Text(
                "No",
                style: GoogleFonts.poppins(
                  color: const Color(0xFF865439),
                ),
              ),
              onPressed: () {
                Get.back();
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
              ),
              child: Text(
                "Yes",
                style: GoogleFonts.poppins(
                  color: const Color(0xFF865439),
                ),
              ),
              onPressed: () {
                Get.back();
                removeFromCart(cartItem);
              },
            ),
          ],
        );
      },
    );
  }
}
