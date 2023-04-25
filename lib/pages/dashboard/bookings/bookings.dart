// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import 'package:go_router/go_router.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sosta/constant.dart';

import '../../../services/api.dart';
import '../../service_provider_signup/widget/input_widget.dart';
import '../booking_type/booking_type.dart';
import '../booking_type/datum.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final passwordController = TextEditingController();
  bool show = false;
  String text = '';
  List<Datum> bookings = [];

  void initState() {
    super.initState();
    getBookings();
  }

  void getBookings() async {
    print('Bookings api called');
    try {
      var res = await Api.fetchBookings();

      final initialList = BookingType.fromJson(res);
      print(res);

      setState(() {
        // bookings = initialList.data ?? [];
      });
    } catch (e) {
      // ElegantNotification.error(
      //         title: Text("Error"), description: Text(e.toString()))
      //     .show(context);
    }
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
                    bookings.isEmpty
                        ? Column(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child:
                                    SvgPicture.asset('asset/images/noJob.svg'),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'No bookings yet!',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.w300,
                                      color: tertiary),
                                ),
                              )
                            ],
                          )
                        : Column(
                            children: [
                              InputWidget(
                                onChanged: (text) {},
                                hintText: 'Search',
                                prefixText: '',
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              ...bookings.map(
                                (e) => Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              height: 44.h,
                                              width: 44.w,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          1000),
                                                  color: Color(0xffEBEDFF)),
                                              child: Image.network(
                                                  'https://res.cloudinary.com/kingstech/image/upload/v1668349593/booking_iobz6n.png'),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Car repair from John doe',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontSize: 14,
                                                      color: tertiary),
                                                ),
                                                Text(
                                                  '24, Sept, 2022  |  9:14 am',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w300,
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
                              )
                            ],
                          )
                  ],
                ))));
  }
}
