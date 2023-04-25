import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import '../constant.dart';
import 'app_button.dart';

// ignore: must_be_immutable
class LoginWidgetState extends StatelessWidget {
  String title;
  String description;
  String btnText;
  bool forgotPassword;
  bool loading;
  Color color;
  dynamic onTap;
  Widget customWidget;
  LoginWidgetState(
      {super.key,
      required this.title,
      required this.description,
      required this.color,
      this.onTap,
      required this.customWidget,
      this.forgotPassword = false,
      this.loading = false,
      this.btnText = 'Continue'});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Login',
            style: TextStyle(
                fontSize: 14, color: Colors.black, fontWeight: FontWeight.w300),
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
        margin: const EdgeInsets.only(right: 40, left: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 25),
            ),
            Text(
              description,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
            ),
            const SizedBox(
              height: 27,
            ),
            customWidget,
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  child: Text(
                    forgotPassword ? 'Forgot Password?' : '',
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: primary,
                    ),
                  ),
                  onTap: () => context.go('/password/retrieve-password'),
                ),
              ],
            ),
            SizedBox(
              height: forgotPassword ? 25 : 0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Don’t have an account? ',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                ),
                GestureDetector(
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: primary),
                  ),
                  onTap: () => context.go('/signup'),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Row(children: [
              Expanded(
                child: AppButton(
                    text: btnText,
                    height: 50,
                    bgColor: color,
                    color: Colors.white,
                    onTap: onTap,
                    loading: loading),
              )
            ])
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
