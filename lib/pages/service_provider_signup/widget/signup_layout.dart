// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import '../../../constant.dart';

// ignore: must_be_immutable
class SignupLayoutState extends StatelessWidget {
  String title;
  dynamic description;
  List<Widget> childrenWidget;
  Widget footer;
  Widget button;

  SignupLayoutState({
    super.key,
    required this.childrenWidget,
    required this.title,
    required this.footer,
    required this.button,
    this.description,
  });

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
              onPressed: () => Navigator.of(context).pop(),
              color: const Color.fromARGB(255, 109, 105, 105),
              icon: Image.network(
                  'https://res.cloudinary.com/kingstech/image/upload/v1666210470/arrow_ockvre.png'),
              //replace with our own icon data.
            )),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.only(left: 27, right: 27),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 25,
                  color: tertiary,
                ),
              ),
              Text(
                description,
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 14,
                  color: tertiary,
                ),
              ),
              ...childrenWidget,
              const SizedBox(
                height: 15,
              ),
              footer,
              const SizedBox(
                height: 25,
              ),
              button
            ],
          ),
        )));
  }
}
