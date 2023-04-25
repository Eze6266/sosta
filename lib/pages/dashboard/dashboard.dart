import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:go_router/go_router.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/Navigation/bottom_nav.dart';
import '../../components/dashboard_header.dart';
import '../../constant.dart';
import '../../services/api.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool show = false;
  int wallet = 0;

  @override
  void initState() {
    super.initState();
    getCategories();
  }

  void getCategories() async {
    try {
      var res = await Api.fetchWalletBalance();
      print(res['available_balance']);

      setState(() {
        wallet = jsonDecode(res)['available_balance'];
      });
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          bottomSheet: BottomNavWidget(),
          body: SingleChildScrollView(
              child: Builder(
                  builder: (BuildContext context) => Padding(
                        padding: const EdgeInsets.only(
                          left: 30,
                          right: 30,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            DashboardHeaderWidget(),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 200,
                              width: MediaQuery.of(context).size.width,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                    color: tertiary,
                                    borderRadius: BorderRadius.circular(6)),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'How would you like us to help you?',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 25,
                                color: secondary,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 250.w,
                                  child: TextField(
                                    // controller: emailController,
                                    textAlignVertical: TextAlignVertical.center,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                    onChanged: (text) => {
                                      setState(() => {
                                            context.go(
                                                '/dashboard/service-search',
                                                extra: text)
                                          })
                                    },
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        // contentPadding: EdgeInsets.all(10),
                                        hintStyle: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w300),
                                        border: InputBorder.none,
                                        hintText: 'I’m looking for...',
                                        hoverColor: Colors.transparent,
                                        prefixIcon: SvgPicture.asset(
                                          'asset/images/searchIcon.svg',
                                          height: 5,
                                          width: 5,
                                          fit: BoxFit.scaleDown,
                                        )),
                                  ),
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: primary,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: 10,
                                        left: 10,
                                        bottom: 10,
                                        right: 10),
                                    child: SvgPicture.asset(
                                        'asset/images/search.svg'),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 94,
                                  height: 120,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              'https://res.cloudinary.com/kingstech/image/upload/v1667085184/plumbing_ccrv88.png'))),
                                  child: GestureDetector(
                                    onTap: () => {},
                                  ),
                                ),
                                Container(
                                  width: 94,
                                  height: 120,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              'https://res.cloudinary.com/kingstech/image/upload/v1667085572/mechanic_x6emyp.png'))),
                                  child: GestureDetector(
                                    onTap: () async {},
                                  ),
                                ),
                                Container(
                                  width: 94,
                                  height: 120,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              'https://res.cloudinary.com/kingstech/image/upload/v1667085572/moving_cdkign.png'))),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 94,
                                  height: 120,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              'https://res.cloudinary.com/kingstech/image/upload/v1667085572/furniture_uwa1tz.png'))),
                                ),
                                Container(
                                  width: 94,
                                  height: 120,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              'https://res.cloudinary.com/kingstech/image/upload/v1667085572/drycleaning_ujvtxn.png'))),
                                ),
                                Container(
                                  width: 94,
                                  height: 120,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              'https://res.cloudinary.com/kingstech/image/upload/v1667085572/electrician_fqnvqp.png'))),
                                  child: GestureDetector(
                                    onTap: () => {},
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 100,
                            ),
                          ],
                        ),
                      )))),
    );
  }
}
