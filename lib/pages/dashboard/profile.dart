// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'dart:convert';
import 'dart:io';

import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constant.dart';
import '../../services/api.dart';
import '../../services/file_picker_service.dart';
import '../../services/storage_service.dart';
import '../../widgets/app_button.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _ProfilePageState createState() => _ProfilePageState();
}

class UserType {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? username;
  final String? email;
  final String? phoneNumber;
  final String? photoUrl;
  final String? identityCardUrl;
  final dynamic? promoCode;
  final dynamic? referredBy;
  final String? userIp;
  final String? userAgent;
  final dynamic? firebaseKey;
  final String? defaultRole;
  final int? isVerified;
  final int? isActive;
  final dynamic verificationCodeCreatedAt;
  final DateTime? emailVerifiedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List? roles;

  const UserType({
    this.id,
    this.firstName,
    this.lastName,
    this.username,
    this.email,
    this.phoneNumber,
    this.photoUrl,
    this.identityCardUrl,
    this.promoCode,
    this.referredBy,
    this.userIp,
    this.userAgent,
    this.firebaseKey,
    this.defaultRole,
    this.isVerified,
    this.isActive,
    this.verificationCodeCreatedAt,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
    this.roles,
  });
}

class _ProfilePageState extends State<ProfilePage> {
  final passwordController = TextEditingController();
  bool show = false;
  File? profile;

  dynamic user;
  int? id;
  bool loading = false;
  final emailController = TextEditingController();
  final lastNameController = TextEditingController();
  final firstNameController = TextEditingController();
  final phoneNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getUserDetails();
  }

  void getUserDetails() async {
    var res = await StorageService().getString('SA-user');

    setState(() {
      id = jsonDecode(res)['id'];
      emailController.text = jsonDecode(res)['email'];
      phoneNumberController.text = jsonDecode(res)['phone_number'];
      lastNameController.text = jsonDecode(res)['last_name'];
      firstNameController.text = jsonDecode(res)['first_name'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
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
                    controller: lastNameController,
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
                      labelText: 'Lastname',
                      border: InputBorder.none,
                      hoverColor: Colors.transparent,
                    )),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                    controller: firstNameController,
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
                      labelText: 'Firstname',
                      border: InputBorder.none,
                      hoverColor: Colors.transparent,
                    )),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                    controller: phoneNumberController,
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
                      labelText: 'Mobile number',
                      border: InputBorder.none,
                      hoverColor: Colors.transparent,
                    )),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                    controller: emailController,
                    enabled: false,
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
                    controller: passwordController,
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
                  loading: loading,
                  onTap: () async {
                    print('initial profile update');
                    setState(() {
                      loading = true;
                    });
                    try {
                      var res = await Api.updateProfile(ProfileUpdate(
                        id: id,
                        first_name: firstNameController.text,
                        last_name: lastNameController.text,
                        phone_number: phoneNumberController.text,
                      ));

                      ElegantNotification.success(
                              title: Text("Success"),
                              description: Text("Profile update successful"))
                          .show(context);
                    } catch (err) {}

                    setState(() {
                      loading = false;
                    });
                  },
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

class ProfileUpdate {
  int? id;
  String? last_name;
  String? first_name;
  String? phone_number;
  File? profile_image;

  ProfileUpdate(
      {this.id,
      this.first_name,
      this.last_name,
      this.profile_image,
      this.phone_number});
}
