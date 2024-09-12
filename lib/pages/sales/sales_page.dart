import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';
import 'package:point_of_sales/controllers/product_controller.dart';
import 'package:point_of_sales/pages/store_pages/detail_product_page.dart';
import 'package:point_of_sales/widget/drawer.dart';
import 'package:point_of_sales/widget/textinputdecor.dart';
import '../../controllers/sales_controller.dart';

class SalesPage extends StatelessWidget {
  final SalesController salesController = Get.put(SalesController());
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: salesController.scaffoldKey,
      drawer: DrawerAdmin(),
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
          onTap: () => salesController.scaffoldKey.currentState?.openDrawer(),
          child: const Icon(
            LineIcons.bars,
            size: 27,
            color: Colors.white,
          ),
        ),
        title: Text(
          "List Product",
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500, color: Colors.white, fontSize: 22),
        ),
        centerTitle: true,
        shape: const Border(
            bottom: BorderSide(color: Color(0xffD1D1D1), width: 1)),
        actions: <Widget>[
          SizedBox(
            width: 55,
            height: 55,
            child: InkWell(
              onTap: () {
                Get.toNamed('/cart-page');
              },
              child: const Icon(
                LineIcons.shoppingCart,
                size: 27,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(
            () => Container(
              width: double.infinity,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: DropdownButton<String>(
                  icon: const Icon(
                    Entypo.down_open_mini,
                    size: 18,
                    color: Colors.brown,
                  ),
                  underline: Container(),
                  value: salesController.dropdownValue.value,
                  items: <String>[
                    'All Product',
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
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          // ignore: prefer_const_constructors
                          color: Color(0xff865439),
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    salesController.dropdownValue.value = newValue!;
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 18),
            child: SizedBox(
              height: 45,
              child: TextFormField(
                controller: salesController.searchController,
                cursorColor: const Color(0xFF865439),
                style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: const Color(0xFF865439),
                    fontWeight: FontWeight.w500),
                onChanged: (value) {
                  // salesController.searchProduct();
                },
                onFieldSubmitted: (value) {
                  salesController.searchProduct();
                },
                decoration: textInputDecorationForm2.copyWith(
                  hintText: 'Search Name Product or Barcone',
                  suffixIcon: IconButton(
                    onPressed: () {
                      salesController.searchProduct();
                    },
                    icon: const Icon(
                      FontAwesome.search,
                      color: Color(0xFF865439),
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 18.0, 16.0, 0.0),
            child: Theme(
              data: Theme.of(context).copyWith(
                  scrollbarTheme: ScrollbarThemeData(
                thumbColor: WidgetStateProperty.all(const Color(0xff865439)),
              )),
              child: Scrollbar(
                thickness: 2,
                child: GridView.builder(
                    itemCount: productController.products.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                      childAspectRatio: 0.63,
                    ),
                    itemBuilder: (context, index) {
                      final product = productController.products[index];
                      const locale = 'id_ID';
                      String formatNumber(String s) =>
                          NumberFormat.decimalPattern(locale)
                              .format(int.parse(s));
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DetailProductPage(product, "sale"),
                              ));
                        },
                        child: Card(
                          color: Colors.transparent,
                          elevation: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 180,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                          image: FileImage(
                                            File(product.imagePath.toString()),
                                          ),
                                          fit: BoxFit.cover)),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 8, 10, 5),
                                  child: Text(product.name,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xff492F10),
                                          fontSize: 16)),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 10, 5),
                                  child: Text(product.description,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(
                                          height: 1.25,
                                          fontWeight: FontWeight.w400,
                                          color: const Color.fromARGB(
                                              255, 101, 101, 101),
                                          fontSize: 12)),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 8, 10, 8),
                                      child: Text(
                                          'Rp ${formatNumber(product.price.toString().replaceAll('.', ''))}',
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0xff865439),
                                              fontSize: 14)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 0, 10, 0),
                                      child: Ink(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            gradient: const LinearGradient(
                                              begin: Alignment.topRight,
                                              end: Alignment.bottomLeft,
                                              colors: [
                                                Color(0xff865439),
                                                Color(0xff492F10),
                                              ],
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(.1),
                                                blurRadius: 2.0,
                                                spreadRadius: .05,
                                              ),
                                            ],
                                          ),
                                          child: InkWell(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: const Center(
                                                  child: Padding(
                                                padding: EdgeInsets.all(3.0),
                                                child: Icon(
                                                  Entypo.plus,
                                                  size: 22,
                                                  color: Colors.white,
                                                ),
                                              )),
                                              onTap: () => salesController
                                                  .addToCart(product)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ),
          )),
        ],
      ),
    );
  }
}
