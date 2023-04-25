// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:fluttercontactpicker/fluttercontactpicker.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sosta/pages/dashboard/BillsPayment/payment_succes.dart';

class RechargeScreenFirst extends StatefulWidget {
  RechargeScreenFirst({
    super.key,
    required this.imgurl,
    required this.network,
  });

  String imgurl;
  String network;

  @override
  State<RechargeScreenFirst> createState() => _RechargeScreenFirstState();
}

class _RechargeScreenFirstState extends State<RechargeScreenFirst> {
  late List<Widget> airtel = [
    mtndaily(size),
    mtnweekly(size),
    mtnmonthly(size),
  ];

  TextEditingController amountController = TextEditingController();
  bool choose = false;
  late List<Widget> empty = [];
  late List<Widget> etisalat = [
    etisalatdaily(size),
    etisalatweekly(size),
    etisalatmonthly(size),
  ];

  late List<Widget> glo = [
    glodaily(size),
    gloweekly(size),
    glomonthly(size),
  ];

  bool isAirtime = true;
  bool isClicked = false;
  bool isData = false;
  late List<Widget> mtn = [
    mtndaily(size),
    mtnweekly(size),
    mtnmonthly(size),
  ];

  TextEditingController phoneController = TextEditingController();
  late Size size;
  bool usnumber = false;

  String? _contact;
  PhoneContact? _phoneContact;

  @override
  void initState() {
    super.initState();
    isClicked = false;
  }

  void mad() {
    usnumber ? phoneController.text = '' : phoneController.text = '07067581951';
  }

  Widget glodaily(size) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 10),
          DaysText(
            day: '1 Day',
          ),
          SizedBox(height: 10),
          DataContainers(
            size: size,
            datatype: '20MB-1 Day',
            price: 'N25',
            description: 'Telegram',
          ),
          SizedBox(height: 10),
          DataContainers(
            size: size,
            datatype: '20MB-1 Day',
            price: 'N25',
            description: 'Instagram',
          ),
          SizedBox(height: 10),
          DataContainers(
            size: size,
            datatype: '20MB-1 Day',
            price: 'N25',
            description: 'TikTok',
          ),
          SizedBox(height: 10),
          DataContainers(
            size: size,
            datatype: '20MB-1 Day',
            price: 'N25',
            description: 'Opera',
          ),
          SizedBox(height: 10),
          DataContainers(
            size: size,
            datatype: '25MB-1 Day',
            price: 'N25',
            description: 'Opera',
          ),
          SizedBox(height: 10),
          DataContainers(
            size: size,
            datatype: '50MB-1 Day',
            price: 'N50',
            description: '45MB + 5MB Night',
          ),
          SizedBox(height: 10),
          DataContainers(
            size: size,
            datatype: '100MB-1 Day',
            price: 'N25',
            description: 'WTF',
          ),
          SizedBox(height: 10),
          DataContainers(
            size: size,
            datatype: '100MB-1 Day',
            price: 'N50',
            description: 'Youtube',
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }

  Widget gloweekly(size) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 10),
          DaysText(
            day: '7 Days',
          ),
          SizedBox(height: 10),
          DataContainers(
            size: size,
            datatype: '50MB-7 Days',
            price: 'N50',
            description: 'Telegram',
          ),
          SizedBox(height: 10),
          DataContainers(
            size: size,
            datatype: '50MB-7 Days',
            price: 'N50',
            description: 'Instagram',
          ),
          SizedBox(height: 10),
          DataContainers(
            size: size,
            datatype: '50MB-7 Days',
            price: 'N50',
            description: 'Tiktok',
          ),
          SizedBox(height: 10),
          DataContainers(
            size: size,
            datatype: '50MB-7 Days',
            price: 'N50',
            description: 'Opera',
          ),
          SizedBox(height: 10),
          DataContainers(
            size: size,
            datatype: '200MB-7 Days',
            price: 'N100',
            description: 'Youtube',
          ),
          SizedBox(height: 10),
          DaysText(
            day: '14 Days',
          ),
          SizedBox(height: 10),
          DataContainers(
            size: size,
            datatype: '750MB-14 Days',
            price: 'N500',
            description: '',
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }

  Widget glomonthly(size) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 10),
          DaysText(
            day: '30 Days',
          ),
          SizedBox(height: 10),
          DataContainers(
            size: size,
            datatype: '125MB-30 Days',
            price: 'N100',
            description: 'Telegram',
          ),
          SizedBox(height: 10),
          DataContainers(
            size: size,
            datatype: '125MB-30 Days',
            price: 'N100',
            description: 'Instagram',
          ),
          SizedBox(height: 10),
          DataContainers(
            size: size,
            datatype: '125MB-30 Days',
            price: 'N100',
            description: 'Tiktok',
          ),
          SizedBox(height: 10),
          DataContainers(
            size: size,
            datatype: '300MB-30 Days',
            price: 'N100',
            description: 'Opera',
          ),
          SizedBox(height: 10),
          DataContainers(
            size: size,
            datatype: '500MB-30 Days',
            price: 'N100',
            description: 'WTF',
          ),
          SizedBox(height: 10),
          DataContainers(
            size: size,
            datatype: '500MB-30 Days',
            price: 'N250',
            description: 'Youtube',
          ),
          SizedBox(height: 10),
          DataContainers(
            size: size,
            datatype: '3.9GB-30 Days',
            price: 'N1,000',
            description: '1.9GB + 2GB Night',
          ),
          SizedBox(height: 10),
          DataContainers(
            size: size,
            datatype: '6GB-30 Days',
            price: 'N1,400',
            description: 'GloTV VOD',
          ),
          SizedBox(height: 10),
          DataContainers(
            size: size,
            datatype: '3.9GB-30 Days',
            price: 'N3,200',
            description: 'GloTV Max',
          ),
          SizedBox(height: 10),
          DataContainers(
            size: size,
            datatype: '7.5GB-30 Days',
            price: 'N1,500',
            description: '3.5GB + 4GB Night',
          ),
          SizedBox(height: 10),
          DataContainers(
            size: size,
            datatype: '9.2GB-30 Days',
            price: 'N2,000',
            description: '5GB + 4GB Night',
          ),
          SizedBox(height: 10),
          DataContainers(
            size: size,
            datatype: '10.8GB-30 Days',
            price: 'N2,500',
            description: '6.8GB + 4GB Night',
          ),
          SizedBox(height: 10),
          DataContainers(
            size: size,
            datatype: '14GB-30 Days',
            price: 'N3,000',
            description: '10GB + 4GB Night',
          ),
          SizedBox(height: 10),
          DataContainers(
            size: size,
            datatype: '18GB-30 Days',
            price: 'N4,000',
            description: '14GB + 4GB Night',
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }

  Widget etisalatdaily(size) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 10),
          DaysText(
            day: '1 Day',
          ),
          SizedBox(height: 10),
          DataContainers(
            size: size,
            datatype: '50MB-1 Day',
            price: 'N50',
            description: '',
          ),
          SizedBox(height: 10),
          DataContainers(
            size: size,
            datatype: '200MB-1 Day',
            price: 'N100',
            description:
                '7GB + 100MB Social Plan(Facebook, Twitter, Instagram, WhatsApp)',
          ),
          SizedBox(height: 10),
          DataContainers(
            size: size,
            datatype: '300MB-1 Day',
            price: 'N150',
            description: '300MB (200MB all time + 100MB night) + 300secs',
          ),
          SizedBox(height: 10),
          DataContainers(
            size: size,
            datatype: '650MB-1 Day',
            price: 'N200',
            description: '',
          ),
          SizedBox(height: 10),
          DataContainers(
            size: size,
            datatype: '1GB-1 Day',
            price: '300',
            description: '',
          ),
          SizedBox(height: 10),
          DaysText(day: '3 Days'),
          SizedBox(height: 10),
          DataContainers(
            size: size,
            datatype: '2GB-3 Day',
            price: 'N500',
            description: '',
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }

  Widget etisalatweekly(size) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 10),
          DaysText(
            day: '7 Days',
          ),
          SizedBox(height: 10),
          DataContainers(
            size: size,
            datatype: '7GB-7 Day',
            price: 'N1,500',
            description: '',
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }

  Widget etisalatmonthly(size) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 10),
          DaysText(
            day: '30 Days',
          ),
          SizedBox(height: 10),
          DataContainers(
            size: size,
            datatype: '1.5GB-30 Days',
            price: 'N1,000',
            description: '',
          ),
          SizedBox(height: 10),
          DataContainers(
            size: size,
            datatype: '2GB-30 Days',
            price: 'N1,200',
            description: '',
          ),
          SizedBox(height: 10),
          DataContainers(
            size: size,
            datatype: '4.5GB-30 Days',
            price: 'N2,000',
            description: '',
          ),
          SizedBox(height: 10),
          DataContainers(
            size: size,
            datatype: '11GB-30 Days',
            price: 'N4,000',
            description: '',
          ),
          SizedBox(height: 10),
          DataContainers(
            size: size,
            datatype: '12GB-30 Days',
            price: 'N3,000',
            description: '',
          ),
          SizedBox(height: 10),
          DataContainers(
            size: size,
            datatype: '15GB-30 Days',
            price: 'N5,000',
            description: '',
          ),
          SizedBox(height: 10),
          DataContainers(
            size: size,
            datatype: '40GB-30 Days',
            price: 'N10,000',
            description: '',
          ),
          SizedBox(height: 10),
          DataContainers(
            size: size,
            datatype: '75GB-30 Days',
            price: 'N15,000',
            description: '',
          ),
          SizedBox(height: 10),
          DataContainers(
            size: size,
            datatype: '125GB-30 Days',
            price: 'N20,000',
            description: '',
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }

  Widget airteldaily(size) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 10),
          DaysText(
            day: '1 Day',
          ),
          SizedBox(height: 10),
          DataContainers(
            size: size,
            datatype: '40MB-1 Day',
            price: 'N50',
            description: '',
          ),
          SizedBox(height: 10),
          DataContainers(
            size: size,
            datatype: '100MB-1 Day',
            price: 'N100',
            description: '',
          ),
          SizedBox(height: 10),
          DataContainers(
            size: size,
            datatype: '1GB-1 Day',
            price: 'N300',
            description: '',
          ),
          SizedBox(height: 10),
          DataContainers(
            size: size,
            datatype: '2GB-1 Day',
            price: 'N500',
            description: '',
          ),
          DaysText(
            day: '3 Day',
          ),
          SizedBox(height: 10),
          DataContainers(
            size: size,
            datatype: '200MB-3 Day',
            price: 'N200',
            description: '',
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }

  Widget airtelweekly(size) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 10),
          DaysText(
            day: '7 Days',
          ),
          SizedBox(height: 10),
          DataContainers(
            size: size,
            datatype: '350MB-7 Days',
            price: 'N300',
            description: '',
          ),
          SizedBox(height: 10),
          DataContainers(
            size: size,
            datatype: '6GB-7 Days',
            price: 'N1,500',
            description: '',
          ),
          SizedBox(height: 10),
          DaysText(
            day: '14 Days',
          ),
          SizedBox(height: 10),
          DataContainers(
            size: size,
            datatype: '750MB-14 Days',
            price: 'N500',
            description: '',
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }

  Widget airtelmonthly(size) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 10),
          DaysText(
            day: '30 Days',
          ),
          SizedBox(height: 10),
          DataContainers(
            size: size,
            datatype: '1.5GB-30 Days',
            price: 'N1,000',
            description: '',
          ),
          SizedBox(height: 10),
          DataContainers(
            size: size,
            datatype: '2GB-30 Days',
            price: 'N1,200',
            description: '',
          ),
          SizedBox(height: 10),
          DataContainers(
            size: size,
            datatype: '3GB-30 Days',
            price: 'N1,500',
            description: '',
          ),
          SizedBox(height: 10),
          DataContainers(
            size: size,
            datatype: '4.5GB-30 Days',
            price: 'N2,000',
            description: '',
          ),
          SizedBox(height: 10),
          DataContainers(
            size: size,
            datatype: '6GB-30 Days',
            price: 'N2,500',
            description: '',
          ),
          SizedBox(height: 10),
          DataContainers(
            size: size,
            datatype: '10GB-30 Days',
            price: 'N3,000',
            description: '',
          ),
          SizedBox(height: 10),
          DataContainers(
            size: size,
            datatype: '11GB-30 Days',
            price: 'N4,000',
            description: '',
          ),
          SizedBox(height: 10),
          DataContainers(
            size: size,
            datatype: '20GB-30 Days',
            price: 'N5,000',
            description: '',
          ),
          SizedBox(height: 10),
          DataContainers(
            size: size,
            datatype: '30GB-30 Days',
            price: 'N8,000',
            description: '',
          ),
          SizedBox(height: 10),
          DataContainers(
            size: size,
            datatype: '40GB-30 Days',
            price: 'N10,000',
            description: '',
          ),
          SizedBox(height: 10),
          DataContainers(
            size: size,
            datatype: '75GB-30 Days',
            price: 'N15,000',
            description: '',
          ),
          SizedBox(height: 10),
          DataContainers(
            size: size,
            datatype: '120GB-30 Days',
            price: 'N20,000',
            description: '',
          ),
          SizedBox(height: 10),
          DataContainers(
            size: size,
            datatype: '240GB-30 Days',
            price: 'N30,000',
            description: '',
          ),
          SizedBox(height: 10),
          DataContainers(
            size: size,
            datatype: '280GB-30 Days',
            price: 'N36,000',
            description: '',
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }

  Widget mtndaily(size) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 10),
          DaysText(
            day: '2 Days',
          ),
          SizedBox(height: 10),
          DataContainers(
            size: size,
            datatype: '2.5GB-7 Days',
            price: 'N500',
            description: '',
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget mtnweekly(size) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 10),
          DaysText(
            day: '7 Days',
          ),
          SizedBox(height: 10),
          DataContainers(
            size: size,
            datatype: '350MB-7 Days',
            price: 'N300',
            description: '',
          ),
          SizedBox(height: 10),
          DataContainers(
            size: size,
            datatype: '6GB-7 Days',
            price: 'N1,500',
            description: '',
          ),
          SizedBox(height: 10),
          DaysText(
            day: '14 Days',
          ),
          SizedBox(height: 10),
          DataContainers(
            size: size,
            datatype: '750MB-14 Days',
            price: 'N500',
            description: '',
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget mtnmonthly(size) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 10),
          DaysText(
            day: '30 Days',
          ),
          SizedBox(height: 10),
          DataContainers(
            size: size,
            datatype: '3GB-30 Days',
            price: 'N1,500',
            description:
                '3GB Monthly Plan Plus Free 4GB for Youtube once in 30 days',
          ),
          SizedBox(height: 10),
          DataContainers(
            size: size,
            datatype: '10GB-30 Days',
            price: 'N3,000',
            description:
                '10GB Monthly Plan Plus Free 4GB for Youtube once in 30 days',
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }

  List<Widget> checker() {
    if (widget.network == 'MTN') {
      return mtn;
    } else if (widget.network == 'Airtel') {
      return airtel;
    } else if (widget.network == '9Mobile') {
      return etisalat;
    } else if (widget.network == 'Glo') {
      return glo;
    } else {
      return empty;
    }
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 70,
          leading: Padding(
            padding: const EdgeInsets.only(left: 20, top: 10),
            child: Material(
              borderRadius: BorderRadius.circular(5),
              elevation: 2,
              child: Container(
                height: 44,
                width: 44,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: IconButton(
                  onPressed: () => context.pop(),
                  color: const Color.fromARGB(255, 109, 105, 105),
                  icon: Image.network(
                      'https://res.cloudinary.com/kingstech/image/upload/v1666210470/arrow_ockvre.png'),
                  //replace with our own icon data.
                ),
              ),
            ),
          ),
          automaticallyImplyLeading: false,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Bills Payment',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color(0xff29002e),
            ),
          ),
          backgroundColor: Color(0xffe5e5e5),
        ),
        backgroundColor: Color(0xffe5e5e5),
        body: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Row(
                children: [
                  Container(
                    height: 110,
                    width: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 70,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              image: AssetImage('${widget.imgurl}'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Text(
                          '${widget.network}',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 24),
                  Text(
                    '${widget.network}',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.38,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 35),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isAirtime = true;
                      isData = false;
                    });
                  },
                  child: Material(
                    elevation: isAirtime ? 3 : 1,
                    borderRadius: BorderRadius.circular(5),
                    shadowColor: Color(0xffffd9b1),
                    child: Container(
                      height: 45,
                      width: 45 * size.width / 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          isAirtime
                              ? BoxShadow(
                                  color: Color(0xffff8e1b),
                                  blurRadius: 20.0,
                                  spreadRadius: -10,
                                  offset: Offset(
                                    0,
                                    10,
                                  ),
                                )
                              : BoxShadow(
                                  color: Colors.transparent,
                                  blurRadius: 0,
                                  spreadRadius: 0,
                                  offset: Offset(
                                    0,
                                    0,
                                  ),
                                )
                        ],
                        color:
                            isAirtime ? Color(0xffff8e1b) : Color(0xffffd9b1),
                      ),
                      child: Center(
                        child: Text(
                          'Buy Airtime',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.38,
                            color: isAirtime ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isAirtime = false;
                      isData = true;
                    });
                  },
                  child: Material(
                    borderRadius: BorderRadius.circular(5),
                    elevation: isData ? 3 : 1,
                    child: Container(
                      height: 45,
                      width: 45 * size.width / 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: isData ? Color(0xffff8e1b) : Color(0xffffd9b1),
                          boxShadow: [
                            isData
                                ? BoxShadow(
                                    color: Color(0xffff8e1b),
                                    blurRadius: 20.0,
                                    spreadRadius: -10,
                                    offset: Offset(
                                      0,
                                      10,
                                    ),
                                  )
                                : BoxShadow(
                                    color: Colors.transparent,
                                    blurRadius: 0,
                                    spreadRadius: 0,
                                    offset: Offset(
                                      0,
                                      0,
                                    ),
                                  )
                          ]),
                      child: Center(
                        child: Text(
                          'Buy Data',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.38,
                            color: isData ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Enter Phone Number',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    letterSpacing: 0.38,
                  ),
                ),
              ),
            ),
            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    width: 72 * size.width / 100,
                    height: 50,
                    child: TextField(
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(11),
                      ],
                      controller: phoneController,
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.number,
                      textAlignVertical: TextAlignVertical.center,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.transparent,
                        // contentPadding: EdgeInsets.all(10),
                        hintStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 209, 206, 206),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        hintText: '    i.e +2348*********',
                        hoverColor: Colors.transparent,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () async {
                      requestpermission(context).then((value) async {
                        final PhoneContact contact =
                            await FlutterContactPicker.pickPhoneContact();
                        print(contact);
                        setState(() {
                          _phoneContact = contact;
                          _contact =
                              _phoneContact?.phoneNumber?.number.toString();
                          phoneController.text = _contact!;
                        });
                      });
                    },
                    child: Container(
                      height: 53,
                      width: 59,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Color(0xffff8e1b),
                      ),
                      child: Icon(
                        Icons.group_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  Checkbox(
                    fillColor: MaterialStateProperty.all(
                      Color(0xffff8e1b),
                    ),
                    value: choose,
                    onChanged: (newValue) {
                      setState(() {
                        choose = newValue!;
                        mad();
                        usnumber = !usnumber;
                      });
                    },
                  ),
                  Text(
                    isData
                        ? 'Buy data for my self'
                        : 'Recharge my phone number',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            isData
                ? TabBar(
                    indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(
                        width: 2,
                        color: Color(0xffff8e1b),
                      ),
                      insets: EdgeInsets.symmetric(horizontal: 35.0),
                    ),
                    indicatorColor: Color(0xffff8e1b),
                    unselectedLabelColor: Colors.white,
                    labelColor: Colors.white,
                    tabs: <Widget>[
                      Tab(
                        child: Text(
                          'Daily',
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              letterSpacing: 0.1,
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Monthly',
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.1,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Yearly',
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.1,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : SizedBox.shrink(),
            isData
                ? Container(
                    width: double.infinity,
                    height: 70 * size.height / 100,
                    child: TabBarView(
                      children: checker(),
                    ),
                  )
                : SizedBox.shrink(),
            isClicked
                ? Container(
                    width: 90 * size.width / 100,
                    height: 342,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            isAirtime ? 'Buy Artime' : 'Buy Data',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff29002e),
                              letterSpacing: 0.38,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            '${amountController.text}',
                            style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff29002e),
                              letterSpacing: 0.38,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Choose payment Method',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff50555c),
                              letterSpacing: 0.38,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PaymentSuccess()));
                                  },
                                  child: Container(
                                    height: 100,
                                    width: 110,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Color(0xffffd9b1),
                                    ),
                                    child: Image(
                                      image:
                                          AssetImage('asset/images/wallet.png'),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Wallet',
                                  style: TextStyle(
                                    color: Color(0xff50555c),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 15),
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PaymentSuccess()));
                                  },
                                  child: Container(
                                    height: 100,
                                    width: 110,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Color(0xfffaefff),
                                    ),
                                    child: Image(
                                      image:
                                          AssetImage('asset/images/card.png'),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Card',
                                  style: TextStyle(
                                    color: Color(0xff50555c),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                : isData
                    ? SizedBox.shrink()
                    : Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Enter Amount',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                              letterSpacing: 0.38,
                            ),
                          ),
                        ),
                      ),
            SizedBox(height: 12),
            isClicked
                ? SizedBox.shrink()
                : isData
                    ? SizedBox.shrink()
                    : Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        width: 90 * size.width / 100,
                        height: 70,
                        child: TextField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(5),
                            LimitRangeTextInputFormatter(1, 10000),
                          ],
                          controller: amountController,
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.number,
                          textAlignVertical: TextAlignVertical.center,
                          style: TextStyle(
                            fontSize: 50,
                            color: Color(0xff38374a),
                            fontWeight: FontWeight.w300,
                          ),
                          decoration: InputDecoration(
                            hintText: '0.00',
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.transparent,
                            // contentPadding: EdgeInsets.all(10),
                            hintStyle: TextStyle(
                              fontSize: 50,
                              color: Color(0xff38374a),
                              fontWeight: FontWeight.w300,
                            ),
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(bottom: 8.0),
                              child: Image(
                                image: AssetImage('asset/images/naira.png'),
                              ),
                            ),

                            hoverColor: Colors.transparent,
                          ),
                        ),
                      ),
            isClicked ? SizedBox(height: 10) : SizedBox(height: 60),
            isClicked
                ? SizedBox.shrink()
                : isData
                    ? SizedBox.shrink()
                    : GestureDetector(
                        onTap: () {
                          if (phoneController.text.isEmpty ||
                              amountController.text.isEmpty == true) {
                            Null;
                          } else {
                            setState(() {
                              isClicked = true;
                            });
                          }
                        },
                        child: Container(
                          height: 62,
                          width: 85 * size.width / 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Color(0xffff8e1b),
                          ),
                          child: Center(
                            child: Text(
                              'Continue',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
            SizedBox(height: 20),
          ],
        )),
      ),
    );
  }
}

class DaysText extends StatelessWidget {
  DaysText({
    super.key,
    required this.day,
  });

  String day;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          '$day',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}

class DataContainers extends StatelessWidget {
  DataContainers({
    super.key,
    required this.size,
    required this.datatype,
    required this.price,
    required this.description,
  });

  String datatype;
  String description;
  String price;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      elevation: 0.3,
      child: Container(
        // height: 60,
        width: 94 * size.width / 100,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 244, 224, 202),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '$datatype',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 33, 31, 31),
                    ),
                  ),
                  Text(
                    '$price',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 33, 31, 31),
                    ),
                  ),
                ],
              ),
              description == ''
                  ? SizedBox.shrink()
                  : Column(
                      children: [
                        Divider(
                          color: Colors.grey,
                        ),
                        Text(
                          '$description',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            color: Color.fromARGB(255, 33, 31, 31),
                          ),
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class LimitRangeTextInputFormatter extends TextInputFormatter {
  LimitRangeTextInputFormatter(this.min, this.max,
      {this.defaultIfEmpty = false})
      : assert(min < max);

  final bool defaultIfEmpty;
  final int max;
  final int min;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    int? value = int.tryParse(newValue.text);
    String? enforceValue;
    if (value != null) {
      if (value < min) {
        enforceValue = min.toString();
      } else if (value > max) {
        enforceValue = max.toString();
      }
    } else {
      if (defaultIfEmpty) {
        enforceValue = min.toString();
      }
    }
    // filtered interval result
    if (enforceValue != null) {
      return TextEditingValue(
          text: enforceValue,
          selection: TextSelection.collapsed(offset: enforceValue.length));
    }
    // value that fit requirements
    return newValue;
  }
}

Future<void> requestpermission(BuildContext context) async {
  FlutterContactPicker.requestPermission();
}
