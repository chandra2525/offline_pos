import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:point_of_sales/controllers/detail_product_controller.dart';
import 'package:point_of_sales/controllers/sales_controller.dart';
import 'package:point_of_sales/models/product_model.dart';

class DetailProductPage extends StatelessWidget {
  final Product product;
  final String type;
  DetailProductPage(this.product, this.type);

  final DetailProductController detailProductController =
      Get.put(DetailProductController());
  final SalesController salesController = Get.put(SalesController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFF865439),
      bottomSheet: Container(
        width: double.infinity,
        color: type == "product"
            ? const Color(0xFF865439)
            : const Color.fromARGB(231, 134, 84, 57),
        height: size.height * 0.08,
        child: type == "product"
            ? Container()
            : Padding(
                padding: const EdgeInsets.only(
                    left: 25.0, right: 25.0, top: 14, bottom: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(
                      () => Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            )),
                        child: Row(
                          children: [
                            IconButton(
                              splashColor: Colors.red,
                              onPressed: detailProductController.decrement,
                              icon: const Icon(
                                LineIcons.minus,
                                color: Color(0xFF865439),
                                size: 20,
                              ),
                            ),
                            Text(
                              detailProductController.banyak.toString(),
                              style: GoogleFonts.poppins(
                                  color: const Color(0xFF865439),
                                  fontWeight: FontWeight.w600),
                            ),
                            IconButton(
                              onPressed: detailProductController.increment,
                              icon: const Icon(
                                LineIcons.plus,
                                color: Color(0xFF865439),
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        foregroundColor: Colors.black12,
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      onPressed: () {
                        salesController.addToCart(product);
                      },
                      child: Row(
                        children: [
                          const Icon(
                            LineIcons.addToShoppingCart,
                            color: Color(0xFF865439),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            "Add to cart",
                            style: GoogleFonts.poppins(
                                color: const Color(0xFF865439),
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: size.height * 0.5,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    product.imagePath.toString(),
                  ),
                  fit: BoxFit.cover),
            ),
            child: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(9),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.7),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(8.0),
                            )),
                        child: const Icon(
                          Icons.arrow_back_ios_rounded,
                          size: 19,
                          color: Color(0xFF865439),
                        ),
                      ),
                    ),
                    type == "product"
                        ? Container()
                        : InkWell(
                            onTap: () {
                              Get.toNamed('/cart-page');
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.7),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(8.0),
                                  )),
                              child: const Icon(
                                LineIcons.shoppingCart,
                                color: Color(0xFF865439),
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: size.height * 0.45),
            width: double.infinity,
            decoration: const BoxDecoration(
                color: Color(0xFF865439),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.0),
                  topRight: Radius.circular(24.0),
                )),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(25, 25, 25, 80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    child: Container(
                      width: 80,
                      height: 5,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(153, 255, 255, 255),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    product.name,
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 18,
                        height: 1.5,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            LineIcons.pizzaSlice,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            product.category,
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            LineIcons.coins,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            'Rp ${detailProductController.formatNumber(product.price.toString().replaceAll('.', ''))}',
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            LineIcons.mugHot,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            "${product.stock.toString()} stok",
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(
                        LineIcons.barcode,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        product.barcode,
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Text(
                    "Description",
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: Theme(
                      data: Theme.of(context).copyWith(
                          scrollbarTheme: ScrollbarThemeData(
                        thumbColor: WidgetStateProperty.all(Colors.white),
                      )),
                      child: Scrollbar(
                        thickness: 1,
                        child: SingleChildScrollView(
                          child: Text(
                            product.description,
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                height: 1.5,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
