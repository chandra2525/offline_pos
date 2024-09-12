// ignore_for_file: non_constant_identifier_names, avoid_print

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';
import 'package:point_of_sales/widget/textinputdecor.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late String phone_number,
      business_name,
      address,
      place_birth,
      date_birth,
      business_description,
      business_address,
      password,
      fullname,
      email,
      otp_code,
      otp_code1,
      otp_code2,
      otp_code3,
      otp_code4;

  String dropdownValue = 'Food';

  bool _secureText = true;

  showHide() {
    setState(() {
      _secureText = !_secureText;
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

  void alertDialogSource(String tipe) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          backgroundColor: const Color(0xff865439),
          title: Text(
            "Select photo source",
            style: GoogleFonts.poppins(color: Colors.white, fontSize: 16),
            textAlign: TextAlign.center,
          ),
          content: const Icon(
            LineIcons.image,
            color: Colors.white,
            size: 75,
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: ElevatedButton(
                child: Text(
                  "Camera",
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF865439),
                  ),
                ),
                onPressed: () {
                  Get.back();
                  _onImageButtonPressed_owner(ImageSource.camera, tipe,
                      context: context);
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: ElevatedButton(
                child: Text(
                  "Gallery",
                  style: GoogleFonts.poppins(color: const Color(0xFF865439)),
                ),
                onPressed: () {
                  Get.back();
                  _onImageButtonPressed_owner(ImageSource.gallery, tipe,
                      context: context);
                },
              ),
            ),
          ],
        );
      },
    );
  }

  File? _imageFileList_owner;
  File? _imageFileList_business;
  final ImagePicker _picker_owner = ImagePicker();
  final ImagePicker _picker_business = ImagePicker();

  Future<void> _onImageButtonPressed_owner(ImageSource source, String tipe,
      {BuildContext? context}) async {
    try {
      final pickedFile = tipe == 'owner'
          ? await _picker_owner.pickImage(
              source: source,
            )
          : await _picker_business.pickImage(
              source: source,
            );
      if (pickedFile == null) return;

      final imageTemporary = File(pickedFile.path);
      setState(() => tipe == 'owner'
          ? _imageFileList_owner = imageTemporary
          : _imageFileList_business = imageTemporary);
    } catch (e) {
      setState(() {
        (print('Pilih gambar'));
      });
    }
  }

  @override
  void initState() {
    super.initState();
    controller = PageController();
  }

  TextEditingController dateinput = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
                child: Theme(
                  data: Theme.of(context).copyWith(
                      scrollbarTheme: ScrollbarThemeData(
                    thumbColor:
                        WidgetStateProperty.all(const Color(0xff865439)),
                  )),
                  child: Scrollbar(
                    thickness: 3,
                    child: ListView(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 25.0, right: 25.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 25, 10, 15),
                                child: IntrinsicHeight(
                                  child: Stack(
                                    children: [
                                      Center(
                                        child: Text(
                                          'Sign Up',
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
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(.1),
                                                blurRadius: 2.0,
                                                spreadRadius: .05,
                                              ),
                                            ],
                                          ),
                                          child: InkWell(
                                            borderRadius:
                                                BorderRadius.circular(8),
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
                                padding: const EdgeInsets.only(top: 20.0),
                                child: Text(
                                  'Personal Data',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFF492F10),
                                      fontSize: 22),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 15.0, bottom: 10),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Full Name',
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
                                    return 'Full name cannot empty';
                                  } else {
                                    return null;
                                  }
                                },
                                cursorColor: const Color(0xFF865439),
                                maxLength: 50,
                                onSaved: (e) => fullname = e!,
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: const Color(0xFF865439),
                                    fontWeight: FontWeight.w500),
                                decoration: textInputDecorationForm.copyWith(
                                  hintText: 'Enter full name...',
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
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
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
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
                                maxLength: 13,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
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
                                    'Address',
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
                                    return 'Address cannot empty';
                                  } else {
                                    return null;
                                  }
                                },
                                cursorColor: const Color(0xFF865439),
                                maxLength: 500,
                                maxLines: 4,
                                onSaved: (e) => address = e!,
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: const Color(0xFF865439),
                                    fontWeight: FontWeight.w500),
                                decoration: textInputDecorationForm.copyWith(
                                  hintText: 'Enter address...',
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Place Birth',
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
                                    return 'Place birth cannot empty';
                                  } else {
                                    return null;
                                  }
                                },
                                cursorColor: const Color(0xFF865439),
                                maxLength: 100,
                                onSaved: (e) => place_birth = e!,
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: const Color(0xFF865439),
                                    fontWeight: FontWeight.w500),
                                decoration: textInputDecorationForm.copyWith(
                                  hintText: 'Enter place birth...',
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Date Birth',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xFF865439),
                                        fontSize: 16),
                                  ),
                                ),
                              ),
                              //
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: TextFormField(
                                  // validator: (value) {
                                  //   if (value == null || value.isEmpty) {
                                  //     return 'Date birth cannot empty';
                                  //   } else {
                                  //     return null;
                                  //   }
                                  // },
                                  // cursorColor: Color(0xFF865439),
                                  // maxLength: 13,
                                  onSaved: (e) => date_birth = e!,
                                  controller: dateinput,
                                  style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      color: const Color(0xFF865439),
                                      fontWeight: FontWeight.w500),
                                  decoration: textInputDecorationForm.copyWith(
                                    hintText: 'Pick date birth...',
                                  ),
                                  readOnly: true,
                                  onTap: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                      cancelText: 'Batal',
                                      confirmText: 'Pilih',
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime(2101),
                                      builder: (context, child) {
                                        return Theme(
                                          data: Theme.of(context).copyWith(
                                            colorScheme:
                                                const ColorScheme.light(
                                              primary: Color(0xff865439),
                                              onSurface: Color(0xFF492F10),
                                            ),
                                            textButtonTheme:
                                                TextButtonThemeData(
                                              style: TextButton.styleFrom(
                                                foregroundColor:
                                                    const Color(0xff865439),
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

                                      setState(() {
                                        dateinput.text = formattedDate;
                                      });
                                    } else {
                                      print("Date is not selected");
                                    }
                                  },
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
                                obscureText: _secureText,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Password cannot empty';
                                  } else {
                                    return null;
                                  }
                                },
                                cursorColor: const Color(0xFF865439),
                                maxLength: 50,
                                onSaved: (e) => password = e!,
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: const Color(0xFF865439),
                                    fontWeight: FontWeight.w500),
                                decoration: textInputDecorationForm.copyWith(
                                  hintText: 'Enter password...',
                                  suffixIcon: IconButton(
                                    onPressed: showHide,
                                    icon: Icon(
                                      _secureText
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
                                    'Owner Image',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xFF865439),
                                        fontSize: 16),
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 240, 240, 240),
                                        border: Border.all(
                                          color: const Color(0xFF865439),
                                        ),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(16))),
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          15, 15, 15, 10),
                                      child: Column(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              alertDialogSource('owner');
                                            },
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(16.0),
                                                ),
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                                child: _imageFileList_owner !=
                                                        null
                                                    ? Image.file(
                                                        File(
                                                            _imageFileList_owner!
                                                                .path),
                                                        width:
                                                            size.height * 0.144,
                                                        height:
                                                            size.height * 0.226,
                                                        fit: BoxFit.cover,
                                                      )
                                                    : SizedBox(
                                                        width:
                                                            size.height * 0.144,
                                                        height:
                                                            size.height * 0.226,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left: 10.0,
                                                                  right: 10.0),
                                                          child: Image.asset(
                                                            'assets/images/image_placeholder.png',
                                                          ),
                                                        ),
                                                      ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 10, 0, 0),
                                            child: Text(
                                              'Select an image from the gallery to\nupload in portrait orientation',
                                              // 'Pilih gambar dari galeri untuk diupload\ndengan orientasi portrait',
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.poppins(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400,
                                                color: const Color(0xFF865439),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                90, 5, 90, 0),
                                            child: SizedBox(
                                              width: double.infinity,
                                              height: size.height * 0.045,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      const Color(0xFF865439),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                ),
                                                onPressed: () {
                                                  alertDialogSource('owner');
                                                },
                                                child: Text(
                                                  "Select Image",
                                                  style: GoogleFonts.poppins(
                                                      color: Colors.white,
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.05,
                                  ),
                                ],
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
            Scaffold(
              backgroundColor: Colors.white,
              body: SafeArea(
                child: Theme(
                  data: Theme.of(context).copyWith(
                      scrollbarTheme: ScrollbarThemeData(
                    thumbColor:
                        WidgetStateProperty.all(const Color(0xff865439)),
                  )),
                  child: Scrollbar(
                    thickness: 3,
                    child: ListView(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 25.0, right: 25.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 25, 10, 15),
                                child: IntrinsicHeight(
                                  child: Stack(
                                    children: [
                                      Center(
                                        child: Text(
                                          'Sign Up',
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
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(.1),
                                                blurRadius: 2.0,
                                                spreadRadius: .05,
                                              ),
                                            ],
                                          ),
                                          child: InkWell(
                                            borderRadius:
                                                BorderRadius.circular(8),
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
                                padding: const EdgeInsets.only(top: 20.0),
                                child: Text(
                                  'Business Data',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFF492F10),
                                      fontSize: 22),
                                ),
                              ),

                              Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 10, top: 15),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Business Name',
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
                                    return 'Business name cannot empty';
                                  } else {
                                    return null;
                                  }
                                },
                                cursorColor: const Color(0xFF865439),
                                maxLength: 100,
                                onSaved: (e) => business_name = e!,
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: const Color(0xFF865439),
                                    fontWeight: FontWeight.w500),
                                decoration: textInputDecorationForm.copyWith(
                                  hintText: 'Enter business name...',
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Business Category',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xFF865439),
                                        fontSize: 16),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: DropdownButtonFormField(
                                  decoration: textInputDecorationForm.copyWith(
                                      hintText: "Choose business category"),
                                  // onChanged: (e) => dropdownValue = e,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropdownValue = newValue!;
                                    });
                                  },
                                  style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      color: const Color(0xFF865439),
                                      fontWeight: FontWeight.w500),
                                  items: <String>[
                                    'Cafe',
                                    'UMKM',
                                    'Warung Makan',
                                    'Minimarket',
                                    'Supermarket',
                                    'Department Store',
                                    'Toko Serba Ada',
                                    'Toko Obat',
                                    'Toko Khusus',
                                    'Toko Gudang',
                                    'Toko Online',
                                    'Toko Diskon',
                                    'Toko Potongan Harga',
                                    'Toko Showroom Katalog',
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Business Description',
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
                                    return 'Business description cannot empty';
                                  } else {
                                    return null;
                                  }
                                },
                                cursorColor: const Color(0xFF865439),
                                maxLength: 1000,
                                maxLines: 4,
                                onSaved: (e) => business_description = e!,
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: const Color(0xFF865439),
                                    fontWeight: FontWeight.w500),
                                decoration: textInputDecorationForm.copyWith(
                                  hintText: 'Enter business description...',
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Business Address',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xFF865439),
                                        fontSize: 16),
                                  ),
                                ),
                              ),
                              //
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Business address cannot empty';
                                    } else {
                                      return null;
                                    }
                                  },
                                  cursorColor: const Color(0xFF865439),
                                  maxLength: 1000,
                                  maxLines: 4,
                                  onSaved: (e) => business_address = e!,
                                  style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      color: const Color(0xFF865439),
                                      fontWeight: FontWeight.w500),
                                  decoration: textInputDecorationForm.copyWith(
                                    hintText: 'Enter business address...',
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Business Image',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xFF865439),
                                        fontSize: 16),
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 240, 240, 240),
                                        border: Border.all(
                                          color: const Color(0xFF865439),
                                        ),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(16))),
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          15, 15, 15, 10),
                                      child: Column(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              alertDialogSource('store');
                                            },
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(16.0),
                                                ),
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                                child:
                                                    _imageFileList_business !=
                                                            null
                                                        ? Image.file(
                                                            File(
                                                                _imageFileList_business!
                                                                    .path),
                                                            width: size.height *
                                                                0.256,
                                                            height:
                                                                size.height *
                                                                    0.144,
                                                            fit: BoxFit.cover,
                                                          )
                                                        : SizedBox(
                                                            width: size.height *
                                                                0.256,
                                                            height:
                                                                size.height *
                                                                    0.144,
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      top: 10.0,
                                                                      bottom:
                                                                          10.0),
                                                              child:
                                                                  Image.asset(
                                                                'assets/images/store_placeholder.png',
                                                              ),
                                                            ),
                                                          ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 10, 0, 0),
                                            child: Text(
                                              'Select an image from the gallery to\nupload in landscape orientation',
                                              // 'Pilih gambar dari galeri untuk diupload\ndengan orientasi landscape',
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.poppins(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400,
                                                color: const Color(0xFF865439),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                90, 5, 90, 0),
                                            child: SizedBox(
                                              width: double.infinity,
                                              height: size.height * 0.045,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      const Color(0xFF865439),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                ),
                                                onPressed: () {
                                                  alertDialogSource('store');
                                                },
                                                child: Text(
                                                  "Select Image",
                                                  style: GoogleFonts.poppins(
                                                      color: Colors.white,
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.05,
                                  ),
                                ],
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
            Scaffold(
              backgroundColor: Colors.white,
              body: SafeArea(
                child: Theme(
                  data: Theme.of(context).copyWith(
                      scrollbarTheme: ScrollbarThemeData(
                    thumbColor:
                        WidgetStateProperty.all(const Color(0xff865439)),
                  )),
                  child: Scrollbar(
                    thickness: 3,
                    child: ListView(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 25.0, right: 25.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 25, 10, 15),
                                child: IntrinsicHeight(
                                  child: Stack(
                                    children: [
                                      Center(
                                        child: Text(
                                          'Sign Up',
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
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(.1),
                                                blurRadius: 2.0,
                                                spreadRadius: .05,
                                              ), //BoxShadow
                                            ],
                                          ),
                                          child: InkWell(
                                            borderRadius:
                                                BorderRadius.circular(8),
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
                                padding: const EdgeInsets.only(
                                    top: 28.0, bottom: 10),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: const Color.fromRGBO(
                                        223, 187, 157, 0.4),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        30, 20, 30, 20),
                                    child: Text(
                                      'The OTP code can be seen in your e-mail that you used to Sign Up',
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xFF492F10),
                                          fontSize: 16),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 20.0, bottom: 10),
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
                                              FocusScope.of(context)
                                                  .nextFocus();
                                            }
                                          },
                                          keyboardType: TextInputType.number,
                                          textAlign: TextAlign.center,
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(1),
                                            FilteringTextInputFormatter
                                                .digitsOnly
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
                                              FocusScope.of(context)
                                                  .nextFocus();
                                            }
                                          },
                                          keyboardType: TextInputType.number,
                                          textAlign: TextAlign.center,
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(1),
                                            FilteringTextInputFormatter
                                                .digitsOnly
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
                                              FocusScope.of(context)
                                                  .nextFocus();
                                            }
                                          },
                                          keyboardType: TextInputType.number,
                                          textAlign: TextAlign.center,
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(1),
                                            FilteringTextInputFormatter
                                                .digitsOnly
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
                                              FocusScope.of(context)
                                                  .nextFocus();
                                            }
                                          },
                                          keyboardType: TextInputType.number,
                                          textAlign: TextAlign.center,
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(1),
                                            FilteringTextInputFormatter
                                                .digitsOnly
                                          ],
                                        ),
                                      )
                                    ],
                                  )),
                              // Form(
                              //   key: _key,
                              //   child: Row(
                              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //     children: [
                              //       _textFieldOTP(first: true, last: false),
                              //       _textFieldOTP(first: false, last: false),
                              //       _textFieldOTP(first: false, last: false),
                              //       _textFieldOTP(first: false, last: true),
                              //     ],
                              //   ),
                              // ),
                              const SizedBox(
                                height: 22,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 20.0, bottom: 10),
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
                              //
                              Form(
                                // key: _key,
                                child: TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'OTP code cannot empty';
                                    } else {
                                      return null;
                                    }
                                  },
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  cursorColor: const Color(0xFF865439),
                                  maxLength: 6,
                                  onSaved: (e) => otp_code = e!,
                                  style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      color: const Color(0xFF865439),
                                      fontWeight: FontWeight.w500),
                                  decoration: textInputDecorationForm.copyWith(
                                    hintText: 'Enter OTP code...',
                                  ),
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
              color: Colors.grey.shade100,
              height: 45,
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
                          "SIGN UP",
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
}
