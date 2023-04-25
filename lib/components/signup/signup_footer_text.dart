// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../../constant.dart';

class SignupFooterText extends StatelessWidget {
  const SignupFooterText({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Text(
          'By registering, you accept our ',
          style: TextStyle(fontSize: 12, color: tertiary),
        ),
        Text(
          'Terms & Conditions',
          style: TextStyle(fontSize: 12, color: primary),
        ),
        Text(
          ' and',
          style: TextStyle(fontSize: 12, color: tertiary),
        ),
        Text(
          ' Privacy Policy',
          style: TextStyle(fontSize: 12, color: primary),
        ),
        Text(
          '. Your data will be securely encrypted',
          style: TextStyle(fontSize: 12, color: tertiary),
        )
      ],
    );
  }
}
