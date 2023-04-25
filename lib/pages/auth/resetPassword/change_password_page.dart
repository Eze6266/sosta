// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:elegant_notification/elegant_notification.dart';

import '../../../constant.dart';
import '../../../widgets/login_widget.dart';
import '../login/login_controller.dart';

class ChangePasswordPage extends StatefulWidget {
  final String token;
  const ChangePasswordPage({super.key, required this.token});
  @override
  // ignore: library_private_types_in_public_api
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();
  bool show = true;
  bool loading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginWidgetState(
        title: 'Reset password',
        description: '',
        forgotPassword: false,
        loading: loading,
        color: passwordController.text.isEmpty ||
                passwordConfirmController.text.isEmpty
            ? const Color(0xffE5E5E5)
            : primary,
        customWidget: Column(
          children: [
            SizedBox(
              height: 50,
              child: DecoratedBox(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6)),
                child: TextField(
                  controller: passwordController,
                  obscureText: show,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w300),
                  onChanged: (text) => {setState(() => text)},
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    hoverColor: Colors.transparent,
                    contentPadding: const EdgeInsets.only(
                      left: 20,
                    ),
                    hintStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w300),
                    border: InputBorder.none,
                    hintText: '********',
                    suffix: IconButton(
                      onPressed: () {
                        setState(() {
                          show = !show;
                        });
                      },
                      icon: Text(
                        show ? 'show' : 'hide',
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          color: primary,
                          fontSize: 9,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 50,
              child: DecoratedBox(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6)),
                child: TextField(
                  controller: passwordConfirmController,
                  obscureText: show,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w300),
                  onChanged: (text) => {setState(() => text)},
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    hoverColor: Colors.transparent,
                    contentPadding: const EdgeInsets.only(
                      left: 20,
                    ),
                    hintStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w300),
                    border: InputBorder.none,
                    hintText: '********',
                    suffix: IconButton(
                      onPressed: () {
                        setState(() {
                          show = !show;
                        });
                      },
                      icon: Text(
                        show ? 'show' : 'hide',
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          color: primary,
                          fontSize: 9,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        btnText: 'Reset',
        onTap: () async {
          if (passwordController.text.isNotEmpty ||
              passwordConfirmController.text.isNotEmpty) {
            setState(() {
              loading = true;
            });
            await LoginController().changePassword(
                widget.token,
                passwordController.text,
                passwordConfirmController.text,
                context);
            setState(() {
              loading = false;
            });
          }
        },
      ),
    );
  }
}
