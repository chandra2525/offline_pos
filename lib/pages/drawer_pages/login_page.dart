// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:point_of_sales/widget/textinputdecor.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String phone_number;
  bool _secureText1 = true;
  showHide1() {
    setState(() {
      _secureText1 = !_secureText1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                              'Log in as Owner',
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
                                  ),
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
                    padding: const EdgeInsets.only(top: 28.0, bottom: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Phone Number',
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
                        return 'Phone number cannot empty';
                      } else {
                        return null;
                      }
                    },
                    cursorColor: const Color(0xFF865439),
                    maxLength: 50,
                    onSaved: (e) => phone_number = e!,
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: const Color(0xFF865439),
                        fontWeight: FontWeight.w500),
                    decoration: textInputDecorationForm.copyWith(
                      hintText: 'Enter phone number...',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Password',
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
                        return 'Password cannot empty';
                      } else {
                        return null;
                      }
                    },
                    cursorColor: const Color(0xFF865439),
                    maxLength: 50,
                    onSaved: (e) => phone_number = e!,
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: const Color(0xFF865439),
                        fontWeight: FontWeight.w500),
                    decoration: textInputDecorationForm.copyWith(
                      hintText: 'Enter password...',
                      suffixIcon: IconButton(
                        onPressed: showHide1,
                        icon: Icon(
                          _secureText1 ? FontAwesome.eye_off : FontAwesome.eye,
                          color: const Color(0xFF865439),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0, bottom: 12),
                    child: SizedBox(
                      width: double.infinity,
                      height: 57,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF865439),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                        ),
                        onPressed: () {
                          Get.back();
                          Get.back();
                        },
                        child: Text(
                          "Login",
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {
                        Get.snackbar(
                          'Development',
                          'Features in development',
                          duration: const Duration(seconds: 1),
                        );
                        Get.toNamed('/forgot-password-page');
                      },
                      child: Text(
                        "Forgot Password?",
                        style: GoogleFonts.poppins(
                            decoration: TextDecoration.underline,
                            decorationColor: const Color(0xFF865439),
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF614124),
                            fontSize: 12),
                      ),
                    ),
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
