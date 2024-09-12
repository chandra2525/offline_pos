import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:point_of_sales/controllers/product_controller.dart';
import 'package:point_of_sales/controllers/stock_controller.dart';
import 'package:point_of_sales/models/product_model.dart';
import 'package:point_of_sales/models/stock_history_model.dart';

class StockReportDetailPage extends StatelessWidget {
  final String productId;
  final StockController stockController = Get.find<StockController>();
  final ProductController productController = Get.find<ProductController>();

  StockReportDetailPage({required this.productId});

  @override
  Widget build(BuildContext context) {
    Product? product = productController.getProductById(productId);
    List<StockHistory> productHistory =
        stockController.getStockHistoryByProductId(productId);

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
          "Stock Report Detail",
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500, color: Colors.white, fontSize: 22),
        ),
        centerTitle: true,
        shape: const Border(
            bottom: BorderSide(color: Color(0xffD1D1D1), width: 1)),
      ),
      body: Theme(
        data: Theme.of(context).copyWith(
            scrollbarTheme: ScrollbarThemeData(
          thumbColor: WidgetStateProperty.all(const Color(0xff865439)),
        )),
        child: Scrollbar(
          thickness: 3,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18, top: 18),
                child: Text(
                  'Report Detail',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF492F10),
                      fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18, top: 15),
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 18, right: 18, top: 15, bottom: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'TRX0101211113',
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF492F10),
                                  fontSize: 14),
                            ),
                            Text(
                              "ADDDED",
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF492F10),
                                  fontSize: 14),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18, top: 18),
                child: Text(
                  'Product Detail',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF492F10),
                      fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 18.0, right: 18.0, top: 15.0, bottom: 12.0),
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 0.0, right: 18),
                    child: Row(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: 120,
                              height: 94,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: Image.asset(
                                      product!.imagePath.toString(),
                                      fit: BoxFit.cover)),
                            ),
                            SizedBox(
                              width: size.width * 0.038,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  product.name,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFF492F10),
                                      fontSize: 16),
                                ),
                                SizedBox(
                                  height: size.height * 0.005,
                                ),
                                Text(
                                  '${productController.formatNumber(product.price.toString().replaceAll('.', ''))}',
                                  style: GoogleFonts.poppins(
                                      color: const Color(0xFF492F10),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12),
                                ),
                                SizedBox(
                                  height: size.height * 0.003,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Stock : ${product.stock}",
                                      style: GoogleFonts.poppins(
                                          color: const Color(0xFF492F10),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12),
                                    ),
                                    SizedBox(width: 50.0),
                                    Text(
                                      "Category : ${product.category}",
                                      style: GoogleFonts.poppins(
                                          color: const Color(0xFF492F10),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: size.height * 0.003,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Barcode : ${product.barcode}",
                                      style: GoogleFonts.poppins(
                                          color: const Color(0xFF492F10),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18, top: 11),
                child: Text(
                  'Stock History',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF492F10),
                      fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18, top: 15),
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 18, right: 18, top: 15, bottom: 15),
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: productHistory.length,
                        itemBuilder: (context, index) {
                          final history = productHistory[index];
                          return Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${history.type} ${history.quantity}',
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xFF492F10),
                                            fontSize: 14),
                                      ),
                                      SizedBox(height: 8.0),
                                      Text(
                                        'Date: ${history.date.toLocal()}',
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xFF492F10),
                                            fontSize: 14),
                                      ),
                                    ],
                                  ),
                                  Icon(
                                    history.type == 'Added'
                                        ? Icons.add
                                        : Icons.remove,
                                    color: history.type == 'Added'
                                        ? Colors.green
                                        : Colors.red,
                                  ),
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.fromLTRB(0, 10, 0, 10.0),
                                child: Divider(
                                  height: 1.5,
                                  thickness: 0.5,
                                  color: Color(0xFF492F10),
                                ),
                              ),
                            ],
                          );
                        }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
