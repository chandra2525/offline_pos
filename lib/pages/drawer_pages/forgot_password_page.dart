// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:point_of_sales/widget/textinputdecor.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  late String phone_number,
      email,
      new_password,
      new_password_again,
      otp_code,
      otp_code1,
      otp_code2,
      otp_code3,
      otp_code4;

  bool _secureText1 = true;
  showHide1() {
    setState(() {
      _secureText1 = !_secureText1;
    });
  }

  bool _secureText2 = true;
  showHide2() {
    setState(() {
      _secureText2 = !_secureText2;
    });
  }

  int slideIndex = 0;
  late PageController controller;

  Widget _buildPageIndicator(bool isCurrentPage) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 3.0),
      height: isCurrentPage ? 8.0 : 8.0,
      width: isCurrentPage ? 25.0 : 8.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? const Color(0xFF865439) : Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    controller = PageController();
  }

  TextEditingController dateinput = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: MediaQuery.of(context).size.height - 50,
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() {
              slideIndex = index;
            });
          },
          children: <Widget>[
            Scaffold(
              backgroundColor: Colors.white,
              body: SafeArea(
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 25, 10, 15),
                            child: IntrinsicHeight(
                              child: Stack(
                                children: [
                                  Center(
                                    child: Text(
                                      'Forgot Password',
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xFF865439),
                                          fontSize: 22),
                                    ),
                                  ),
                                  Positioned(
                                    left: 0,
                                    child: Ink(
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF865439),
                                        borderRadius: BorderRadius.circular(8),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(.1),
                                            blurRadius: 2.0,
                                            spreadRadius: .05,
                                          ), //BoxShadow
                                        ],
                                      ),
                                      child: InkWell(
                                        borderRadius: BorderRadius.circular(8),
                                        child: const Center(
                                            child: Icon(
                                          Entypo.left_open_mini,
                                          size: 32,
                                          color: Colors.white,
                                        )),
                                        onTap: () => Get.back(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 28.0, bottom: 10),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(223, 187, 157, 0.4),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(30, 20, 30, 20),
                                child: Text(
                                  'OTP code will be\nsent to your E-mail',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFF492F10),
                                      fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 10.0, bottom: 10),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'E-mail',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFF865439),
                                    fontSize: 16),
                              ),
                            ),
                          ),
                          //
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'E-mail cannot empty';
                              } else {
                                return null;
                              }
                            },
                            cursorColor: const Color(0xFF865439),
                            maxLength: 100,
                            onSaved: (e) => email = e!,
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: const Color(0xFF865439),
                                fontWeight: FontWeight.w500),
                            decoration: textInputDecorationForm.copyWith(
                              hintText: 'Enter e-mail...',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Scaffold(
              backgroundColor: Colors.white,
              body: SafeArea(
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 25, 10, 15),
                            child: IntrinsicHeight(
                              child: Stack(
                                children: [
                                  Center(
                                    child: Text(
                                      'Forgot Password',
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xFF865439),
                                          fontSize: 22),
                                    ),
                                  ),
                                  Positioned(
                                    left: 0,
                                    child: Ink(
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF865439),
                                        borderRadius: BorderRadius.circular(8),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(.1),
                                            blurRadius: 2.0,
                                            spreadRadius: .05,
                                          ), //BoxShadow
                                        ],
                                      ),
                                      child: InkWell(
                                        borderRadius: BorderRadius.circular(8),
                                        child: const Center(
                                            child: Icon(
                                          Entypo.left_open_mini,
                                          size: 32,
                                          color: Colors.white,
                                        )),
                                        onTap: () => Get.back(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 28.0, bottom: 30),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(223, 187, 157, 0.4),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(30, 20, 30, 20),
                                child: Text(
                                  'The OTP code can be seen in your email that you entered earlier',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFF492F10),
                                      fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'OTP Code',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFF865439),
                                    fontSize: 16),
                              ),
                            ),
                          ),
                          Form(
                              key: _key,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    height: 68,
                                    width: 64,
                                    child: TextFormField(
                                      onSaved: (e) => otp_code1 = e!,
                                      decoration:
                                          textInputDecorationOtp.copyWith(
                                        hintText: "0",
                                      ),
                                      style: GoogleFonts.poppins(
                                          fontSize: 20,
                                          color: const Color(0xFF865439),
                                          fontWeight: FontWeight.w700),
                                      onChanged: (value) {
                                        if (value.length == 1) {
                                          FocusScope.of(context).nextFocus();
                                        }
                                      },
                                      keyboardType: TextInputType.number,
                                      textAlign: TextAlign.center,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(1),
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 68,
                                    width: 64,
                                    child: TextFormField(
                                      onSaved: (e) => otp_code2 = e!,
                                      decoration:
                                          textInputDecorationOtp.copyWith(
                                        hintText: "0",
                                      ),
                                      style: GoogleFonts.poppins(
                                          fontSize: 20,
                                          color: const Color(0xFF865439),
                                          fontWeight: FontWeight.w700),
                                      onChanged: (value) {
                                        if (value.length == 1) {
                                          FocusScope.of(context).nextFocus();
                                        }
                                      },
                                      keyboardType: TextInputType.number,
                                      textAlign: TextAlign.center,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(1),
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 68,
                                    width: 64,
                                    child: TextFormField(
                                      onSaved: (e) => otp_code3 = e!,
                                      decoration:
                                          textInputDecorationOtp.copyWith(
                                        hintText: "0",
                                      ),
                                      style: GoogleFonts.poppins(
                                          fontSize: 20,
                                          color: const Color(0xFF865439),
                                          fontWeight: FontWeight.w700),
                                      onChanged: (value) {
                                        if (value.length == 1) {
                                          FocusScope.of(context).nextFocus();
                                        }
                                      },
                                      keyboardType: TextInputType.number,
                                      textAlign: TextAlign.center,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(1),
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 68,
                                    width: 64,
                                    child: TextFormField(
                                      onSaved: (e) => otp_code4 = e!,
                                      decoration:
                                          textInputDecorationOtp.copyWith(
                                        hintText: "0",
                                      ),
                                      style: GoogleFonts.poppins(
                                          fontSize: 20,
                                          color: const Color(0xFF865439),
                                          fontWeight: FontWeight.w700),
                                      onChanged: (value) {
                                        if (value.length == 1) {
                                          FocusScope.of(context).nextFocus();
                                        }
                                      },
                                      keyboardType: TextInputType.number,
                                      textAlign: TextAlign.center,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(1),
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                    ),
                                  )
                                ],
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Scaffold(
              backgroundColor: Colors.white,
              body: SafeArea(
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 25, 10, 15),
                            child: IntrinsicHeight(
                              child: Stack(
                                children: [
                                  Center(
                                    child: Text(
                                      'Fargot Password',
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xFF865439),
                                          fontSize: 22),
                                    ),
                                  ),
                                  Positioned(
                                    left: 0,
                                    child: Ink(
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF865439),
                                        borderRadius: BorderRadius.circular(8),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(.1),
                                            blurRadius: 2.0,
                                            spreadRadius: .05,
                                          ), //BoxShadow
                                        ],
                                      ),
                                      child: InkWell(
                                        borderRadius: BorderRadius.circular(8),
                                        child: const Center(
                                            child: Icon(
                                          Entypo.left_open_mini,
                                          size: 32,
                                          color: Colors.white,
                                        )),
                                        onTap: () => Get.back(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Form(
                              key: _key,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20.0, bottom: 10),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'New Password',
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xFF865439),
                                            fontSize: 16),
                                      ),
                                    ),
                                  ),
                                  //
                                  TextFormField(
                                    obscureText: _secureText1,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'New password cannot empty';
                                      } else {
                                        return null;
                                      }
                                    },
                                    cursorColor: const Color(0xFF865439),
                                    maxLength: 50,
                                    onSaved: (e) => new_password = e!,
                                    style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        color: const Color(0xFF865439),
                                        fontWeight: FontWeight.w500),
                                    decoration:
                                        textInputDecorationForm.copyWith(
                                      hintText: 'Enter new password...',
                                      suffixIcon: IconButton(
                                        onPressed: showHide1,
                                        icon: Icon(
                                          _secureText1
                                              ? FontAwesome.eye_off
                                              : FontAwesome.eye,
                                          color: const Color(0xFF865439),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'New Password Again',
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xFF865439),
                                            fontSize: 16),
                                      ),
                                    ),
                                  ),
                                  //
                                  TextFormField(
                                    obscureText: _secureText2,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'New password again cannot empty';
                                      } else {
                                        return null;
                                      }
                                    },
                                    cursorColor: const Color(0xFF865439),
                                    maxLength: 50,
                                    onSaved: (e) => new_password_again = e!,
                                    style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        color: const Color(0xFF865439),
                                        fontWeight: FontWeight.w500),
                                    decoration:
                                        textInputDecorationForm.copyWith(
                                      hintText: 'Enter new password again...',
                                      suffixIcon: IconButton(
                                        onPressed: showHide2,
                                        icon: Icon(
                                          _secureText2
                                              ? FontAwesome.eye_off
                                              : FontAwesome.eye,
                                          color: const Color(0xFF865439),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // SlideTile(
            //   imagePath: mySLides[2].getImageAssetPath(),
            //   title: mySLides[2].getTitle(),
            //   subtitle: mySLides[2].getSubTitle(),
            //   // desc: mySLides[2].getDesc(),
            // )
          ],
        ),
      ),
      bottomSheet: slideIndex == 0
          ? Container(
              height: 45,
              color: Colors.grey.shade100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shadowColor: Colors.transparent,
                        backgroundColor: Colors.grey.shade100,
                        elevation: 0),
                    onPressed: () {
                      controller.animateToPage(slideIndex - 1,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOutQuint);
                      Get.snackbar(
                        'Development',
                        'Features in development',
                        duration: const Duration(seconds: 1),
                      );
                    },
                    // splashColor: Colors.blue[50],
                    child: Text(
                      "PREV",
                      style: GoogleFonts.poppins(
                          color: const Color.fromARGB(0, 187, 15, 75),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Row(
                    children: [
                      for (int i = 0; i < 3; i++)
                        i == slideIndex
                            ? _buildPageIndicator(true)
                            : _buildPageIndicator(false),
                    ],
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shadowColor: Colors.transparent,
                        backgroundColor: Colors.grey.shade100,
                        elevation: 0),
                    onPressed: () {
                      print("this is slideIndex: $slideIndex");
                      controller.animateToPage(slideIndex + 1,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOutQuint);
                      Get.snackbar(
                        'Development',
                        'Features in development',
                        duration: const Duration(seconds: 1),
                      );
                    },
                    // splashColor: Colors.blue[50],
                    child: Text(
                      "NEXT",
                      style: GoogleFonts.poppins(
                          color: const Color(0xFF865439),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            )
          : slideIndex == 1
              ? Container(
                  height: 45,
                  color: Colors.grey.shade100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shadowColor: Colors.transparent,
                            backgroundColor: Colors.grey.shade100,
                            elevation: 0),
                        onPressed: () {
                          controller.animateToPage(slideIndex - 1,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOutQuint);
                          Get.snackbar(
                            'Development',
                            'Features in development',
                            duration: const Duration(seconds: 1),
                          );
                        },
                        // splashColor: Colors.blue[50],
                        child: Text(
                          "PREV",
                          style: GoogleFonts.poppins(
                              color: const Color(0xFF865439),
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Row(
                        children: [
                          for (int i = 0; i < 3; i++)
                            i == slideIndex
                                ? _buildPageIndicator(true)
                                : _buildPageIndicator(false),
                        ],
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shadowColor: Colors.transparent,
                            backgroundColor: Colors.grey.shade100,
                            elevation: 0),
                        onPressed: () {
                          print("this is slideIndex: $slideIndex");
                          controller.animateToPage(slideIndex + 1,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOutQuint);
                          Get.snackbar(
                            'Development',
                            'Features in development',
                            duration: const Duration(seconds: 1),
                          );
                        },
                        // splashColor: Colors.blue[50],
                        child: Text(
                          "NEXT",
                          style: GoogleFonts.poppins(
                              color: const Color(0xFF865439),
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                )
              : Container(
                  height: 45,
                  color: Colors.grey.shade100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shadowColor: Colors.transparent,
                            backgroundColor: Colors.grey.shade100,
                            elevation: 0),
                        onPressed: () {
                          controller.animateToPage(slideIndex - 1,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOutQuint);
                          Get.snackbar(
                            'Development',
                            'Features in development',
                            duration: const Duration(seconds: 1),
                          );
                        },
                        // splashColor: Colors.blue[50],
                        child: Text(
                          "PREV",
                          style: GoogleFonts.poppins(
                              color: const Color(0xFF865439),
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Row(
                        children: [
                          for (int i = 0; i < 3; i++)
                            i == slideIndex
                                ? _buildPageIndicator(true)
                                : _buildPageIndicator(false),
                        ],
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shadowColor: Colors.transparent,
                            backgroundColor: Colors.grey.shade100,
                            elevation: 0),
                        onPressed: () {
                          check();
                          // print(otp_code);
                          print(otp_code1 + otp_code2 + otp_code3 + otp_code4);
                          print("this is slideIndex: $slideIndex");
                          controller.animateToPage(slideIndex + 1,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOutQuint);
                          Get.snackbar(
                            'Development',
                            'Features in development',
                            duration: const Duration(seconds: 1),
                          );
                        },
                        // splashColor: Colors.blue[50],
                        child: Text(
                          "RESET",
                          style: GoogleFonts.poppins(
                              color: const Color(0xFF865439),
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
    );
  }

  final _key = GlobalKey<FormState>();

  check() {
    final form = _key.currentState;
    if (form!.validate()) {
      form.save();
    }
  }

//   Widget _textFieldOTP({required bool first, last}) {
//     return Container(
//       height: 85,
//       child: AspectRatio(
//         aspectRatio: 1.0,
//         child: TextFormField(
//           autofocus: true,
//           onSaved: (e) => otp_code = e!,
//           onChanged: (value) {
//             if (value.length == 1 && last == false) {
//               FocusScope.of(context).nextFocus();
//             }
//             if (value.length == 0 && first == false) {
//               FocusScope.of(context).previousFocus();
//             }
//           },
//           showCursor: false,
//           readOnly: false,
//           textAlign: TextAlign.center,
//           style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold),
//           keyboardType: TextInputType.number,
//           maxLength: 1,
//           decoration: InputDecoration(
//             counter: Offstage(),
//             enabledBorder: OutlineInputBorder(
//                 borderSide: BorderSide(width: 2, color: Colors.black12),
//                 borderRadius: BorderRadius.circular(12)),
//             focusedBorder: OutlineInputBorder(
//                 borderSide: BorderSide(width: 2, color: Colors.purple),
//                 borderRadius: BorderRadius.circular(12)),
//           ),
//         ),
//       ),
//     );
//   }
}
