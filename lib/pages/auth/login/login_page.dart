import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:go_router/go_router.dart';

import '../../../constant.dart';
import '../../../widgets/login_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    emailController.text = 'difej25324@minterp.com';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginWidgetState(
        title: 'What’s your email?',
        description: 'Enter the email address you use to sign in to Sosta',
        color: emailController.text.isEmpty ? const Color(0xffE5E5E5) : primary,
        customWidget: SizedBox(
            height: 59,
            child: DecoratedBox(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
              child: TextField(
                controller: emailController,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                onChanged: (text) => {setState(() => text)},
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    // filled: true,
                    // fillColor: Colors.white,
                    contentPadding: EdgeInsets.only(left: 20, top: 7),
                    labelStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color(0xfffD9D9D9)),
                    border: InputBorder.none,
                    labelText: 'Username/Email Address',
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: primary)),
                    hoverColor: Colors.transparent),
              ),
            )),
        onTap: () async {
          if (emailController.text.isNotEmpty) {
            context.go('/password', extra: emailController.text);
          }
        },
      ),
    );
  }
}
