// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sosta/pages/dashboard/BillsPayment/electric_bill.dart';
import 'package:sosta/pages/dashboard/BillsPayment/recharge_screen1.dart';
import 'package:sosta/pages/dashboard/BillsPayment/tv.dart';
import 'package:sosta/pages/dashboard/dashboard.dart';

import '../../../components/Navigation/bottom_nav.dart';

class BillPayment extends StatefulWidget {
  const BillPayment({super.key});

  @override
  State<BillPayment> createState() => _BillPaymentState();
}

class _BillPaymentState extends State<BillPayment> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomSheet: BottomNavWidget(),
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
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => DashboardPage()));
                },
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
            SizedBox(height: 44),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                width: 90 * size.width / 100,
                height: 42,
                child: TextField(
                  // controller: emailController,
                  textAlignVertical: TextAlignVertical.center,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w400),
                  onChanged: (text) => {
                    setState(() =>
                        {context.go('/dashboard/service-search', extra: text)})
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    // contentPadding: EdgeInsets.all(10),
                    hintStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                    border: InputBorder.none,
                    hintText: 'Search',
                    hoverColor: Colors.transparent,
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Buy Airtime & Data',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    letterSpacing: 0.38,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => RechargeScreenFirst(
                                  imgurl: 'asset/images/mtn.png',
                                  network: 'MTN',
                                )));
                      },
                      child: NetworkContainers(
                        imgurl: 'asset/images/mtn.png',
                        network: 'MTN',
                      ),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => RechargeScreenFirst(
                                  imgurl: 'asset/images/etisalat.png',
                                  network: '9Mobile',
                                )));
                      },
                      child: NetworkContainers(
                        imgurl: 'asset/images/etisalat.png',
                        network: '9Mobile',
                      ),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => RechargeScreenFirst(
                                  imgurl: 'asset/images/airtel.png',
                                  network: 'Airtel',
                                )));
                      },
                      child: NetworkContainers(
                        imgurl: 'asset/images/airtel.png',
                        network: 'Airtel',
                      ),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => RechargeScreenFirst(
                                  imgurl: 'asset/images/glo.png',
                                  network: 'Glo',
                                )));
                      },
                      child: NetworkContainers(
                        imgurl: 'asset/images/glo.png',
                        network: 'Glo',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 22),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Pay Internet Subscriptions',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    letterSpacing: 0.38,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SatContainers(
                      imgurl: 'asset/images/speck.png',
                      network: 'Spectranet',
                    ),
                    SizedBox(width: 10),
                    SatContainers(
                      imgurl: 'asset/images/ip.png',
                      network: 'IPNX',
                    ),
                    SizedBox(width: 10),
                    SatContainers(
                      imgurl: 'asset/images/swift.png',
                      network: 'Swift',
                    ),
                    SizedBox(width: 10),
                    SatContainers(
                      imgurl: 'asset/images/smile.png',
                      network: 'Smile',
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Pay TV Bills',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    letterSpacing: 0.38,
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => TvScreenFirst(
                                  imgurl: 'asset/images/dstv.png',
                                  network: 'DSTV',
                                )));
                      },
                      child: SatContainers(
                        imgurl: 'asset/images/dstv.png',
                        network: 'DSTV',
                      ),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => TvScreenFirst(
                                  imgurl: 'asset/images/gotv.png',
                                  network: 'GOTV',
                                )));
                      },
                      child: SatContainers(
                        imgurl: 'asset/images/gotv.png',
                        network: 'GOTV',
                      ),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => TvScreenFirst(
                                  imgurl: 'asset/images/startimes.png',
                                  network: 'Startimes',
                                )));
                      },
                      child: SatContainers(
                        imgurl: 'asset/images/startimes.png',
                        network: 'Startimes',
                      ),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 28),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Pay Utility Bills',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    letterSpacing: 0.38,
                  ),
                ),
              ),
            ),
            SizedBox(height: 13),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ElectricScreenFirst(
                                  imgurl: 'asset/images/unknown.png',
                                  network: 'Ikeja Electric',
                                )));
                      },
                      child: SatContainers(
                        imgurl: 'asset/images/unknown.png',
                        network: 'Ikeja Electric',
                      ),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ElectricScreenFirst(
                                  imgurl: 'asset/images/lc.png',
                                  network: 'LCC',
                                )));
                      },
                      child: SatContainers(
                        imgurl: 'asset/images/lc.png',
                        network: 'LCC',
                      ),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ElectricScreenFirst(
                                  imgurl: 'asset/images/ib.png',
                                  network: 'IBEDC',
                                )));
                      },
                      child: SatContainers(
                        imgurl: 'asset/images/ib.png',
                        network: 'IBEDC',
                      ),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ElectricScreenFirst(
                                  imgurl: 'asset/images/ikeja.png',
                                  network: 'EKEDC',
                                )));
                      },
                      child: SatContainers(
                        imgurl: 'asset/images/ikeja.png',
                        network: 'EKEDC',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}

class NetworkContainers extends StatelessWidget {
  NetworkContainers({
    super.key,
    required this.imgurl,
    required this.network,
  });
  String network;
  String imgurl;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 107,
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
                image: AssetImage('$imgurl'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            '$network',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

class SatContainers extends StatelessWidget {
  SatContainers({
    super.key,
    required this.imgurl,
    required this.network,
  });
  String network;
  String imgurl;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 107,
      width: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 3),
          Material(
            borderRadius: BorderRadius.circular(10),
            elevation: 3,
            child: Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage('$imgurl'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          Text(
            '$network',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
