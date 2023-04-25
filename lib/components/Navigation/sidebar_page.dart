// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constant.dart';
import '../../pages/service_provider_signup/widget/input_widget.dart';
import '../../services/storage_service.dart';
import '../../widgets/app_button.dart';
import '../dashboard_header.dart';
import 'bottom_nav.dart';

class SidebarPage extends StatefulWidget {
  const SidebarPage({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _SidebarPageState createState() => _SidebarPageState();
}

class _SidebarPageState extends State<SidebarPage> {
  final passwordController = TextEditingController();
  Object user = {};

  void initState() {
    super.initState();
    getUserDetails();
  }

  getUserDetails() async {
    var res = await StorageService().getString('SA-user');
    if (res) {
      setState(() {
        user = jsonDecode(res);
      });
    }
    print(res);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text(
              '',
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
        bottomSheet: BottomNavWidget(),
        body: Padding(
          padding: EdgeInsets.only(right: 30, left: 30),
          child: Column(
            children: [
              DashboardHeaderWidget(name: true),
              SizedBox(
                height: 10.h,
              ),
              Container(
                  decoration: BoxDecoration(color: Color(0xffEBEDFF)),
                  height: 120.h,
                  child: Padding(
                    padding: EdgeInsets.only(right: 50, left: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'You can refer someone and get paid in your wallet.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w300),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        AppButton(
                            text: 'Refer a friend',
                            onTap: () => showModalBottomSheet(
                                context: context,
                                isDismissible: true,
                                isScrollControlled: true,
                                builder: (context) => Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                            child: Padding(
                                          padding: EdgeInsets.only(
                                            top: 42,
                                            bottom: 42,
                                            right: 32,
                                            left: 32,
                                          ),
                                          child: Column(
                                            children: [
                                              Text(
                                                'Copy and Share referral link with friends',
                                                style: TextStyle(fontSize: 20),
                                                textAlign: TextAlign.center,
                                              ),
                                              InputWidget(
                                                onChanged: (text) => {},
                                                hintText: 'sosta.app/2668192',
                                                prefixText: '',
                                              ),
                                            ],
                                          ),
                                        ))
                                      ],
                                    )),
                            bgColor: primary,
                            color: Colors.white)
                      ],
                    ),
                  )),
              // ListTile(
              //   title: const Text(
              //     'Messages',
              //     style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15),
              //   ),
              //   leading: Image.network(
              //     'https://res.cloudinary.com/kingstech/image/upload/v1667083520/messages_fg0iz3.png',
              //   ),
              //   onTap: () => context.go('/chat'),
              // ),
              // const SizedBox(
              //   height: 15,
              // ),
              ListTile(
                title: const Text(
                  'Bookings',
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15),
                ),
                leading: Image.network(
                  'https://res.cloudinary.com/kingstech/image/upload/v1667083520/bookings_g9l38g.png',
                ),
                onTap: () => context.go('/dashboard/bookings'),
              ),
              const SizedBox(
                height: 15,
              ),
              ListTile(
                title: const Text(
                  'Sign up as a service provider',
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15),
                ),
                leading: Image.network(
                  'https://res.cloudinary.com/kingstech/image/upload/v1667083520/signup_jdxmkc.png',
                ),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              const SizedBox(
                height: 15,
              ),
              ListTile(
                title: const Text(
                  'Wallet',
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15),
                ),
                leading: Image.network(
                  'https://res.cloudinary.com/kingstech/image/upload/v1667083520/wallet_u62yav.png',
                ),
                onTap: () => context.go('/dashboard/wallet'),
              ),
              const SizedBox(
                height: 15,
              ),
              // ListTile(
              //   title: const Text(
              //     'Terms & Conditions',
              //     style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15),
              //   ),
              //   leading: Image.network(
              //     'https://res.cloudinary.com/kingstech/image/upload/v1667083520/terms_v9mzeh.png',
              //   ),
              //   onTap: () {
              //     // Update the state of the app.
              //     // ...
              //   },
              // ),
              const SizedBox(
                height: 15,
              ),
              ListTile(
                title: const Text(
                  'Settings',
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15),
                ),
                leading: Image.network(
                  'https://res.cloudinary.com/kingstech/image/upload/v1667083520/settings_jix3ar.png',
                ),
                onTap: () => context.go('/dashboard/settings'),
              ),
              const SizedBox(
                height: 15,
              ),
              ListTile(
                title: const Text(
                  'Profile',
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15),
                ),
                leading: Image.network(
                  'https://res.cloudinary.com/kingstech/image/upload/v1667083520/profile_yznk33.png',
                ),
                onTap: () => context.go('/dashboard/profile'),
              ),
              const SizedBox(
                height: 15,
              ),
              ListTile(
                title: const Text(
                  'Logout',
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15),
                ),
                leading: Image.network(
                  'https://res.cloudinary.com/kingstech/image/upload/v1667083520/profile_yznk33.png',
                ),
                onTap: () => {
                  StorageService().setString('SA-user', ''),
                  StorageService().setString('SA-token', ''),
                  context.go('/overview')
                },
              ),
            ],
          ),
        ));
  }
}
