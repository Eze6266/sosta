// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:go_router/go_router.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constant.dart';
import '../../../../services/api.dart';
import '../../widget/input_widget.dart';

class VendorBookingPage extends StatefulWidget {
  const VendorBookingPage({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _VendorBookingPageState createState() => _VendorBookingPageState();
}

class _VendorBookingPageState extends State<VendorBookingPage> {
  final passwordController = TextEditingController();
  bool show = false;
  String text = '';
  List transactions = [];

  void initState() {
    super.initState();
    getTransactions();
  }

  void getTransactions() async {
    print('bookings API');
    var res = await Api.fetchService();
    setState(() {
      transactions = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text(
              'Bookings',
              style: TextStyle(
                  fontSize: 16,
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
                padding: const EdgeInsets.only(left: 17, right: 17),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InputWidget(
                      onChanged: (text) {},
                      hintText: 'Search',
                      prefixText: '',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 44.h,
                                  width: 44.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(1000),
                                      color: Color(0xffEBEDFF)),
                                  child: Image.network(
                                      'https://res.cloudinary.com/kingstech/image/upload/v1668349593/booking_iobz6n.png'),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Car repair from John doe',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 14,
                                          color: tertiary),
                                    ),
                                    Text(
                                      '24, Sept, 2022  |  9:14 am',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 12),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'N2,500',
                          style: TextStyle(
                            color: Color(0xfff27AE60),
                          ),
                        ),
                      ],
                    ),
                  ],
                ))));
  }
}
