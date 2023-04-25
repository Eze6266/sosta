import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import 'package:go_router/go_router.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../components/Card/vendor_card.dart';
import '../../../components/Navigation/bottom_nav.dart';
import '../../../constant.dart';
import '../../../services/api.dart';

class AllVendorMerchantPage extends StatefulWidget {
  const AllVendorMerchantPage({super.key, this.id});

  final String? id;
  @override
  // ignore: library_private_types_in_public_api
  _AllVendorMerchantPageState createState() => _AllVendorMerchantPageState();
}

class _AllVendorMerchantPageState extends State<AllVendorMerchantPage> {
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
    log('Value of id is ${widget.id}');
    var res = await Api.searchForProviders(widget.id ?? '');
    // var res = await Api.fetchService();
    // final rexx = jsonDecode(res);
    for (var element in res) {
      log(element.toString());
    }
    // log(rexx['data'].toString());
    // setState(() {
    //   transactions = rexx['data'];
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text(
              'Mechanics',
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
        bottomSheet: BottomNavWidget(),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.only(left: 17, right: 17),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 275.w,
                          child: TextField(
                            // controller: emailController,
                            textAlignVertical: TextAlignVertical.center,
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400),
                            onChanged: (text) => {
                              setState(() => {
                                    print(text),
                                    context.go('/dashboard/service-search',
                                        extra: text)
                                  })
                            },
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                // contentPadding: EdgeInsets.all(10),
                                hintStyle: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w300),
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
                          width: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: primary,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 10, left: 10, bottom: 10, right: 10),
                            child: SvgPicture.asset('asset/images/search.svg'),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    VendorCardWidget()
                  ],
                ))));
  }
}
