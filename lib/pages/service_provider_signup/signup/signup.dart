import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:sosta/constant.dart';

import '../../../services/storage_service.dart';
import '../../../widgets/app_button.dart';
import '../widget/input_widget.dart';
import '../widget/signup_layout.dart';

class VendorSignupPage extends StatefulWidget {
  const VendorSignupPage({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _VendorSignupPageState createState() => _VendorSignupPageState();
}

class _VendorSignupPageState extends State<VendorSignupPage> {
  final phoneController = TextEditingController();
  String step = '';

  @override
  Widget build(BuildContext context) {
    return SignupLayoutState(
      childrenWidget: [
        const SizedBox(
          height: 10,
        ),
        InputWidget(
          onChanged: (text) => {setState(() => phoneController.text = text)},
          hintText: 'Phone number',
          prefixText: '',
          type: TextInputType.phone,
        ),
        const SizedBox(
          height: 15,
        ),
      ],
      title: 'Enter your Mobile Number',
      description: '',
      footer: const Text(
        'By continuing, you may recieve an SMS for verification. Message and data rates may apply.',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 12),
      ),
      button: AppButton(
        text: 'Continue',
        bgColor:
            phoneController.text.isEmpty ? const Color(0xffE5E5E5) : primary,
        color: Colors.white,
        height: 55,
        width: MediaQuery.of(context).size.width,
        onTap: () async => {
          if (phoneController.text.isNotEmpty)
            {
              await StorageService().setString(
                  'signup',
                  jsonEncode(
                      {'phone_number': phoneController.text, 'role': 'non'})),
              context.go('/provider/account')
            }
        },
      ),
    );
  }
}
