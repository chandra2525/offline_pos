import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:point_of_sales/controllers/cart_controller.dart';
import 'package:point_of_sales/widget/textinputdecor.dart';

class CartPage extends StatelessWidget {
  final CartController cartController = Get.put(CartController());

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
          "Cart",
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500, color: Colors.white, fontSize: 22),
        ),
        centerTitle: true,
        shape: const Border(
            bottom: BorderSide(color: Color(0xffD1D1D1), width: 1)),
      ),
      bottomNavigationBar: Obx(
        () => SafeArea(
          child: InkWell(
            onTap: () {
              Get.toNamed('/checkout-page');
            },
            child: Container(
              margin: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 0.0),
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
              child: Padding(
                padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          LineIcons.shoppingCart,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 8.0),
                        Text(
                          'Checkout',
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Text(
                      'Total : Rp ${cartController.formatNumber((cartController.totalPrice.toInt()).toString())}',
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      // floatingActionButton:
      body: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Divider(
            //   color: Colors.black,
            // ),
            Container(
              width: double.infinity,
              height: 48,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 18.0,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Menu in cart',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: const Color(0xff865439),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Expanded(
                child: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 18.0, 16.0, 0.0),
              child: Theme(
                data: Theme.of(context).copyWith(
                    scrollbarTheme: ScrollbarThemeData(
                  thumbColor: WidgetStateProperty.all(const Color(0xff865439)),
                )),
                child: Scrollbar(
                  thickness: 2,
                  child: ListView.builder(
                      itemCount: cartController.cartItems.length,
                      itemBuilder: (context, index) {
                        final cartItem = cartController.cartItems[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 120,
                                        width: 90,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            image: DecorationImage(
                                                image: AssetImage(cartItem
                                                    .product.imagePath
                                                    .toString()),
                                                fit: BoxFit.cover)),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 12.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 160,
                                              child: Text(cartItem.product.name,
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: const Color(
                                                          0xff492F10),
                                                      fontSize: 16)),
                                            ),
                                            const SizedBox(height: 12.0),
                                            Text(
                                                'Rp ${cartController.formatNumber(cartItem.product.price.toString())}',
                                                style: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w500,
                                                    color:
                                                        const Color(0xff865439),
                                                    fontSize: 14)),
                                            const SizedBox(height: 4.0),
                                            Text(
                                                'Total : Rp ${cartController.formatNumber((cartItem.product.price * cartItem.quantity).toString())}',
                                                style: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w500,
                                                    color:
                                                        const Color(0xff865439),
                                                    fontSize: 14)),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 4.0),
                                        child: IconButton(
                                          icon: const Icon(
                                            LineIcons.trash,
                                            color: Color(0xFF865439),
                                          ),
                                          onPressed: () {
                                            cartController
                                                .alertDialogHapus(cartItem);
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 12.0, bottom: 12.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                color: Colors.grey.shade200,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(16.0),
                                              )),
                                          child: Row(
                                            children: [
                                              IconButton(
                                                onPressed: () {
                                                  cartController
                                                      .decreaseQuantity(
                                                          cartItem);
                                                },
                                                icon: const Icon(
                                                  LineIcons.minus,
                                                  color: Color(0xFF865439),
                                                  size: 20,
                                                ),
                                              ),
                                              Text(
                                                '${cartItem.quantity}',
                                                style: GoogleFonts.poppins(
                                                    color:
                                                        const Color(0xFF865439),
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              IconButton(
                                                onPressed: () {
                                                  cartController
                                                      .increaseQuantity(
                                                          cartItem);
                                                },
                                                icon: const Icon(
                                                  LineIcons.plus,
                                                  color: Color(0xFF865439),
                                                  size: 20,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                      // children: _listItem
                      //     .map((item) => )
                      //     .toList(),
                      ),
                ),
              ),
            )),
            Padding(
              padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0.0),
              child: Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                width: double.infinity,
                // height: 134,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                        child: Text(
                          'Enter Discount',
                          style: GoogleFonts.poppins(
                              color: const Color(0xFF492F10),
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        keyboardType: TextInputType.number,
                        controller: cartController.disconController,
                        cursorColor: const Color(0xFF865439),
                        maxLength: 10,
                        onChanged: (value) {
                          if (value == "") {
                            value = "0";
                          } else {
                            value = cartController
                                .formatNumber(value.replaceAll('.', ''));

                            cartController.disconController.value =
                                TextEditingValue(
                              text: value,
                              selection:
                                  TextSelection.collapsed(offset: value.length),
                            );
                            value = value;
                          }
                          cartController.addDiscount(double.parse(
                              int.parse((value.replaceAll('.', '').trim()))
                                  .toString()));
                        },
                        style: GoogleFonts.poppins(
                            fontSize: 24,
                            color: const Color(0xFF865439),
                            fontWeight: FontWeight.w500),
                        decoration: textInputDecorationPrice.copyWith(
                          hintText: ' 0',
                          counterText: '',
                          prefixText: cartController.currency(),
                          enabledBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
