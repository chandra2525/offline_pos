import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:point_of_sales/widget/textinputdecor.dart';
import '../models/product_model.dart';
import '../models/stock_history_model.dart';

class StockController extends GetxController {
  var products = <Product>[].obs;
  var stockHistory = <StockHistory>[].obs;
  final box = GetStorage();
  var searchController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    loadProducts();
    loadStockHistory();
  }

  void searchProduct() {
    loadProducts();
    String query = searchController.text.toLowerCase();

    products.value = products.where((product) {
      return product.name.toLowerCase().contains(query) ||
          product.barcode.contains(query);
    }).toList();

    if (products.isEmpty) {
      Get.snackbar(
        'No Results',
        'No products found for "$query".',
        duration: const Duration(seconds: 1),
      );
    }
  }

  void loadProducts() {
    List<dynamic> storedProducts = box.read<List<dynamic>>('products') ?? [];
    products.value =
        storedProducts.map((item) => Product.fromJson(item)).toList();
  }

  void loadStockHistory() {
    List<dynamic> storedHistory =
        box.read<List<dynamic>>('stock_history') ?? [];
    stockHistory.value =
        storedHistory.map((item) => StockHistory.fromJson(item)).toList();
  }

  void addStock(String productId, int quantity) {
    int index = products.indexWhere((product) => product.id == productId);

    if (index != -1) {
      products[index].stock += quantity;
      products.refresh();

      saveProducts();

      addToStockHistory(productId, quantity, 'Added');
    } else {
      Get.snackbar('Error', 'Product not found.');
    }
  }

  void addToStockHistory(String productId, int quantity, String type) {
    StockHistory historyEntry = StockHistory(
      productId: productId,
      quantity: quantity,
      type: type,
      date: DateTime.now(),
    );
    stockHistory.add(historyEntry);

    saveStockHistory();
  }

  void saveProducts() {
    List<Map<String, dynamic>> productsData =
        products.map((product) => product.toJson()).toList();
    box.write('products', productsData);
  }

  void saveStockHistory() {
    List<Map<String, dynamic>> historyData =
        stockHistory.map((history) => history.toJson()).toList();
    box.write('stock_history', historyData);
  }

  List<StockHistory> getStockHistoryByProductId(String productId) {
    return stockHistory
        .where((history) => history.productId == productId)
        .toList();
  }

  void showAddStockDialog(String productId) {
    Get.defaultDialog(
      backgroundColor: Colors.white,
      title: 'Add Stock',
      titleStyle:
          GoogleFonts.poppins(color: const Color(0xff865439), fontSize: 16),
      content: Column(
        children: [
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Stock cannot empty';
              } else {
                return null;
              }
            },
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            cursorColor: const Color(0xFF865439),
            maxLength: 100,
            controller: quantityController,
            style: GoogleFonts.poppins(
                fontSize: 14,
                color: const Color(0xFF865439),
                fontWeight: FontWeight.w500),
            decoration: textInputDecorationForm.copyWith(
              hintText: 'Quantity',
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF865439),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
            ),
            onPressed: () {
              int quantity = int.parse(quantityController.text);
              addStock(productId, quantity);
              quantityController.clear();
              Get.back();
            },
            child: Text(
              "Add",
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  void alertDialogHapus() {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          backgroundColor: const Color(0xff865439),
          title: Text(
            "Delete this stock report?",
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
              },
            ),
          ],
        );
      },
    );
  }
}
