// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';
import 'package:point_of_sales/controllers/checkout_controller.dart';
import 'package:point_of_sales/pages/report/sales_report_detail_page.dart';
import 'package:point_of_sales/widget/textinputdecor.dart';

class SalesReportPage extends StatelessWidget {
  final CheckoutController checkoutController = Get.put(CheckoutController());

  late String start_date, to_date;
  TextEditingController startinput = TextEditingController();
  TextEditingController toinput = TextEditingController();

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
          "Sales Report",
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500, color: Colors.white, fontSize: 22),
        ),
        centerTitle: true,
        shape: const Border(
            bottom: BorderSide(color: Color(0xffD1D1D1), width: 1)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  backgroundColor: Colors.white,
                  context: context,
                  builder: (BuildContext context) {
                    return SizedBox(
                      height: 300,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Filter Date',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFF492F10),
                                      fontSize: 22),
                                ),
                                InkWell(
                                  borderRadius: BorderRadius.circular(8),
                                  child: const Center(
                                      child: Icon(
                                    Icons.close_sharp,
                                    color: Color(0xFF492F10),
                                  )),
                                  onTap: () => Navigator.pop(context),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, bottom: 12),
                              child: Divider(
                                height: 4,
                                thickness: 0.5,
                                color: Colors.black.withOpacity(0.3),
                              ),
                            ),
                            Text(
                              'Choose date',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF492F10),
                                  fontSize: 16),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 7, top: 10),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Starting from',
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w400,
                                                color: const Color(0xFF492F10),
                                                fontSize: 12),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 150,
                                        child: TextFormField(
                                          textAlign: TextAlign.center,
                                          onSaved: (e) => start_date = e!,
                                          controller: startinput,
                                          style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              color: const Color(0xFF865439),
                                              fontWeight: FontWeight.w500),
                                          decoration:
                                              textInputDecorationForm2.copyWith(
                                            hintText: 'Pick date',
                                          ),
                                          readOnly: true,
                                          onTap: () async {
                                            DateTime? pickedDate =
                                                await showDatePicker(
                                              cancelText: 'Batal',
                                              confirmText: 'Pilih',
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime(2000),
                                              lastDate: DateTime(2101),
                                              builder: (context, child) {
                                                return Theme(
                                                  data: Theme.of(context)
                                                      .copyWith(
                                                    colorScheme:
                                                        const ColorScheme.light(
                                                      primary:
                                                          Color(0xff865439),
                                                      onSurface:
                                                          Color(0xFF492F10),
                                                    ),
                                                    textButtonTheme:
                                                        TextButtonThemeData(
                                                      style:
                                                          TextButton.styleFrom(
                                                        backgroundColor:
                                                            const Color(
                                                                0xff865439),
                                                      ),
                                                    ),
                                                  ),
                                                  child: child!,
                                                );
                                              },
                                            );

                                            if (pickedDate != null) {
                                              print(pickedDate);
                                              String formattedDate =
                                                  DateFormat('yyyy-MM-dd')
                                                      .format(pickedDate);
                                              print(formattedDate);

                                              startinput.text = formattedDate;
                                            } else {
                                              print("Date is not selected");
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(
                                            bottom: 10, top: 10),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            ' ',
                                          ),
                                        ),
                                      ),
                                      Text(
                                        '-',
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xFF492F10),
                                            fontSize: 16),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 7, top: 10),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'To',
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w400,
                                                color: const Color(0xFF492F10),
                                                fontSize: 12),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 150,
                                        child: TextFormField(
                                          textAlign: TextAlign.center,
                                          onSaved: (e) => to_date = e!,
                                          controller: toinput,
                                          style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              color: const Color(0xFF865439),
                                              fontWeight: FontWeight.w500),
                                          decoration:
                                              textInputDecorationForm2.copyWith(
                                            hintText: 'Pick date',
                                          ),
                                          readOnly: true,
                                          onTap: () async {
                                            DateTime? pickedDate =
                                                await showDatePicker(
                                              cancelText: 'Batal',
                                              confirmText: 'Pilih',
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime(2000),
                                              lastDate: DateTime(2101),
                                              builder: (context, child) {
                                                return Theme(
                                                  data: Theme.of(context)
                                                      .copyWith(
                                                    colorScheme:
                                                        const ColorScheme.light(
                                                      primary:
                                                          Color(0xff865439),
                                                      onSurface:
                                                          Color(0xFF492F10),
                                                    ),
                                                    textButtonTheme:
                                                        TextButtonThemeData(
                                                      style:
                                                          TextButton.styleFrom(
                                                        backgroundColor:
                                                            const Color(
                                                                0xff865439),
                                                      ),
                                                    ),
                                                  ),
                                                  child: child!,
                                                );
                                              },
                                            );

                                            if (pickedDate != null) {
                                              print(pickedDate);
                                              String formattedDate =
                                                  DateFormat('yyyy-MM-dd')
                                                      .format(pickedDate);
                                              print(formattedDate);

                                              toinput.text = formattedDate;
                                            } else {
                                              print("Date is not selected");
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 57,
                              decoration: BoxDecoration(
                                color: const Color(0xFF865439),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF865439),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                                onPressed: () {
                                  Get.snackbar(
                                    'Development',
                                    'Features in development',
                                    duration: const Duration(seconds: 1),
                                  );
                                },
                                child: Text(
                                  "Filter",
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            },
            child: Container(
              width: double.infinity,
              height: 54,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(top: 3, bottom: 3),
                child: Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            LineIcons.filter,
                            color: Colors.brown,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            'FIlter set date',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF492F10),
                                fontSize: 16),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 18.0),
                        child: Row(
                          children: [
                            Icon(
                              FontAwesome5.angle_right,
                              size: 18,
                              color: Colors.brown,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18, top: 18),
                child: Text(
                  'Sunday, 02 August 2020',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF492F10),
                      fontSize: 12),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18, top: 18),
                child: Text(
                  'Rp 240.000 ',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF492F10),
                      fontSize: 12),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 18, top: 18),
              child: Theme(
                data: Theme.of(context).copyWith(
                    scrollbarTheme: ScrollbarThemeData(
                  thumbColor: WidgetStateProperty.all(const Color(0xff865439)),
                )),
                child: Scrollbar(
                  thickness: 2,
                  child: Obx(() {
                    final transactionHistory = checkoutController.transactions;
                    if (transactionHistory.isEmpty) {
                      return const Center(
                          child: Text('No transactions found.'));
                    }
                    return ListView.builder(
                        itemCount: transactionHistory.length,
                        itemBuilder: (context, index) {
                          final transaction = transactionHistory[index];
                          final date = DateTime.parse(transaction['date']);
                          final formattedDate =
                              DateFormat('yyyy-MM-dd HH:mm').format(date);

                          return Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 0, 0, 11),
                            child: AspectRatio(
                              aspectRatio: size.height * 0.97 / size.height * 5,
                              child: InkWell(
                                onTap: () {
                                  Get.to(() => SalesReportDetailPage(
                                      transaction: transaction));
                                },
                                child: Container(
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 18.0, right: 18),
                                    child: Row(
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            AspectRatio(
                                              aspectRatio: size.height *
                                                  0.97 /
                                                  size.height *
                                                  2.4,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                    'Total: \$${transaction['totalAmount'].toStringAsFixed(2)}',
                                                    maxLines: 3,
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
                                                    height: size.height * 0.005,
                                                  ),
                                                  Text(
                                                    'Transaction on $formattedDate',
                                                    style: GoogleFonts.poppins(
                                                        color: const Color(
                                                            0xFF492F10),
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 12),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              height: size.height * 0.037,
                                              width: size.width * 0.24,
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
                                              child: Center(
                                                child: Text(
                                                  "PAID OFF",
                                                  style: GoogleFonts.poppins(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 12),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: size.width * 0.048,
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                GestureDetector(
                                                  onTap: () async {
                                                    checkoutController
                                                        .alertDialogHapus(
                                                            index);
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
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        });
                  }),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
