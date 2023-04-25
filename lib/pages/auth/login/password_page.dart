import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:elegant_notification/elegant_notification.dart';

import '../../../constant.dart';
import '../../../widgets/login_widget.dart';
import 'login_controller.dart';

class PasswordPage extends StatefulWidget {
  final String email;
  const PasswordPage({super.key, required this.email});
  @override
  // ignore: library_private_types_in_public_api
  _PasswordPageState createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  final passwordController = TextEditingController();
  bool show = true;
  bool loading = false;

  @override
  void initState() {
    passwordController.text = 'password';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginWidgetState(
        title: 'What’s your Password?',
        description: 'Enter the Password you use to sign in to Sosta ',
        forgotPassword: true,
        loading: loading,
        color:
            passwordController.text.isEmpty ? const Color(0xffE5E5E5) : primary,
        customWidget: SizedBox(
          height: 50,
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(6)),
            child: TextField(
              controller: passwordController,
              obscureText: show,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
              onChanged: (text) => {setState(() => text)},
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                hoverColor: Colors.transparent,
                contentPadding: const EdgeInsets.only(
                  left: 20,
                ),
                hintStyle:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
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
        btnText: 'Login',
        onTap: () async {
          if (passwordController.text.isNotEmpty) {
            setState(() {
              loading = true;
            });
            await LoginController()
                .login(widget.email, passwordController.text, context);
            setState(() {
              loading = false;
            });
          }
        },
      ),
    );
  }
}
