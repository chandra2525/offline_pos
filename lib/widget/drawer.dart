import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

class DrawerAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: <Color>[
                Color(0xff865439),
                Color(0xff492F10),
              ]),
        ),
        // color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 45.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            )),
                        padding: const EdgeInsets.all(5),
                        // color: Color(0xFF865439),
                        child: SvgPicture.asset(
                          'assets/images/logo.svg',
                          height: 20,
                        ),
                      ),
                      // SvgPicture.asset(
                      //   'assets/images/logo.svg',
                      //   height: 45,
                      // ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          'OfflinePOS',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: 17),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0, bottom: 20),
                    child: Text(
                      'MyNameStore',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: 22),
                    ),
                  ),
                  Divider(
                    height: 4,
                    thickness: 0.5,
                    color: Colors.white.withOpacity(1),
                    // indent: 32,
                    // endIndent: 32,
                  ),
                  InkWell(
                    onTap: () {
                      Get.snackbar(
                        'Development',
                        'Features in development',
                        duration: const Duration(seconds: 1),
                      );
                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(
                                LineIcons.user,
                                size: 27,
                                color: Colors.white,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Text(
                                  'Account',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                      fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.back();
                            Get.snackbar(
                              'Development',
                              'Features in development',
                              duration: const Duration(seconds: 1),
                            );
                            Get.toNamed('/change-password-page');
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 25.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(
                                  LineIcons.cog,
                                  size: 27,
                                  color: Colors.white,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Text(
                                    'Change Password',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                        fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.snackbar(
                              'Development',
                              'Features in development',
                              duration: const Duration(seconds: 1),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 25.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(
                                  LineIcons.helpingHands,
                                  size: 27,
                                  color: Colors.white,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Text(
                                    'Support',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                        fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.snackbar(
                              'Development',
                              'Features in development',
                              duration: const Duration(seconds: 1),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 25.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(
                                  LineIcons.mobilePhone,
                                  size: 27,
                                  color: Colors.white,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Text(
                                    'About OfflinePOS',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                        fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: Text(
                    'OfflinePOS V.1.0.0',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: 16),
                  ),
                ),
                Container(
                  color: const Color.fromRGBO(255, 255, 255, 0.15),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 24.0, right: 24.0, top: 20, bottom: 20),
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {
                          Get.back();
                          Get.snackbar(
                            'Development',
                            'Features in development',
                            duration: const Duration(seconds: 1),
                          );
                          Get.toNamed('/welcome-page');
                        },
                        child: Text(
                          "Log out",
                          style: GoogleFonts.poppins(
                              color: const Color(0xFF865439),
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                          textAlign: TextAlign.center,
                        ),
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
}
