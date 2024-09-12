import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:point_of_sales/pages/report/sales_report_page.dart';
import 'package:point_of_sales/pages/sales/checkout_page.dart';
import 'package:point_of_sales/pages/sales/cart_page.dart';
import 'package:point_of_sales/pages/drawer_pages/change_password_page.dart';
import 'package:point_of_sales/pages/drawer_pages/forgot_password_page.dart';
import 'package:point_of_sales/pages/drawer_pages/login_page.dart';
import 'package:point_of_sales/pages/drawer_pages/welcome_page.dart';
import 'package:point_of_sales/pages/drawer_pages/sign_up_page.dart';
import 'package:point_of_sales/pages/store_pages/input_stock_page.dart';
import 'package:point_of_sales/pages/main_page.dart';
import 'package:point_of_sales/pages/store_pages/list_product_page.dart';
import 'package:point_of_sales/pages/report/stock_report_page.dart';
import 'package:point_of_sales/pages/sales/successful_transaction_page.dart';
import 'pages/store_pages/add_product_page.dart';
import 'pages/store_pages/edit_product_page.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'POS Application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => MainPage()),
        GetPage(name: '/list-product', page: () => ListProductPage()),
        GetPage(name: '/add-product', page: () => AddProductPage()),
        GetPage(name: '/edit-product', page: () => EditProductPage()),
        GetPage(name: '/cart-page', page: () => CartPage()),
        GetPage(name: '/checkout-page', page: () => CheckoutPage()),
        GetPage(
            name: '/successful-transaction',
            page: () => SuccessfulTransactionPage()),
        GetPage(name: '/sales-report-page', page: () => SalesReportPage()),
        GetPage(name: '/stock-report-page', page: () => StockReportPage()),
        GetPage(name: '/input-stock', page: () => InputStockPage()),
        GetPage(name: '/welcome-page', page: () => WelcomePage()),
        GetPage(name: '/login-page', page: () => LoginPage()),
        GetPage(name: '/sign-up-page', page: () => SignUpPage()),
        GetPage(
            name: '/forgot-password-page', page: () => ForgotPasswordPage()),
        GetPage(
            name: '/change-password-page', page: () => ChangePasswordPage()),
      ],
    );
  }
}
