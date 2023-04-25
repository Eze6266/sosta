import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constant.dart';
import '../../../widgets/app_button.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});
  @override
  SignupPageState createState() => SignupPageState();
}

class SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 100.w,
              child: Image.network(
                  'https://res.cloudinary.com/kingstech/image/upload/v1666101223/SOSTA-LOGO_ow9foo.png'),
            ),
            SizedBox(
              height: 50.h,
            ),
            Padding(
              padding: EdgeInsets.only(
                right: 20,
                left: 20,
              ),
              child: Image.asset('asset/images/signup.png'),
            ),
            SizedBox(
              height: 20.h,
            ),
            const Text(
              'You’re new here!',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 23),
            ),
            const Text(
              'Sign up as a',
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 30),
            ),
            SizedBox(
              height: 20.h,
            ),
            AppButton(
              text: 'Need a Service Provider? ',
              bgColor: primary,
              color: Colors.white,
              height: 55,
              width: MediaQuery.of(context).size.width / 2 + 80,
              onTap: () => context.go('/signup/mobile-number'),
            ),
            SizedBox(
              height: 10.h,
            ),
            AppButton(
              text: "I’m a Service Provider",
              width: MediaQuery.of(context).size.width / 2 + 80,
              bgColor: secondary,
              height: 55,
              color: Colors.white,
              onTap: () => context.go('/provider'),
            ),
            SizedBox(
              height: 20.h,
            ),
            const Text(
              'Already have an account?',
            ),
            SizedBox(
              height: 10.h,
            ),
            AppButton(
              text: 'Login to your Account',
              width: MediaQuery.of(context).size.width / 2 + 80,
              height: 55,
              bgColor: const Color(0xffFFD9B1),
              color: Colors.black,
              onTap: () => context.go('/login'),
            ),
          ],
        ),
      )), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
