// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import '../../../constant.dart';
import '../../../widgets/login_widget.dart';
import 'login_controller.dart';

class RetrievePasswordPage extends StatefulWidget {
  final String password;
  const RetrievePasswordPage({super.key, required this.password});
  @override
  // ignore: library_private_types_in_public_api
  _RetrievePasswordPageState createState() => _RetrievePasswordPageState();
}

class _RetrievePasswordPageState extends State<RetrievePasswordPage> {
  final emailController = TextEditingController();
  bool show = false;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginWidgetState(
          onTap: () async {
            if (emailController.text.isNotEmpty) {
              setState(() {
                loading = true;
              });
              await LoginController()
                  .resetPassword(emailController.text, context);

              setState(() {
                loading = false;
              });
            }
          },
          title: 'Retrieve your password',
          description: 'Enter your sosta email address',
          btnText: 'Reset password',
          loading: loading,
          color:
              emailController.text.isEmpty ? const Color(0xffE5E5E5) : primary,
          customWidget: TextField(
              controller: emailController,
              obscureText: show,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              onChanged: (text) => {setState(() => text)},
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.all(5),
                labelStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xfffd9d9d9)),
                border: InputBorder.none,
                labelText: 'Email',
              ))),
    );
  }
}
