import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:point_of_sales/controllers/payment_method.dart';
import 'package:point_of_sales/widget/textinputdecor.dart';
import '../../controllers/checkout_controller.dart';

class CheckoutPage extends StatelessWidget {
  final CheckoutController controller = Get.put(CheckoutController());

  @override
  Widget build(BuildContext context) {
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
        // backgroundColor: Colors.white,
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
          "Payment Method",
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
            Radius.circular(12.0),
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
              borderRadius: BorderRadius.all(Radius.circular(12.0))),
          splashColor: Colors.brown,
          onPressed: () async {
            double paidAmount = double.parse(int.parse((controller
                    .enterPaymentController.text
                    .replaceAll('.', '')
                    .trim()))
                .toString());
            PaymentMethod paymentMethod =
                controller.selectedPaymentMethod.value;
            double totalBill = controller.totalPrice.value;

            controller.processPayment(paidAmount, totalBill, paymentMethod);
          },
          elevation: 0,
          label: Text(
            'Checkout',
            style: GoogleFonts.poppins(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
          ),
          icon: const Icon(
            LineIcons.shoppingCart,
            color: Colors.white,
          ),
          backgroundColor: Colors.transparent,
        ),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(18.0, 12.0, 18.0, 12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total bill :',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: const Color(0xff865439),
                    ),
                  ),
                  Text(
                    'Total : Rp ${controller.formatNumber((controller.totalPrice.toInt()).toString())}',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 22,
                      color: const Color(0xff865439),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            child: Column(
              children: [
                Divider(
                  height: 1,
                  thickness: 1,
                  color: Colors.white.withOpacity(0.8),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0.0),
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                      child: Text(
                        'Enter Payment',
                        style: GoogleFonts.poppins(
                            color: const Color(0xFF492F10),
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    TextFormField(
                      autofocus: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter payment cannot empty';
                        } else {
                          return null;
                        }
                      },
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      keyboardType: TextInputType.number,
                      controller: controller.enterPaymentController,
                      cursorColor: const Color(0xFF865439),
                      maxLength: 10,
                      onChanged: (string) {
                        string =
                            ' ${controller.formatNumber(string.replaceAll('.', ''))}';
                        controller.enterPaymentController.value =
                            TextEditingValue(
                          text: string,
                          selection:
                              TextSelection.collapsed(offset: string.length),
                        );
                      },
                      style: GoogleFonts.poppins(
                          fontSize: 24,
                          color: const Color(0xFF865439),
                          fontWeight: FontWeight.w500),
                      decoration: textInputDecorationPrice.copyWith(
                          hintText: ' 0',
                          counterText: '',
                          prefixText: controller.currency()),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Obx(
            () => Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                      child: Text(
                        'Payment Method',
                        style: GoogleFonts.poppins(
                            color: const Color(0xFF492F10),
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Column(
                      children: PaymentMethod.values.map((method) {
                        return RadioListTile<PaymentMethod>(
                          title: Text(_getPaymentMethodLabel(method)),
                          value: method,
                          groupValue: controller.selectedPaymentMethod.value,
                          onChanged: (PaymentMethod? value) {
                            controller.selectedPaymentMethod.value = value!;
                          },
                          activeColor: const Color(0xFF865439),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

String _getPaymentMethodLabel(PaymentMethod method) {
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
