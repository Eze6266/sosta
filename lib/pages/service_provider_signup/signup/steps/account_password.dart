// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import '../../../../components/signup/signup_footer_text.dart';
import '../../../../constant.dart';
import '../../../../services/storage_service.dart';
import '../../../../widgets/app_button.dart';
import '../../widget/input_widget.dart';
import '../../widget/signup_layout.dart';

class AccountPassword extends StatefulWidget {
  const AccountPassword({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _AccountPasswordState createState() => _AccountPasswordState();
}

class _AccountPasswordState extends State<AccountPassword> {
  final confirmPasswordController = TextEditingController();
  final passwordController = TextEditingController();

  getLogData() async {
    return await StorageService().getString('signup');
  }

  @override
  Widget build(BuildContext context) {
    return SignupLayoutState(
        childrenWidget: [
          const SizedBox(
            height: 10,
          ),
          InputWidget(
            onChanged: (text) =>
                {setState(() => passwordController.text = text)},
            hintText: 'Type a new password',
            prefixText: '',
            obscureText: true,
            maxlines: 1,
          ),
          Text(
            'minimum 8 characters long',
            style: TextStyle(
                color: Color(0xfff1A1A1A),
                fontSize: 10,
                fontWeight: FontWeight.w300),
          ),
          const SizedBox(
            height: 15,
          ),
          InputWidget(
            onChanged: (text) =>
                {setState(() => confirmPasswordController.text = text)},
            hintText: 'Confirm Password',
            prefixText: '',
            obscureText: true,
            maxlines: 1,
          ),
          const SizedBox(
            height: 15,
          ),
        ],
        title: 'Create new login details for your account',
        description: '',
        footer: SignupFooterText(),
        button: AppButton(
            text: 'Continue',
            bgColor: confirmPasswordController.text.isEmpty ||
                    passwordController.text.isEmpty
                ? const Color(0xffE5E5E5)
                : primary,
            color: Colors.white,
            height: 55,
            width: MediaQuery.of(context).size.width,
            onTap: () async => {
                  if (confirmPasswordController.text.isNotEmpty ||
                      passwordController.text.isNotEmpty)
                    {
                      await StorageService().setString(
                          'signup',
                          jsonEncode({
                            'password': passwordController.text,
                            'password_confirmation':
                                confirmPasswordController.text,
                            ...jsonDecode(await getLogData())
                          })),
                      context.go('/provider/account/password/business')
                    }
                }));
    // onTap: _saveType()));
  }
}
