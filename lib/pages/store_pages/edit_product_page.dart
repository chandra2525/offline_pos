import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:point_of_sales/controllers/product_controller.dart';
import 'package:point_of_sales/models/product_model.dart';
import 'package:point_of_sales/widget/textinputdecor.dart';

class EditProductPage extends StatelessWidget {
  final ProductController productController = Get.find();
  final int index = Get.arguments;

  @override
  Widget build(BuildContext context) {
    final product = productController.products[index];
    productController.nameController.text = product.name;
    productController.priceController.text = product.price.toString();
    productController.dropdownCategory.value = product.category;
    productController.barcodeController.text = product.barcode;
    productController.descriptionController.text = product.description;
    productController.stockController.text = product.stock.toString();
    productController.imagePath.value = product.imagePath ?? '';
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.topRight,
                colors: <Color>[
                  Color(0xff865439),
                  Color(0xff492F10),
                ]),
          ),
        ),
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Entypo.left_open_mini,
            size: 32,
            color: Colors.white,
          ),
        ),
        title: Text(
          "Edit Product",
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500, color: Colors.white, fontSize: 22),
        ),
        centerTitle: true,
        shape: const Border(
            bottom: BorderSide(color: Color(0xffD1D1D1), width: 1)),
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.only(right: 4.0, left: 36),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
          gradient: LinearGradient(
            colors: [
              Color(0xff865439),
              Color(0xff492F10),
            ],
            begin: Alignment.topRight,
            end: Alignment.topLeft,
          ),
        ),
        width: double.infinity,
        height: 60,
        child: FloatingActionButton.extended(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0))),
          splashColor: Colors.brown,
          onPressed: () async {
            final form = productController.key.currentState;
            if (form!.validate()) {
              Product updatedProduct = Product(
                id: product.id,
                name: productController.nameController.text,
                price: int.parse((productController.priceController.text
                    .replaceAll('.', '')
                    .trim())),
                category: productController.dropdownCategory.value,
                barcode: productController.barcodeController.text,
                description: productController.descriptionController.text,
                stock: int.parse(productController.stockController.text),
                imagePath: productController.imagePath.value,
              );

              productController.updateProduct(index, updatedProduct);

              Get.back();
            }
          },
          elevation: 0,
          label: Text(
            'Update Product',
            style: GoogleFonts.poppins(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
          ),
          icon: const Icon(
            LineIcons.save,
            color: Colors.white,
          ),
          backgroundColor: Colors.transparent,
        ),
      ),
      body: Form(
        key: productController.key,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 12,
            ),
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 22.0, right: 22.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0, bottom: 10),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Product Name',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF865439),
                                  fontSize: 16),
                            ),
                          ),
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Product name cannot empty';
                            } else {
                              return null;
                            }
                          },
                          controller: productController.nameController,
                          cursorColor: const Color(0xFF865439),
                          maxLength: 100,
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: const Color(0xFF865439),
                              fontWeight: FontWeight.w500),
                          decoration: textInputDecorationForm.copyWith(
                            hintText: 'Enter product name...',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Category',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF865439),
                                  fontSize: 16),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: DropdownButtonFormField(
                            decoration: textInputDecorationForm.copyWith(
                                hintText: "Choose category"),
                            onChanged: (String? newValue) {
                              productController.dropdownCategory.value =
                                  newValue!;
                            },
                            value: productController.dropdownCategory.value,
                            style: GoogleFonts.poppins(
                                fontSize: 15,
                                color: const Color(0xFF865439),
                                fontWeight: FontWeight.w500),
                            items: <String>[
                              'Food',
                              'Drinks',
                              'Snack',
                              'Dessert',
                              'Cake',
                              'Set Menu'
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      color: const Color(0xFF865439),
                                      fontWeight: FontWeight.w500),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Price',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF865439),
                                  fontSize: 16),
                            ),
                          ),
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Price cannot empty';
                            } else {
                              return null;
                            }
                          },
                          cursorColor: const Color(0xFF865439),
                          maxLength: 10,
                          controller: productController.priceController,
                          onChanged: (string) {
                            string =
                                ' ${productController.formatNumber(string.replaceAll('.', ''))}';
                            productController.priceController.value =
                                TextEditingValue(
                              text: string,
                              selection: TextSelection.collapsed(
                                  offset: string.length),
                            );
                          },
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: const Color(0xFF865439),
                              fontWeight: FontWeight.w500),
                          decoration: textInputDecorationForm.copyWith(
                            hintText: ' 0',
                            prefixText: productController.currency(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Stock',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF865439),
                                  fontSize: 16),
                            ),
                          ),
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Stock cannot empty';
                            } else {
                              return null;
                            }
                          },
                          controller: productController.stockController,
                          cursorColor: const Color(0xFF865439),
                          maxLength: 100,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: const Color(0xFF865439),
                              fontWeight: FontWeight.w500),
                          decoration: textInputDecorationForm.copyWith(
                            hintText: 'Enter stock...',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Description',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF865439),
                                  fontSize: 16),
                            ),
                          ),
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Description cannot empty';
                            } else {
                              return null;
                            }
                          },
                          controller: productController.descriptionController,
                          maxLines: 4,
                          cursorColor: const Color(0xFF865439),
                          maxLength: 5000,
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: const Color(0xFF865439),
                              fontWeight: FontWeight.w500),
                          decoration: textInputDecorationForm.copyWith(
                            hintText: 'Enter description...',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Barcode',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF865439),
                                  fontSize: 16),
                            ),
                          ),
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Barcode cannot empty';
                            } else {
                              return null;
                            }
                          },
                          controller: productController.barcodeController,
                          cursorColor: const Color(0xFF865439),
                          maxLength: 100,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: const Color(0xFF865439),
                              fontWeight: FontWeight.w500),
                          decoration: textInputDecorationForm.copyWith(
                            hintText: 'Enter barcode...',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Product Image',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF865439),
                                  fontSize: 16),
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: const Color(0xFF865439),
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(16))),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(15, 15, 15, 10),
                                child: Column(
                                  children: [
                                    Obx(
                                      () => GestureDetector(
                                        onTap: () {
                                          productController.alertDialogSource();
                                          ();
                                        },
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                            child: Image.file(
                                              File(productController
                                                  .imagePath.value),
                                              width: size.height * 0.256,
                                              height: size.height * 0.144,
                                              fit: BoxFit.cover,
                                            )),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 10, 0, 0),
                                      child: Text(
                                        'Select an image from the gallery to\nupload in landscape orientation',
                                        // 'Pilih gambar dari galeri untuk diupload\ndengan orientasi landscape',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.poppins(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xFF865439),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          90, 5, 90, 0),
                                      child: SizedBox(
                                        width: double.infinity,
                                        height: size.height * 0.045,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color(0xFF865439),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                          ),
                                          onPressed: () {
                                            productController
                                                .alertDialogSource();
                                          },
                                          child: Text(
                                            "Select Image",
                                            style: GoogleFonts.poppins(
                                                color: Colors.white,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.13,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
