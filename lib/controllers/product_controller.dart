import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';
import '../models/product_model.dart';

class ProductController extends GetxController {
  var products = <Product>[].obs;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController barcodeController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController stockController = TextEditingController();
  var dropdownCategory = 'Food'.obs;
  var imagePath = ''.obs;

  final key = GlobalKey<FormState>();

  final storage = GetStorage();
  var searchController = TextEditingController();

  void loadProducts() {
    var savedProducts = storage.read<List>('products') ?? [];
    products.assignAll(savedProducts.map((e) => Product.fromJson(e)));
  }

  void addProduct(Product product) {
    products.add(product);
    saveProducts();
  }

  void updateProduct(int index, Product updatedProduct) {
    products[index] = updatedProduct;
    saveProducts();
  }

  void deleteProduct(int index) {
    products.removeAt(index);
    saveProducts();
  }

  void saveProducts() {
    storage.write('products', products.map((e) => e.toJson()).toList());
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

  Future<String?> pickImage(ImageSource imageSource) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: imageSource);
    if (image != null) {
      return image.path;
    }
    return null;
  }

  Product? getProductById(String productId) {
    try {
      return products.firstWhere((product) => product.id == productId);
    } catch (e) {
      return null;
    }
  }

  void alertDialogDelete(int index) {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          backgroundColor: const Color(0xff865439),
          title: Text(
            "Delete this product?",
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
                deleteProduct(index);
              },
            ),
          ],
        );
      },
    );
  }

  void alertDialogSource() {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          backgroundColor: const Color(0xff865439),
          title: Text(
            "Select photo source",
            style: GoogleFonts.poppins(color: Colors.white, fontSize: 16),
            textAlign: TextAlign.center,
          ),
          content: const Icon(
            LineIcons.image,
            color: Colors.white,
            size: 75,
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: const Color(0xFF865439),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
              ),
              onPressed: () async {
                Get.back();
                String? pickedImagePath = await pickImage(ImageSource.camera);
                if (pickedImagePath != null) {
                  imagePath.value = pickedImagePath;
                }
              },
              child: Text(
                "Camera",
                style: GoogleFonts.poppins(
                  color: const Color(0xFF865439),
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: const Color(0xFF865439),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
              ),
              onPressed: () async {
                Get.back();
                String? pickedImagePath = await pickImage(ImageSource.gallery);
                if (pickedImagePath != null) {
                  imagePath.value = pickedImagePath;
                }
              },
              child: Text(
                "Gallery",
                style: GoogleFonts.poppins(color: const Color(0xFF865439)),
              ),
            ),
          ],
        );
      },
    );
  }

  void alertDialogImage() {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          backgroundColor: const Color(0xff865439),
          title: Text(
            "Image has not been selected",
            style: GoogleFonts.poppins(color: Colors.white, fontSize: 16),
            textAlign: TextAlign.center,
          ),
          content: const Icon(
            LineIcons.image,
            color: Colors.white,
            size: 75,
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: const Color(0xFF865439),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
              ),
              onPressed: () async {
                Get.back();
              },
              child: Text(
                "Close",
                style: GoogleFonts.poppins(color: const Color(0xFF865439)),
              ),
            ),
          ],
        );
      },
    );
  }

  String formatNumber(String s) {
    return NumberFormat.decimalPattern('id_ID').format(int.parse(s));
  }

  String currency() {
    return NumberFormat.compactSimpleCurrency(locale: 'id_ID').currencySymbol;
  }

  void emptyTextController() {
    nameController.text = '';
    priceController.text = '';
    barcodeController.text = '';
    descriptionController.text = '';
    stockController.text = '';
    dropdownCategory.value = 'Food';
    imagePath.value = '';
  }
}
