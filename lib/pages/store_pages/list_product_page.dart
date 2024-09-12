import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:point_of_sales/controllers/product_controller.dart';
import 'package:point_of_sales/pages/store_pages/detail_product_page.dart';
import 'package:point_of_sales/widget/textinputdecor.dart';

import 'package:fluttericon/font_awesome_icons.dart';

class ListProductPage extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
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
          "List Product",
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
            Get.toNamed('/add-product');
          },
          elevation: 0,
          label: Text(
            'Add New Product',
            style: GoogleFonts.poppins(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
          ),
          icon: const Icon(
            LineIcons.plus,
            color: Colors.white,
          ),
          backgroundColor: Colors.transparent,
        ),
      ),
      body: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 18),
              child: SizedBox(
                height: 45,
                child: TextFormField(
                  cursorColor: const Color(0xFF865439),
                  controller: productController.searchController,
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: const Color(0xFF865439),
                      fontWeight: FontWeight.w500),
                  onFieldSubmitted: (value) {
                    productController.searchProduct();
                  },
                  decoration: textInputDecorationForm2.copyWith(
                    hintText: 'Search name product',
                    suffixIcon: IconButton(
                      onPressed: () {
                        productController.searchProduct();
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
                padding: const EdgeInsets.only(
                    left: 18.0, right: 18, top: 18, bottom: 80),
                child: Theme(
                  data: Theme.of(context).copyWith(
                      scrollbarTheme: ScrollbarThemeData(
                    thumbColor:
                        WidgetStateProperty.all(const Color(0xff865439)),
                  )),
                  child: Scrollbar(
                    thickness: 2,
                    child: ListView.builder(
                        itemCount: productController.products.length,
                        itemBuilder: (context, index) {
                          final product = productController.products[index];
                          return Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 0, 0, 11),
                            child: AspectRatio(
                              aspectRatio:
                                  size.height * 0.8 / size.height * 4.2,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DetailProductPage(
                                            product, "product"),
                                      ));
                                },
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 0.0, right: 18),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 120,
                                              height: 120,
                                              child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                  child: Image.asset(
                                                      product.imagePath
                                                          .toString(),
                                                      fit: BoxFit.cover)),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                    product.name,
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: GoogleFonts.poppins(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: const Color(
                                                            0xFF492F10),
                                                        fontSize: 16),
                                                  ),
                                                  SizedBox(
                                                      height:
                                                          size.height * 0.005),
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        'Rp ${productController.formatNumber(product.price.toString().replaceAll('.', ''))}',
                                                        style: GoogleFonts.poppins(
                                                            color: const Color(
                                                                0xFF492F10),
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 14),
                                                      ),
                                                      const SizedBox(width: 12),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            GestureDetector(
                                              onTap: () async {
                                                Get.toNamed('/edit-product',
                                                    arguments: index);
                                              },
                                              child: const SizedBox(
                                                height: 35,
                                                width: 35,
                                                child: Icon(
                                                  LineIcons.edit,
                                                  color: Color(0xff865439),
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () async {
                                                productController
                                                    .alertDialogDelete(index);
                                              },
                                              child: const SizedBox(
                                                height: 35,
                                                width: 35,
                                                child: Icon(
                                                  LineIcons.trash,
                                                  color: Color(0xff865439),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
