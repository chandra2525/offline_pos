import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:point_of_sales/controllers/checkout_controller.dart';

class SalesReportDetailPage extends StatelessWidget {
  final Map<String, dynamic> transaction;
  SalesReportDetailPage({super.key, required this.transaction});

  final CheckoutController checkoutController = Get.put(CheckoutController());

  @override
  Widget build(BuildContext context) {
    final List<dynamic> items = transaction['items'];
    final double totalAmount = transaction['totalAmount'];
    final double paidAmount = transaction['paidAmount'] ?? 0.0;
    final String date = transaction['date'];
    final formattedDate =
        DateFormat('yyyy-MM-dd HH:mm').format(DateTime.parse(date));
    final String paymentMethod = transaction['paymentMethod'] ?? "";
    final String paymentMethodText = paymentMethod == "PaymentMethod.cash"
        ? "Cash"
        : paymentMethod == "PaymentMethod.creditCard"
            ? "Credit Card"
            : paymentMethod == "PaymentMethod.debitCard"
                ? "Debit Card"
                : paymentMethod == "PaymentMethod.eWallet"
                    ? "E-Wallet"
                    : "";

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
          "Sales Report Detail",
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
                              "PAID OFF",
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF492F10),
                                  fontSize: 14),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 10.0),
                          child: Divider(
                            height: 1,
                            thickness: 0.5,
                            color: Color(0xFF492F10),
                          ),
                        ),
                        Text(
                          formattedDate,
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF492F10),
                              fontSize: 14),
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
                padding: const EdgeInsets.only(left: 18.0, right: 18, top: 15),
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index];
                      final total = item['product']['price'] * item['quantity'];
                      return Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 11),
                        child: AspectRatio(
                          aspectRatio: size.height * 0.97 / size.height * 5,
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 0.0, right: 18),
                              child: Row(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      SizedBox(
                                        width: 120,
                                        height: 94,
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            child: Image.asset(
                                                item['product']['imagePath'],
                                                fit: BoxFit.cover)),
                                      ),
                                      SizedBox(
                                        width: size.width * 0.038,
                                      ),
                                      AspectRatio(
                                        aspectRatio: size.height *
                                            0.97 /
                                            size.height *
                                            2.2,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              item['product']['name'],
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      const Color(0xFF492F10),
                                                  fontSize: 16),
                                            ),
                                            SizedBox(
                                              height: size.height * 0.005,
                                            ),
                                            Text(
                                              '${item['quantity']}'
                                              " x Rp"
                                              '${checkoutController.formatNumber(item['product']['price'].toString().replaceAll('.', ''))}',
                                              style: GoogleFonts.poppins(
                                                  color:
                                                      const Color(0xFF492F10),
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12),
                                            ),
                                            SizedBox(
                                              height: size.height * 0.003,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "Total : Rp${checkoutController.formatNumber(total.toString().replaceAll('.', ''))}",
                                                  style: GoogleFonts.poppins(
                                                      color: const Color(
                                                          0xFF492F10),
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 12),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18, top: 11),
                child: Text(
                  'Payment Detail',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF492F10),
                      fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 18.0, right: 18, top: 15, bottom: 18),
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
                        Text(
                          'Method Payment : $paymentMethodText',
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF492F10),
                              fontSize: 14),
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 10.0),
                          child: Divider(
                            height: 1.5,
                            thickness: 0.5,
                            color: Color(0xFF492F10),
                          ),
                        ),
                        Text(
                          // 'Total Bill : Rp' +
                          //     '${checkoutController.formatNumber(totalAmount.toString().replaceAll('.', ''))}',
                          'Total Bill : Rp$totalAmount',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF492F10),
                              fontSize: 14),
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 10.0),
                          child: Divider(
                            height: 2,
                            thickness: 0.5,
                            color: Color(0xFF492F10),
                          ),
                        ),
                        Text(
                          // 'Money Payment : Rp' +
                          //     '${checkoutController.formatNumber(paidAmount.toString().replaceAll('.', ''))}',
                          'Money Payment : Rp$paidAmount',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF492F10),
                              fontSize: 14),
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 10.0),
                          child: Divider(
                            height: 1.5,
                            thickness: 0.5,
                            color: Color(0xFF492F10),
                          ),
                        ),
                        Text(
                          // 'Money Changes : Rp' +
                          //     '${checkoutController.formatNumber((paidAmount - totalAmount).toString().replaceAll('.', ''))}',
                          'Money Changes : Rp${paidAmount - totalAmount}',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF492F10),
                              fontSize: 14),
                        ),
                      ],
                    ),
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
