// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../constant.dart';
import '../../../models/service_providers_model.dart';
import '../../../widgets/app_button.dart';

class VendorProfile extends StatefulWidget {
  ServiceProviderModel details;
  VendorProfile({super.key, required this.details});
  @override
  // ignore: library_private_types_in_public_api
  _VendorProfileState createState() => _VendorProfileState();
}

class _VendorProfileState extends State<VendorProfile> {
  final passwordController = TextEditingController();
  bool show = false;

  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  //var args;

  String? selectedDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
  String? selectedtime = DateFormat('h a').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    //args = ModalRoute.of(context)!.settings.arguments as ServiceProviderModel;
    //print(args);
    return Scaffold(
        extendBodyBehindAppBar: true,
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
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(widget.details.imgurl!))),
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Positioned(
                    top: 150,
                    left: 125,
                    child: Container(
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Color(0xffFFD9B1), width: 6),
                          borderRadius: BorderRadius.circular(1000),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(widget.details.imgurl!))),
                      height: 157,
                      width: 157,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
              const SizedBox(
                height: 60,
              ),
              Text(
                widget.details.name!,
                style: TextStyle(
                    color: tertiary, fontSize: 20, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(left: 38),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Select Date (Selected date : $selectedDate)',
                          style: TextStyle(
                              color: tertiary,
                              fontSize: 14,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 70,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedDate = DateFormat('dd-MM-yyyy')
                                    .format(DateTime.now());
                              });
                            },
                            child: Container(
                              width: 70,
                              color: Colors.white,
                              child: Center(
                                  child: Column(
                                children: [
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Today',
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    DateTime.now().day.toString(),
                                    style: TextStyle(
                                        fontSize: 32,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              )),
                            ),
                          ),
                          SizedBox(
                            width: 11,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedDate = DateFormat('dd-MM-yyyy').format(
                                    DateTime.now().add(Duration(days: 1)));
                              });
                            },
                            child: Container(
                              width: 70,
                              color: Colors.white,
                              child: Center(
                                  child: Column(
                                children: [
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'TOMORROW',
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "${DateTime.now().day + 1}",
                                    style: TextStyle(
                                        fontSize: 32,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              )),
                            ),
                          ),
                          SizedBox(
                            width: 11,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedDate = DateFormat('dd-MM-yyyy').format(
                                    DateTime.now().add(Duration(days: 2)));
                              });
                            },
                            child: Container(
                              width: 70,
                              color: Colors.white,
                              child: Center(
                                  child: Column(
                                children: [
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'sun',
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "${DateTime.now().day + 2}",
                                    style: TextStyle(
                                        fontSize: 32,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              )),
                            ),
                          ),
                          SizedBox(
                            width: 11,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedDate = DateFormat('dd-MM-yyyy').format(
                                    DateTime.now().add(Duration(days: 3)));
                              });
                            },
                            child: Container(
                              width: 70,
                              color: Colors.white,
                              child: Center(
                                  child: Column(
                                children: [
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Mon.',
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "${DateTime.now().day + 3}",
                                    style: TextStyle(
                                        fontSize: 32,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              )),
                            ),
                          ),
                          SizedBox(
                            width: 11,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedDate = DateFormat('dd-MM-yyyy').format(
                                    DateTime.now().add(Duration(days: 4)));
                              });
                            },
                            child: Container(
                              width: 70,
                              color: Colors.white,
                              child: Center(
                                  child: Column(
                                children: [
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Tue.',
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "${DateTime.now().day + 4}",
                                    style: TextStyle(
                                        fontSize: 32,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              )),
                            ),
                          ),
                          SizedBox(
                            width: 11,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Select Time (Selected time : $selectedtime)',
                          style: TextStyle(
                              color: tertiary,
                              fontSize: 14,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 50,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedtime = DateFormat('hh a').format(
                                    DateTime.now().add(Duration(hours: 1)));
                              });
                            },
                            child: Container(
                              width: 120,
                              color: Colors.white,
                              child: Center(
                                  child: Text(
                                "${DateTime.now().hour + 1}",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              )),
                            ),
                          ),
                          SizedBox(
                            width: 11,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedtime = DateFormat('hh a').format(
                                    DateTime.now().add(Duration(hours: 2)));
                              });
                            },
                            child: Container(
                              width: 120,
                              color: Colors.white,
                              child: Center(
                                  child: Text(
                                "${DateTime.now().hour + 2}",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              )),
                            ),
                          ),
                          SizedBox(
                            width: 11,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedtime = DateFormat('hh a').format(
                                    DateTime.now().add(Duration(hours: 3)));
                              });
                            },
                            child: Container(
                              width: 120,
                              color: Colors.white,
                              child: Center(
                                  child: Text(
                                "${DateTime.now().hour + 3}",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(left: 38, right: 38),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(color: Colors.white),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Discription:',
                              style: TextStyle(
                                  color: tertiary,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              widget.details.description!,
                              style: TextStyle(
                                  color: tertiary,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // Checkbox(
                    //   value: true,
                    //   onChanged: (value) => true,
                    // ),
                    // Container(
                    //   decoration: BoxDecoration(color: Colors.white),
                    //   child: Padding(
                    //     padding: EdgeInsets.all(10),
                    //     child: Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: const [
                    //         Text(
                    //           'Reviews About Me',
                    //           style: TextStyle(
                    //               color: tertiary,
                    //               fontSize: 14,
                    //               fontWeight: FontWeight.w700),
                    //         ),
                    //         SizedBox(
                    //           height: 10,
                    //         ),
                    //         Text(
                    //           'I’m a cool headed person with proven review of honesty and excellence',
                    //           style: TextStyle(
                    //               color: tertiary,
                    //               fontSize: 14,
                    //               fontWeight: FontWeight.w300),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    const SizedBox(
                      height: 20,
                    ),
                    AppButton(
                      text: 'Book vendor',
                      onTap: () {
                        widget.details.userBookingdate = selectedDate;
                        widget.details.userBookingtime = selectedtime;
                        context.go('/dashboard/service-map',
                            extra: widget.details);
                      },
                      bgColor: primary,
                      color: Colors.white,
                      width: MediaQuery.of(context).size.width - 40,
                      height: 55,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class VendorProfileType {}
