// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:sosta/pages/service_provider_signup/signup/signup_provider_controller.dart';

import '../../../constant.dart';
import '../../../services/file_picker_service.dart';
import '../../../widgets/app_button.dart';
import '../widget/signup_layout.dart';

class UploadDocumentVerify extends StatefulWidget {
  const UploadDocumentVerify({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _UploadDocumentVerifyState createState() => _UploadDocumentVerifyState();
}

class _UploadDocumentVerifyState extends State<UploadDocumentVerify> {
  File? verify_pic;

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return SignupLayoutState(
        childrenWidget: [
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () async {
              var res = await ImagePickerService().pickImageFromGallery();
              if (res != null) {
                setState(() {
                  verify_pic = res as File?;
                });
              } else {
                ElegantNotification.error(
                        title: Text("Error"),
                        description: Text("Unable to pick image"))
                    .show(context);
              }
              print(res);
            },
            child: Container(
                height: 110,
                width: MediaQuery.of(context).size.width - 30,
                decoration: BoxDecoration(color: Colors.white),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: verify_pic != null
                      ? Image.file(verify_pic as File)
                      : Column(
                          children: [
                            Container(
                              width: 31,
                              height: 31,
                              decoration: BoxDecoration(
                                  color: Color(0xffDFDFDF),
                                  borderRadius: BorderRadius.circular(100)),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              'Upload  your business picture',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 11, color: Color(0xffD9D9D9)),
                            )
                          ],
                        ),
                )),
          )
        ],
        title: 'Verify yourself',
        description:
            'Upload a government issued ID for verification purpose eg. NIN Card, Voter’s Card, International Passport.',
        footer: const Text(
          '',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12),
        ),
        button: AppButton(
            text: 'Complete signup',
            bgColor: primary,
            color: Colors.white,
            height: 55,
            width: MediaQuery.of(context).size.width,
            loading: loading,
            onTap: () async {
              // if (verify_pic != null) {
              setState(() {
                loading = true;
              });
              await SignupProviderController().register(context);
              // context.go('/signup/complete');
              setState(() {
                loading = false;
              });
              // }
            }));
    // onTap: _saveType()));
  }
}
