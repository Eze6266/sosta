import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import '../../../../components/signup/signup_footer_text.dart';
import '../../../../constant.dart';
import '../../../../services/storage_service.dart';
import '../../../../widgets/app_button.dart';
import '../../widget/input_widget.dart';
import '../../widget/signup_layout.dart';

class Account extends StatefulWidget {
  const Account({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final emailController = TextEditingController();

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
                {setState(() => firstnameController.text = text)},
            hintText: 'Firstname',
            prefixText: '',
          ),
          const SizedBox(
            height: 15,
          ),
          InputWidget(
            onChanged: (text) =>
                {setState(() => lastnameController.text = text)},
            hintText: 'Lastname',
            prefixText: '',
          ),
          const SizedBox(
            height: 15,
          ),
          InputWidget(
            onChanged: (text) => {setState(() => emailController.text = text)},
            hintText: 'Email',
            prefixText: '',
          ),
          const SizedBox(
            height: 15,
          ),
        ],
        title: 'Let’s create your Account',
        description: '',
        footer: SignupFooterText(),
        button: AppButton(
            text: 'Continue',
            bgColor: emailController.text.isEmpty ||
                    firstnameController.text.isEmpty ||
                    lastnameController.text.isEmpty
                ? const Color(0xffE5E5E5)
                : primary,
            color: Colors.white,
            height: 55,
            width: MediaQuery.of(context).size.width,
            onTap: () async => {
                  if (emailController.text.isNotEmpty ||
                      firstnameController.text.isNotEmpty ||
                      lastnameController.text.isNotEmpty)
                    {
                      await StorageService().setString(
                          'signup',
                          jsonEncode({
                            'email': emailController.text,
                            'first_name': firstnameController.text,
                            'last_name': firstnameController.text,
                            ...jsonDecode(await getLogData())
                          })),
                      context.go('/provider/account/password')
                    }
                }));
    // onTap: _saveType()));
  }
}
