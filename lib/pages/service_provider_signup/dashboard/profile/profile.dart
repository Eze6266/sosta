// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'dart:io';

import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constant.dart';
import '../../../../services/file_picker_service.dart';
import '../../../../widgets/app_button.dart';

class VendorProfilePage extends StatefulWidget {
  const VendorProfilePage({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _VendorProfilePageState createState() => _VendorProfilePageState();
}

class _VendorProfilePageState extends State<VendorProfilePage> {
  final passwordController = TextEditingController();
  bool show = false;
  File? profile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text(
              'Profile',
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w300),
            ),
            shadowColor: null,
            backgroundColor: Colors.transparent,
            centerTitle: true,
            elevation: 0,
            leading: IconButton(
              onPressed: () => context.pop(),
              color: const Color.fromARGB(255, 109, 105, 105),
              icon: Image.network(
                  'https://res.cloudinary.com/kingstech/image/upload/v1666210470/arrow_ockvre.png'),
              //replace with our own icon data.
            )),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(left: 40, right: 40),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Personal Information',
                    style: TextStyle(
                        color: tertiary,
                        fontSize: 16,
                        fontWeight: FontWeight.w800),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1000),
                      color: Color(0xfffF5F5F5)),
                  height: 95.w,
                  width: 95.w,
                  child: profile != null ? Image.file(profile as File) : null,
                ),
                SizedBox(
                  height: 5,
                ),
                GestureDetector(
                  onTap: () async {
                    var res = await ImagePickerService().pickImageFromGallery();
                    if (res != null) {
                      setState(() {
                        profile = res as File?;
                      });
                    } else {
                      ElegantNotification.error(
                              title: Text("Error"),
                              description: Text("Unable to pick image"))
                          .show(context);
                    }
                    print(res);
                  },
                  child: Text(
                    'Change Picture',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: primary,
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                    // controller: emailController,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: tertiary),
                    onChanged: (text) => {setState(() => text)},
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.all(10),
                      labelStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color(0xfffD9D9D9)),
                      labelText: 'Name',
                      border: InputBorder.none,
                      hoverColor: Colors.transparent,
                    )),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                    // controller: emailController,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: tertiary),
                    onChanged: (text) => {setState(() => text)},
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.all(10),
                      labelStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color(0xfffD9D9D9)),
                      labelText: 'Occupation',
                      border: InputBorder.none,
                      hoverColor: Colors.transparent,
                    )),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                    // controller: emailController,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: tertiary),
                    onChanged: (text) => {setState(() => text)},
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.all(10),
                      labelStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color(0xfffD9D9D9)),
                      labelText: 'Email',
                      border: InputBorder.none,
                      hoverColor: Colors.transparent,
                    )),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                    // controller: emailController,
                    obscureText: true,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: tertiary),
                    onChanged: (text) => {setState(() => text)},
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.all(10),
                      labelStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color(0xfffD9D9D9)),
                      labelText: 'Password',
                      border: InputBorder.none,
                      hoverColor: Colors.transparent,
                    )),
                const SizedBox(
                  height: 10,
                ),
                AppButton(
                  text: 'Save',
                  onTap: () => {},
                  bgColor: primary,
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width - 40,
                  height: 55.h,
                ),
              ],
            ),
          ),
        ));
  }
}
