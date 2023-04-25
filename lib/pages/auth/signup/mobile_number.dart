import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import '../../../constant.dart';
import '../../../widgets/app_button.dart';
import '../../service_provider_signup/widget/input_widget.dart';

class MobileNumberPage extends StatefulWidget {
  const MobileNumberPage({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _MobileNumberPageState createState() => _MobileNumberPageState();
}

class _MobileNumberPageState extends State<MobileNumberPage> {
  final phoneController = TextEditingController();
  bool show = false;

  @override
  Widget build(BuildContext context) {
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
                'Enter your Mobile Number',
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
                    {setState(() => phoneController.text = text)},
                hintText: 'Phone number (+234)',
                prefixText: '',
                type: TextInputType.phone,
              ),
              // TextField(
              //     controller: phoneController,
              //     keyboardType: TextInputType.number,
              //     style: const TextStyle(
              //         fontSize: 14, fontWeight: FontWeight.w400),
              //     onChanged: (text) => {setState(() => text)},
              //     decoration: const InputDecoration(
              //       filled: true,
              //       fillColor: Colors.white,
              //       contentPadding: EdgeInsets.all(10),
              //       hintStyle:
              //           TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              //       border: InputBorder.none,
              //       hintText: ' 8063234322',
              //       hoverColor: Colors.transparent,
              //       prefixText: '+234',
              //       // prefixIcon: Center(
              //       //   // mainAxisAlignment: MainAxisAlignment.center,
              //       //   // crossAxisAlignment: CrossAxisAlignment.center,
              //       //   child: Text('+234'),
              //     )),
              const SizedBox(
                height: 30,
              ),
              AppButton(
                  text: 'Continue',
                  bgColor: phoneController.text.isEmpty
                      ? const Color(0xffE5E5E5)
                      : primary,
                  color: Colors.white,
                  height: 55,
                  width: MediaQuery.of(context).size.width,
                  onTap: () => {
                        if (phoneController.text.isNotEmpty)
                          {
                            context.go('/signup/name',
                                extra: phoneController.text),
                          }
                      }),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'By continuing, you may recieve an SMS for verification. Message and data rates may apply.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12),
              )
            ],
          ),
        )));
  }
}
