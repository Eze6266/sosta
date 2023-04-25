import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:sosta/pages/auth/signup/signup_controller.dart';
import 'package:sosta/pages/auth/signup/signup_name.dart';

import '../../../components/signup/signup_footer_text.dart';
import '../../../constant.dart';
import '../../../widgets/app_button.dart';
import '../../service_provider_signup/widget/input_widget.dart';

class SignupPasswordPage extends StatefulWidget {
  RegisterName? details;
  SignupPasswordPage({super.key, required this.details});
  @override
  // ignore: library_private_types_in_public_api
  _SignupPasswordPageState createState() => _SignupPasswordPageState();
}

class _SignupPasswordPageState extends State<SignupPasswordPage> {
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();
  final emailController = TextEditingController();
  bool show = false;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    print(widget.details);
    return Scaffold(
        appBar: AppBar(
            title: const Text(
              '',
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w300),
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
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.only(left: 37, right: 37),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Create new login details for your account',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 25,
                  color: tertiary,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              InputWidget(
                onChanged: (text) =>
                    {setState(() => emailController.text = text)},
                hintText: 'Email Address',
                prefixText: '',
                type: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 20,
              ),
              InputWidget(
                onChanged: (text) =>
                    {setState(() => passwordController.text = text)},
                hintText: 'Type a new password',
                prefixText: '',
                obscureText: true,
                type: TextInputType.text,
              ),
              const SizedBox(
                height: 20,
              ),
              InputWidget(
                onChanged: (text) =>
                    {setState(() => passwordConfirmController.text = text)},
                hintText: 'Confirm Password',
                prefixText: '',
                obscureText: true,
                type: TextInputType.text,
              ),
              const SizedBox(
                height: 60,
              ),
              AppButton(
                  text: 'Signup',
                  bgColor: emailController.text.isEmpty ||
                          passwordController.text.isEmpty ||
                          passwordConfirmController.text.isEmpty
                      ? const Color(0xffE5E5E5)
                      : primary,
                  color: Colors.white,
                  height: 55,
                  width: MediaQuery.of(context).size.width,
                  loading: loading,
                  onTap: () async {
                    if (emailController.text.isNotEmpty ||
                        passwordController.text.isNotEmpty ||
                        passwordConfirmController.text.isNotEmpty &&
                            passwordController.text ==
                                passwordConfirmController.text) {
                      setState(() {
                        loading = true;
                      });
                      await SignupController().register(
                          widget.details,
                          AuthDetails(
                              email: emailController.text,
                              password: passwordController.text,
                              confirmPassword: passwordConfirmController.text),
                          context);
                      setState(() {
                        loading = false;
                      });
                    }
                    // else {
                    //   ElegantNotification.error(
                    //           title: Text("Error"),
                    //           description: Text("Password does not match"))
                    //       .show(context);
                    // }
                  }),
              const SizedBox(
                height: 15,
              ),
              SignupFooterText()
            ],
          ),
        )));
  }
}

class AuthDetails {
  String email;
  String password;
  String confirmPassword;

  AuthDetails(
      {required this.email,
      required this.password,
      required this.confirmPassword});
}
