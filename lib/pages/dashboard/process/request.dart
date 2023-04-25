// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../constant.dart';
import '../../../models/service_providers_model.dart';
import '../../../services/api.dart';
import '../../../services/storage_service.dart';
import '../../../widgets/app_button.dart';
import 'cancel.dart';

class RequestProcess extends StatefulWidget {
  ServiceProviderModel? model;
  RequestProcess({super.key, this.model});

  @override
  State<RequestProcess> createState() => RequestProcessState();
}

class RequestProcessState extends State<RequestProcess> {
  @override
  Widget build(BuildContext context) {
    return AppButton(
        text: 'Accept N${widget.model!.maxprice!}',
        onTap: () async {
          Navigator.pop(context);
          await makeBooking();
          callModalTwo();
        },
        color: Colors.white,
        bgColor: tertiary);
  }

  callModalTwo() {
    showModalBottomSheet(
        context: context,
        enableDrag: true,
        isDismissible: true,
        isScrollControlled: true,
        useRootNavigator: true,
        builder: (context) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                    child: Padding(
                        padding: EdgeInsets.only(
                          top: 42,
                          bottom: 42,
                          right: 32,
                          left: 32,
                        ),
                        child: Column(
                          children: [
                            Positioned(
                              top: -140,
                              left: 125,
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Color(0xffFFD9B1), width: 6),
                                    borderRadius: BorderRadius.circular(1000),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            widget.model!.imgurl!))),
                                height: 157.h,
                                width: 157.w,
                              ),
                            ),
                            Text(
                              widget.model!.name!,
                              style: TextStyle(
                                  color: tertiary,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () async => {
                                    await launchUrl(Uri(
                                        scheme: 'tel',
                                        path: 'tel:${widget.model!.phone!}')),
                                    //print('test test')
                                  },
                                  child: CallCardWidget(
                                    title: 'Call',
                                    url:
                                        'https://res.cloudinary.com/kingstech/image/upload/v1670507188/call_rc5210.png',
                                  ),
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                GestureDetector(
                                  onTap: () => context.go('/dashboard/call'),
                                  child: CallCardWidget(
                                    url:
                                        'https://res.cloudinary.com/kingstech/image/upload/v1670507188/inappcall_nudhvj.png',
                                    title: 'In-App Call ',
                                  ),
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                GestureDetector(
                                  onTap: () => context.go('/dashboard/chat'),
                                  child: CallCardWidget(
                                    url:
                                        'https://res.cloudinary.com/kingstech/image/upload/v1670507188/message_e9gw7x.png',
                                    title: 'Message',
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Mechanic'),
                                SizedBox(
                                  width: 5,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: primary,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: primary,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: primary,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: primary,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '18 Min Away',
                                  style:
                                      TextStyle(color: primary, fontSize: 14),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 48,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      color: Color(0xffff1f1f1), width: 2)
                                  // boxShadow: [
                                  //   BoxShadow(
                                  //     color: Color(0xffff1f1f1), //(x,y)
                                  //   ),
                                  // ],
                                  ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Waiting for a professional arrival',
                                  style: TextStyle(color: primary),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  flex: 6,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Location'),
                                      Text(
                                          '98 Ajayi Close, Prime Estate, Lekki Phase 1')
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                    flex: 4,
                                    child: Text(
                                      'Change',
                                      style: TextStyle(
                                          color: primary, fontSize: 14),
                                      textAlign: TextAlign.right,
                                    ))
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            CancelBooking(),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        )))
              ],
            ));
  }

  makeBooking() async {
    var res = jsonDecode(await StorageService().getString('SA-user'));
    Api.makeBooking(
        widget.model!.id,
        res['id'],
        widget.model!.userBookingtime,
        widget.model!.userBookingdate,
        widget.model!.maxprice,
        widget.model!.maxprice);
  }
}

class CallCardWidget extends StatelessWidget {
  String url;
  String title;
  CallCardWidget({
    super.key,
    required this.url,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 53,
          width: 53,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: Color(0xffff1f1f1), width: 2)),
          child: Align(
            alignment: Alignment.center,
            child: CachedNetworkImage(
              placeholder: (context, url) => const CircularProgressIndicator(),
              imageUrl: url,
            ),
            // Image.network(url),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(title)
      ],
    );
  }
}
