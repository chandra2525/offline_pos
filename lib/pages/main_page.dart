import 'package:flutter/material.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:point_of_sales/controllers/main_page_controller.dart';
import 'package:point_of_sales/pages/report/report_page.dart';
import 'package:point_of_sales/pages/sales/sales_page.dart';
import 'package:point_of_sales/pages/store_pages/manage_store_page.dart';

class MainPage extends StatelessWidget {
  final BottomNavigationController bottomNavigationController =
      Get.put(BottomNavigationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        switch (bottomNavigationController.selectedIndex.value) {
          case 0:
            return SalesPage();
          case 1:
            return ManageStorePage();
          case 2:
            return ReportPage();
          default:
            return SalesPage();
        }
      }),
      bottomNavigationBar: Obx(() {
        return Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff865439),
                Color(0xff492F10),
              ],
              begin: Alignment.topLeft,
              end: Alignment.topRight,
            ),
          ),
          child: CustomNavigationBar(
            iconSize: 25.0,
            strokeColor: Colors.white,
            elevation: 0,
            selectedColor: Colors.white,
            unSelectedColor: const Color(0xff9098B1),
            backgroundColor: Colors.transparent,
            currentIndex: bottomNavigationController.selectedIndex.value,
            onTap: (index) {
              bottomNavigationController.updateIndex(index);
            },
            items: [
              CustomNavigationBarItem(
                icon: const Icon(
                  LineIcons.cookieBite,
                  // size: 20,
                ),
                title: Text(
                  "Sale",
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    color: const Color(0xff9098B1),
                  ),
                ),
                selectedTitle: Text(
                  "Sale",
                  style: GoogleFonts.poppins(fontSize: 13, color: Colors.white),
                ),
              ),
              CustomNavigationBarItem(
                icon: const Icon(
                  LineIcons.store,
                  // size: 20,
                ),
                title: Text(
                  "Store",
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    color: const Color(0xff9098B1),
                  ),
                ),
                selectedTitle: Text(
                  "Store",
                  style: GoogleFonts.poppins(fontSize: 13, color: Colors.white),
                ),
              ),
              CustomNavigationBarItem(
                icon: const Icon(
                  LineIcons.clipboardList,
                  // size: 20,
                ),
                title: Text(
                  "Report",
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    color: const Color(0xff9098B1),
                  ),
                ),
                selectedTitle: Text(
                  "Report",
                  style: GoogleFonts.poppins(fontSize: 13, color: Colors.white),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
