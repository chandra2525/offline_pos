import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Theme(
          data: Theme.of(context).copyWith(
              scrollbarTheme: ScrollbarThemeData(
            thumbColor: WidgetStateProperty.all(const Color(0xff865439)),
          )),
          child: Scrollbar(
            thickness: 3,
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
                                  'Log in',
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
                        child: Text(
                          'Welcome to OfflinePOS!',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF865439),
                              fontSize: 24),
                        ),
                      ),
                      Text(
                        'Select login as the owner or employee\nfirst to continue.',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF865439),
                            fontSize: 16),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 50, bottom: 50),
                          child: Container(
                            color: Colors.white,
                            child: SvgPicture.asset('assets/images/login.svg'),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 57,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF865439),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)),
                          ),
                          onPressed: () {
                            Get.snackbar(
                              'Development',
                              'Features in development',
                              duration: const Duration(seconds: 1),
                            );
                            Get.toNamed('/login-page');
                          },
                          icon: const Icon(
                            FontAwesome5.user,
                            color: Colors.white,
                          ),
                          label: Text(
                            "Log in as Owner",
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 13.0, top: 13.0),
                        child: Center(
                          child: Text(
                            'Or',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF492F10),
                                fontSize: 12),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 57,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF492F10),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)),
                          ),
                          onPressed: () {
                            Get.snackbar(
                              'Development',
                              'Features in development',
                              duration: const Duration(seconds: 1),
                            );
                            Get.toNamed('/login-page');
                          },
                          icon: const Icon(
                            FontAwesome5.user_friends,
                            color: Colors.white,
                          ),
                          label: Text(
                            " Log in as Employee",
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 3.0),
                              child: Text(
                                "Don't have an account?",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFF492F10),
                                    fontSize: 12),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.snackbar(
                                  'Development',
                                  'Features in development',
                                  duration: const Duration(seconds: 1),
                                );
                                Get.toNamed('/sign-up-page');
                              },
                              child: Text(
                                "Sign Up",
                                style: GoogleFonts.poppins(
                                    decoration: TextDecoration.underline,
                                    decorationColor: const Color(0xFF865439),
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF614124),
                                    fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
