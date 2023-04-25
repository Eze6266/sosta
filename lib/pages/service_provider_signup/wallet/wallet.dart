// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:go_router/go_router.dart';

import '../../../components/Navigation/sidebar_widget.dart';
import '../../../constant.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _WalletPageState createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  final passwordController = TextEditingController();
  bool show = false;

  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // key: _scaffoldKey,
        drawer: Drawer(
            backgroundColor: const Color(0xffF5F5F5), child: SidebarWidget()),
        bottomSheet: Container(
          height: 69,
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 3),
                ),
              ],
              borderRadius: BorderRadius.circular(6)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () => context.go('/dashboard'),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      'https://res.cloudinary.com/kingstech/image/upload/v1667085954/dash_hqwirz.png',
                    ),
                    const Text(
                      'Home',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                    )
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    'https://res.cloudinary.com/kingstech/image/upload/v1667085954/home_mnqdzr.png',
                  ),
                  const Text(
                    'Jobs',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    'https://res.cloudinary.com/kingstech/image/upload/v1667085954/home_mnqdzr.png',
                  ),
                  const Text(
                    'Messages',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    'https://res.cloudinary.com/kingstech/image/upload/v1667085954/account_k8dyry.png',
                  ),
                  const Text(
                    'Account',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                  )
                ],
              )
            ],
          ),
        ),
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
                                  const Text(
                                    'John Duoff',
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
                                onTap: () => Scaffold.of(context).openDrawer(),
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
                                              '4.52',
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
                                          'N58,000',
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
