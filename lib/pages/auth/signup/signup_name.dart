import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import '../../../components/signup/signup_footer_text.dart';
import '../../../constant.dart';
import '../../../widgets/app_button.dart';
import '../../service_provider_signup/widget/input_widget.dart';

class SignupNamePage extends StatefulWidget {
  String phone;
  SignupNamePage({super.key, required this.phone});
  @override
  // ignore: library_private_types_in_public_api
  _SignupNamePageState createState() => _SignupNamePageState();
}

class _SignupNamePageState extends State<SignupNamePage> {
  final usernameController = TextEditingController();
  final lastnameController = TextEditingController();
  final firstnameController = TextEditingController();
  bool show = false;

  @override
  Widget build(BuildContext context) {
    RegisterName personalDetails;
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
                'Let’s create your Account',
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
                    {setState(() => usernameController.text = text)},
                hintText: 'Username (@jubelo)',
                prefixText: '',
                type: TextInputType.name,
              ),
              const SizedBox(
                height: 20,
              ),
              InputWidget(
                onChanged: (text) =>
                    {setState(() => firstnameController.text = text)},
                hintText: 'Firstname',
                prefixText: '',
                type: TextInputType.name,
              ),
              const SizedBox(
                height: 20,
              ),
              InputWidget(
                onChanged: (text) =>
                    {setState(() => lastnameController.text = text)},
                hintText: 'Lastname',
                prefixText: '',
                type: TextInputType.name,
              ),
              const SizedBox(
                height: 60,
              ),
              AppButton(
                text: 'Continue',
                bgColor: usernameController.text.isEmpty ||
                        firstnameController.text.isEmpty ||
                        lastnameController.text.isEmpty
                    ? const Color(0xffE5E5E5)
                    : primary,
                color: Colors.white,
                height: 55,
                width: MediaQuery.of(context).size.width,
                onTap: () => {
                  if (usernameController.text.isNotEmpty ||
                      firstnameController.text.isNotEmpty ||
                      lastnameController.text.isNotEmpty)
                    {
                      personalDetails = RegisterName(
                          username: usernameController.text,
                          first_name: firstnameController.text,
                          last_name: lastnameController.text,
                          phone: widget.phone),
                      context.go('/signup/password', extra: personalDetails)
                    }
                },
              ),
              const SizedBox(
                height: 15,
              ),
              SignupFooterText()
            ],
          ),
        )));
  }
}

class RegisterName {
  String username;
  String first_name;
  String last_name;
  String phone;
  RegisterName(
      {required this.username,
      required this.first_name,
      required this.last_name,
      required this.phone});
}
