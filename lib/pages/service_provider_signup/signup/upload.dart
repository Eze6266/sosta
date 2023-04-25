// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import '../../../constant.dart';
import '../../../services/file_picker_service.dart';
import '../../../widgets/app_button.dart';
import '../widget/signup_layout.dart';

class UploadDocument extends StatefulWidget {
  const UploadDocument({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _UploadDocumentState createState() => _UploadDocumentState();
}

class _UploadDocumentState extends State<UploadDocument> {
  File? business_picture_1;
  File? business_picture_2;
  File? business_picture_3;

  @override
  @override
  Widget build(BuildContext context) {
    return SignupLayoutState(
        childrenWidget: [
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1000),
                    color: Colors.grey.shade300),
                child: Icon(
                  Icons.person,
                  size: 40,
                  color: Colors.grey.shade200,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            'Upload  pictures of your business or completed projects',
            style: TextStyle(color: primary),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              GestureDetector(
                  onTap: () async {
                    var res = await ImagePickerService().pickImageFromGallery();
                    if (res != null) {
                      setState(() {
                        business_picture_1 = res as File?;
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
                      width: 107,
                      decoration: BoxDecoration(color: Colors.white),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: business_picture_1 != null
                            ? Image.file(business_picture_1 as File)
                            : Column(
                                children: [
                                  Container(
                                    width: 31,
                                    height: 31,
                                    decoration: BoxDecoration(
                                        color: Color(0xffDFDFDF),
                                        borderRadius:
                                            BorderRadius.circular(100)),
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
                      ))),
              const SizedBox(
                width: 5,
              ),
              GestureDetector(
                  onTap: () async {
                    var res = await ImagePickerService().pickImageFromGallery();
                    if (res != null) {
                      setState(() {
                        business_picture_2 = res as File?;
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
                      width: 107,
                      decoration: BoxDecoration(color: Colors.white),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: business_picture_2 != null
                            ? Image.file(business_picture_2 as File)
                            : Column(
                                children: [
                                  Container(
                                    width: 31,
                                    height: 31,
                                    decoration: BoxDecoration(
                                        color: Color(0xffDFDFDF),
                                        borderRadius:
                                            BorderRadius.circular(100)),
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
                      ))),
              const SizedBox(
                width: 5,
              ),
              GestureDetector(
                  onTap: () async {
                    var res = await ImagePickerService().pickImageFromGallery();
                    if (res != null) {
                      setState(() {
                        business_picture_3 = res as File?;
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
                      width: 107,
                      decoration: BoxDecoration(color: Colors.white),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: business_picture_3 != null
                            ? Image.file(business_picture_3 as File)
                            : Column(
                                children: [
                                  Container(
                                    width: 31,
                                    height: 31,
                                    decoration: BoxDecoration(
                                        color: Color(0xffDFDFDF),
                                        borderRadius:
                                            BorderRadius.circular(100)),
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
                      ))),
            ],
          )
        ],
        title: 'Upload Pictures',
        description: 'Upload a personal profile picture of yourself',
        footer: const Text(
          '',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12),
        ),
        button: AppButton(
            text: 'Done',
            bgColor:
                //business_picture_1 == null ||
                //         business_picture_2 == null ||
                //         business_picture_3 == null
                //     ? const Color(0xffE5E5E5)
                //     :
                primary,
            color: Colors.white,
            height: 55,
            width: MediaQuery.of(context).size.width,
            onTap: () => {
                  // if (business_picture_1 != null ||
                  //     business_picture_2 != null ||
                  //     business_picture_3 != null)
                  //   {
                  context.go(
                      '/provider/account/password/business/business-details/upload-document/verify-documents')
                  // }
                }));
    // onTap: _saveType()));
  }
}
