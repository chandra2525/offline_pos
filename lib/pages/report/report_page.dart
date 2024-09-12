import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:point_of_sales/controllers/checkout_controller.dart';
import 'package:point_of_sales/controllers/stock_controller.dart';
import 'package:point_of_sales/widget/drawer.dart';

class ReportPage extends StatelessWidget {
  final CheckoutController checkoutController = Get.put(CheckoutController());
  final StockController stockController = Get.put(StockController());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final transactionHistory = checkoutController.transactions;
    return Scaffold(
      key: _scaffoldKey,
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
        // backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
          onTap: () => _scaffoldKey.currentState?.openDrawer(),
          child: const Icon(
            Entypo.menu,
            color: Colors.white,
          ),
        ),
        title: Text(
          "Report",
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
              child: const Icon(LineIcons.shoppingCart,
                  size: 27, color: Colors.white),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Report',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF492F10),
                  fontSize: 16),
            ),
            const SizedBox(
              height: 5,
            ),
            InkWell(
              onTap: () {
                Get.toNamed('/sales-report-page');
              },
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Sales Report',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF492F10),
                            fontSize: 16),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12.0, top: 12),
                        child: Row(
                          children: [
                            Text(
                              "${transactionHistory.length.toString()} Item",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF492F10),
                                  fontSize: 12),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Icon(
                              FontAwesome5.angle_right,
                              size: 18,
                              color: Colors.brown,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    height: 4,
                    thickness: 0.5,
                    color: Colors.black.withOpacity(0.3),
                    // indent: 32,
                    // endIndent: 32,
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Get.toNamed('/stock-report-page');
              },
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Stock Report',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF492F10),
                            fontSize: 16),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12.0, top: 12),
                        child: Row(
                          children: [
                            Text(
                              "${stockController.stockHistory.length.toString()} Item",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF492F10),
                                  fontSize: 12),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Icon(
                              FontAwesome5.angle_right,
                              size: 18,
                              color: Colors.brown,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    height: 4,
                    thickness: 0.5,
                    color: Colors.black.withOpacity(0.3),
                    // indent: 32,
                    // endIndent: 32,
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
