// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:go_router/go_router.dart';

import '../../../components/Navigation/vendor_bottom_nav.dart';
import '../../../constant.dart';
import '../../../services/storage_service.dart';

class VendorDashboardPage extends StatefulWidget {
  const VendorDashboardPage({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _VendorDashboardPageState createState() => _VendorDashboardPageState();
}

class _VendorDashboardPageState extends State<VendorDashboardPage> {
  final passwordController = TextEditingController();
  bool show = false;
  String name = '';

  @override
  void initState() {
    super.initState();
    getUserDetails();
  }

  void getUserDetails() async {
    var res = await StorageService().getString('SA-user');
    setState(() {
      name = jsonDecode(res)['first_name'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomSheet: VendorBottomNavWidget(),
        body: SingleChildScrollView(
            child: Builder(
                builder: (BuildContext context) => Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 32),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '$name',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 24,
                                      color: secondary,
                                    ),
                                  ),
                                  const Text(
                                    'Auto Mechanic',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: secondary,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () =>
                                    context.go('/provider/dashboard/sidebar'),
                                child: Container(
                                  height: 58,
                                  width: 58,
                                  child: Icon(
                                    Icons.notifications_none,
                                    size: 24,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 80,
                                width:
                                    (MediaQuery.of(context).size.width - 65) /
                                        2,
                                decoration: BoxDecoration(
                                    color: Color(0xffEBEDFF),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Ratings'),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              size: 17,
                                              color: Color(0xffFF8E1B),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              '0',
                                              style: TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.w800),
                                            )
                                          ],
                                        ),
                                      ]),
                                ),
                              ),
                              SizedBox(
                                width: 1,
                              ),
                              Container(
                                height: 80,
                                width:
                                    (MediaQuery.of(context).size.width - 65) /
                                        2,
                                decoration: BoxDecoration(
                                    color: Color(0xffEBEDFF),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Image.network(
                                                'https://res.cloudinary.com/kingstech/image/upload/v1667084881/wallet_balance_bf3f5e.png'),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text('Wallet Balance')
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          'N0',
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.w800),
                                        )
                                      ]),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                              height: 87,
                              decoration: BoxDecoration(
                                color: Color(0xffE5EEE2),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: 20, bottom: 20, left: 5, right: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text('Active Jobs'),
                                        Text(
                                          '0',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w800,
                                              fontSize: 20,
                                              color: tertiary),
                                        )
                                      ],
                                    ),
                                    VerticalDivider(
                                      width: 20,
                                      thickness: 1,
                                      // indent: 20,
                                      endIndent: 0,
                                      color: Colors.grey,
                                    ),
                                    Column(
                                      children: [
                                        Text('Pending Jobs'),
                                        Text('0',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w800,
                                                fontSize: 20,
                                                color: tertiary))
                                      ],
                                    ),
                                    VerticalDivider(
                                      width: 20,
                                      thickness: 1,
                                      // indent: 20,
                                      endIndent: 0,
                                      color: Colors.grey,
                                    ),
                                    Column(
                                      children: [
                                        Text('Completed Jobs'),
                                        Text('0',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w800,
                                                fontSize: 20,
                                                color: tertiary))
                                      ],
                                    ),
                                  ],
                                ),
                              )),
                          Align(
                            alignment: Alignment.center,
                            child: SvgPicture.asset('asset/images/noJob.svg'),
                          ),

                          SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              'No Active jobs yet!',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.w300,
                                  color: tertiary),
                            ),
                          )
                          // SvgPicture.asset('asset/images/getVerified.svg'),
                        ],
                      ),
                    ))));
  }
}
