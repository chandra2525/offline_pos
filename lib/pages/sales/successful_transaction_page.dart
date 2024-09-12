import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:point_of_sales/controllers/cart_controller.dart';
import 'package:point_of_sales/controllers/checkout_controller.dart';
import 'package:point_of_sales/controllers/payment_method.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class SuccessfulTransactionPage extends StatelessWidget {
  final CheckoutController checkoutController = Get.find();
  final CartController cartController = Get.find();
  final screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Color(0xFF865439),
            Color(0xFF492F10),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: ListView(
          children: [
            Column(
              children: [
                Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.2),
                          spreadRadius: -65,
                          blurRadius: 1,
                          offset: const Offset(0, 50),
                        ),
                        const BoxShadow(
                          color: Color(0xFFDFBB9D),
                          spreadRadius: -65,
                          blurRadius: 0,
                          offset: Offset(0, 48),
                        ),
                        BoxShadow(
                          color: Colors.white.withOpacity(0.2),
                          spreadRadius: -50,
                          blurRadius: 1,
                          offset: const Offset(0, 24),
                        ),
                        const BoxShadow(
                          color: Color(0xFFDFBB9D),
                          spreadRadius: -50,
                          blurRadius: 0,
                          offset: Offset(0, 22),
                        ),
                      ],
                    ),
                    child: buildTransaction()),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 34.0, right: 34.0, bottom: 20.0, top: 30),
                  child: SizedBox(
                    width: double.infinity,
                    height: 57,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 120, 76, 52),
                        side: const BorderSide(
                          width: 2,
                          color: Colors.white,
                        ),
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      onPressed: () async {
                        final image = await screenshotController
                            .captureFromWidget(buildTransaction());
                        final time = DateTime.now()
                            .toIso8601String()
                            .replaceAll('.', '-')
                            .replaceAll(':', '-');
                        // final name = 'screenshot_$time';
                        final directory =
                            await getApplicationDocumentsDirectory();
                        final image2 = File(
                            '${directory.path}/OfflinePOS transaction id_transaksi $time.png');
                        image2.writeAsBytesSync(image);

                        await Share.shareFiles([image2.path]);
                      },
                      child: Text(
                        "SEND RECEIPT",
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 34.0, right: 34.0),
                  child: Container(
                    width: double.infinity,
                    height: 57,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      onPressed: () {
                        Get.back();
                        Get.back();
                      },
                      child: Text(
                        "NEXT ORDER",
                        style: GoogleFonts.poppins(
                            color: const Color(0xFF865439),
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTransaction() {
    return Padding(
      padding:
          const EdgeInsets.only(left: 34.0, top: 40, right: 34.0, bottom: 40),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
          color: Colors.white,
        ),
        height: 500,
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(83, 31, 83, 21),
              child: SvgPicture.asset(
                'assets/images/phone.svg',
              ),
            ),
            Text(
              'Successful Transaction!',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF865439),
                  fontSize: 22),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 11, 0, 10),
              child: Text(
                'NOTE: Do not forget to give smile to\ncustomers.',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF492F10),
                    fontSize: 12),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(49, 11, 49, 0),
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color(0xFF865439),
                      Color(0xFF492F10),
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 12, 0, 12.0),
                  child: Column(
                    children: [
                      Text(
                        'Method Payment :  ${getPaymentMethodLabel(checkoutController.selectedPaymentMethod.value)}',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontSize: 14),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(17, 10, 17, 10.0),
                        child: Divider(
                          height: 1,
                          thickness: 0.5,
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                      Text(
                        'Total Bill : Rp ${cartController.totalPrice.toStringAsFixed(2)}',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontSize: 14),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(17, 10, 17, 10.0),
                        child: Divider(
                          height: 2,
                          thickness: 0.5,
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                      Text(
                        'Money Payment : Rp ${checkoutController.paidAmount.value.toStringAsFixed(2)}',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontSize: 14),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(17, 10, 17, 10.0),
                        child: Divider(
                          height: 2,
                          thickness: 0.5,
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                      Text(
                        'Money Changes : Rp ${getChangeAmount()}',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  String getPaymentMethodLabel(PaymentMethod method) {
    switch (method) {
      case PaymentMethod.cash:
        return 'Cash';
      case PaymentMethod.creditCard:
        return 'Credit Card';
      case PaymentMethod.debitCard:
        return 'Debit Card';
      case PaymentMethod.eWallet:
        return 'E-Wallet';
      default:
        return 'Unknown';
    }
  }

  String getChangeAmount() {
    // if (checkoutController.selectedPaymentMethod == PaymentMethod.cash) {
    double change = checkoutController.paidAmount.value -
        checkoutController.totalPrice.value;
    return change >= 0 ? change.toStringAsFixed(2) : '0.00';
    // }
    // return '0.00';
  }
}
