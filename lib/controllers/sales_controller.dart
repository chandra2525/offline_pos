import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sales/controllers/cart_controller.dart';
import 'package:point_of_sales/controllers/product_controller.dart';
import '../models/cart_item_model.dart';
import '../models/product_model.dart';

class SalesController extends GetxController {
  final CartController cartController = Get.put(CartController());
  final ProductController productController = Get.put(ProductController());
  var searchController = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  var dropdownValue = 'All Product'.obs;

  @override
  void onInit() {
    super.onInit();
    searchController = TextEditingController(text: '');
    productController.loadProducts();
  }

  void searchProduct() {
    productController.loadProducts();
    String query = searchController.text.toLowerCase();

    productController.products.value =
        productController.products.where((product) {
      return product.name.toLowerCase().contains(query) ||
          product.barcode.contains(query);
    }).toList();

    if (productController.products.isEmpty) {
      Get.snackbar(
        'No Results',
        'No products found for "$query".',
        duration: const Duration(seconds: 1),
      );
    }
  }

  void addToCart(Product product) {
    CartItem? existingItem = cartController.cartItems
        .firstWhereOrNull((item) => item.product.id == product.id);

    if (existingItem != null) {
      existingItem.quantity++;
      cartController.cartItems.refresh();
    } else {
      cartController.cartItems.add(CartItem(product: product));
    }

    cartController.saveCartToStorage();

    Get.snackbar(
      'Added to Cart',
      '${product.name} has been added to your cart.',
      duration: Duration(seconds: 1),
    );
  }
}
