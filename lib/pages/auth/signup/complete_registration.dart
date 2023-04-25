import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:go_router/go_router.dart';

import '../../../constant.dart';
import '../../../widgets/app_button.dart';

class CompleteRegistrationPage extends StatefulWidget {
  const CompleteRegistrationPage({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _CompleteRegistrationPageState createState() =>
      _CompleteRegistrationPageState();
}

class _CompleteRegistrationPageState extends State<CompleteRegistrationPage> {
  final passwordController = TextEditingController();
  bool show = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                  colors: [secondary, Colors.white],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter),
              image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                      secondary.withOpacity(0.1), BlendMode.dstATop),
                  fit: BoxFit.cover,
                  image: const NetworkImage(
                      'https://res.cloudinary.com/kingstech/image/upload/v1667069879/bg_rrf8rq.jpg'))),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(right: 22, left: 22),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Registration Successful',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 20),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Welcome to Sosta',
                  style: GoogleFonts.sacramento(
                      fontSize: 51,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 32,
                ),
                const Text(
                  '''Hi John Doe, 
                
We have been waiting for someone like you to take things to the next level. 

We would be keeping in touch and following up with you on any of your needs that might arise. 
Don’t hesitate to contact us if any issue arise while using our app. 

Thank you once again for choosing us to help manage your provision of services.

Yours sincerely,''',
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(
                  height: 28,
                ),
                Image.network(
                    'https://res.cloudinary.com/kingstech/image/upload/v1667072910/logo-white_w567zi.png'),
                const SizedBox(
                  height: 48,
                ),
                AppButton(
                  text: 'Continue',
                  bgColor: primary,
                  color: Colors.white,
                  height: 55,
                  width: MediaQuery.of(context).size.width,
                  onTap: () => context.go('/login'),
                ),
              ],
            ),
          )),
    );
  }
}
