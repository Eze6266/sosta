// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:go_router/go_router.dart';

import '../../constant.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final passwordController = TextEditingController();
  bool show = false;
  bool light0 = false;
  bool colorSwitch = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text(
              'Settings',
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
        body: Container(
          margin: EdgeInsets.only(left: 40, right: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.only(left: 35),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Contact us',
                        style: TextStyle(
                            color: tertiary,
                            fontWeight: FontWeight.w300,
                            fontSize: 18)),
                    Text('you can reach us at anytime',
                        style: TextStyle(
                            color: tertiary,
                            fontWeight: FontWeight.w300,
                            fontSize: 12))
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset('asset/images/smileyIcon.svg'),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Face ID/Touch ID',
                              style: TextStyle(
                                  color: tertiary,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 18)),
                          Text('Change between Face and Touch ID',
                              style: TextStyle(
                                  color: tertiary,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12)),
                        ],
                      ),
                    ],
                  ),
                  Switch(
                    value: light0,
                    activeColor: Color(0xfff66BF49),
                    onChanged: (bool value) {
                      setState(() {
                        light0 = value;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset('asset/images/switchIcon.svg'),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Dark Mode',
                              style: TextStyle(
                                  color: tertiary,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 18)),
                          Text('You can change the display mode ',
                              style: TextStyle(
                                  color: tertiary,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12)),
                        ],
                      ),
                    ],
                  ),
                  Switch(
                    value: colorSwitch,
                    activeColor: Color(0xfff66BF49),
                    onChanged: (bool value) {
                      setState(() {
                        colorSwitch = value;
                      });
                    },
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
