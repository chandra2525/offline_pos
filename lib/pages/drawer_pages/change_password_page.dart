// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:point_of_sales/widget/textinputdecor.dart';
import 'package:fluttericon/font_awesome_icons.dart';

class ChangePasswordPage extends StatefulWidget {
  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  late String old_password, new_password, new_password_again;

  bool _secureText1 = true;
  bool _secureText2 = true;
  bool _secureText3 = true;

  showHide1() {
    setState(() {
      _secureText1 = !_secureText1;
    });
  }

  showHide2() {
    setState(() {
      _secureText2 = !_secureText2;
    });
  }

  showHide3() {
    setState(() {
      _secureText3 = !_secureText3;
    });
  }

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
          "Change Password",
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500, color: Colors.white, fontSize: 22),
        ),
        centerTitle: true,
        shape: const Border(
            bottom: BorderSide(color: Color(0xffD1D1D1), width: 1)),
        // actions: <Widget>[
        //   Padding(
        //     padding: EdgeInsets.only(right: 13.0),
        //     child: Icon(
        //       LineIcons.shoppingCart,
        //       size: 27,
        //     ),
        //   )
        // ],
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
            // stops: [0.0, 0.8],
            // tileMode: TileMode.clamp,
          ),
        ),
        width: double.infinity,
        height: 60,
        child: FloatingActionButton.extended(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0))),
          splashColor: Colors.brown,
          onPressed: () async {},
          elevation: 0,
          label: Text(
            'Save Password',
            style: GoogleFonts.poppins(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
          ),
          icon: const Icon(
            LineIcons.save,
            color: Colors.white,
          ),
          backgroundColor: Colors.transparent,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Padding(
          //   padding: const EdgeInsets.only(left: 22.0, right: 22, top: 18),
          //   child: Text(
          //     "Details Product",
          //     style: GoogleFonts.poppins(
          //         fontWeight: FontWeight.w500,
          //         color: Color(0xff865439),
          //         fontSize: 22),
          //   ),
          // ),
          const SizedBox(
            height: 12,
          ),
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 22.0, right: 22.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0, bottom: 10),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Old Password',
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
                            return 'Old password cannot empty';
                          } else {
                            return null;
                          }
                        },
                        cursorColor: const Color(0xFF865439),
                        maxLength: 50,
                        onSaved: (e) => old_password = e!,
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: const Color(0xFF865439),
                            fontWeight: FontWeight.w500),
                        decoration: textInputDecorationForm.copyWith(
                          hintText: 'Enter old password...',
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
                        obscureText: _secureText2,
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
                        decoration: textInputDecorationForm.copyWith(
                          hintText: 'Enter new password...',
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
                        obscureText: _secureText3,
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
                        decoration: textInputDecorationForm.copyWith(
                          hintText: 'Enter new password again...',
                          suffixIcon: IconButton(
                            onPressed: showHide3,
                            icon: Icon(
                              _secureText3
                                  ? FontAwesome.eye_off
                                  : FontAwesome.eye,
                              color: const Color(0xFF865439),
                            ),
                          ),
                        ),
                      ),
                      //
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
