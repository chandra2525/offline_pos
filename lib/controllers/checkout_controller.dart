// ignore_for_file: avoid_print

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';
import 'package:point_of_sales/controllers/payment_method.dart';
import 'package:point_of_sales/models/product_model.dart';
import '../models/cart_item_model.dart';
import '../service/receipt_service.dart';
import 'cart_controller.dart';

class CheckoutController extends GetxController {
  var selectedPaymentMethod = PaymentMethod.cash.obs;
  final TextEditingController enterPaymentController =
      TextEditingController(text: '0');

  RxDouble get totalPrice => Get.find<CartController>().totalPrice.obs;

  final CartController cartController = Get.find();
  var discount = 0.0.obs;
  var paidAmount = 0.0.obs;

  final box = GetStorage();

  var transactions = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadTransactions();
  }

  void processPayment(
      double paidAmount, double totalBill, PaymentMethod paymentMethod) {
    this.paidAmount.value = paidAmount;
    this.selectedPaymentMethod.value = paymentMethod;
    print("paidAmount : $paidAmount");
    print("totalPrice : ${totalPrice.value}");
    print("selectedPaymentMethod : ${selectedPaymentMethod.value}");

    if (paidAmount < totalBill
        // && paymentMethod == PaymentMethod.cash
        ) {
      Get.snackbar(
          'Payment Error', 'Paid amount is less than the total amount.');
      return;
    }

    switch (paymentMethod) {
      case PaymentMethod.cash:
        double change = paidAmount - totalBill;

        // Get.snackbar(
        //     'Payment Successful', 'Change: \$${change.toStringAsFixed(2)}');
        break;
      case PaymentMethod.creditCard:
        double change = paidAmount - totalBill;
        // Get.snackbar('Payment Successful', 'Paid by Credit Card');
        break;
      case PaymentMethod.debitCard:
        double change = paidAmount - totalBill;
        // Get.snackbar('Payment Successful', 'Paid by Debit Card');
        break;
      case PaymentMethod.eWallet:
        double change = paidAmount - totalBill;
        // Get.snackbar('Payment Successful', 'Paid by E-Wallet');
        break;
    }

    updateProductStock();

    saveTransaction(cartController.cartItems, totalBill);

    final receiptService = ReceiptService();
    // receiptService.printReceipt(cartController.cartItems, totalBill);
    print("paidAmount 2 : $paidAmount");
    print("totalPrice 2 : ${totalPrice.value}");
    print("selectedPaymentMethod 2 : ${selectedPaymentMethod.value}");

    Get.offNamed('/successful-transaction');
    Timer(const Duration(seconds: 2), () {
      clearCart();
    });

    print("paidAmount : $paidAmount");
    print("totalPrice : ${totalPrice.value}");
    print("selectedPaymentMethod : ${selectedPaymentMethod.value}");
  }

  void updateProductStock() {
    final cartItems = Get.find<CartController>().cartItems;

    for (var cartItem in cartItems) {
      cartItem.product.stock -= cartItem.quantity;
      saveProductToStorage(cartItem.product);
    }
  }

  void saveProductToStorage(Product product) {
    List<dynamic> storedProducts = box.read<List<dynamic>>('products') ?? [];

    int index = storedProducts.indexWhere((item) => item['id'] == product.id);
    if (index != -1) {
      storedProducts[index]['stock'] = product.stock;
    }

    box.write('products', storedProducts);
  }

  void clearCart() {
    Get.find<CartController>().clearCart();
  }

  void saveTransactions() {
    box.write('transactions', transactions.toList());
  }

  void saveTransaction(List<CartItem> cartItems, double totalBill) {
    final newTransaction = {
      'items': cartItems.map((item) => item.toJson()).toList(),
      'totalAmount': totalBill,
      'date': DateTime.now().toIso8601String(),
      'paidAmount': paidAmount.value,
      'paymentMethod': selectedPaymentMethod.value.toString(),
    };
    transactions.add(newTransaction);
    saveTransactions();
  }

  void loadTransactions() {
    final storedTransactions = box.read<List<dynamic>>('transactions') ?? [];
    transactions.value = storedTransactions
        .map((transaction) => Map<String, dynamic>.from(transaction))
        .toList();
  }

  void deleteTransaction(int index) {
    if (index >= 0 && index < transactions.length) {
      transactions.removeAt(index);
      saveTransactions();
    }
  }

  void clearAllTransactions() {
    transactions.clear();
    saveTransactions();
  }

  List<Map<String, dynamic>> getTransactionHistory() {
    return transactions;
  }

  String formatNumber(String s) {
    return NumberFormat.decimalPattern('id_ID').format(int.parse(s));
  }

  String currency() {
    return NumberFormat.compactSimpleCurrency(locale: 'id_ID').currencySymbol;
  }

  void alertDialogHapus(int index) {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          backgroundColor: const Color(0xff865439),
          title: Text(
            "Delete this sales report?",
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
                deleteTransaction(index);
                Get.back();
              },
            ),
          ],
        );
      },
    );
  }
}
