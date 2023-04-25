// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sosta/pages/dashboard/BillsPayment/payment_succes.dart';
import 'package:sosta/pages/dashboard/BillsPayment/recharge_screen1.dart';

class TvScreenFirst extends StatefulWidget {
  TvScreenFirst({
    super.key,
    required this.imgurl,
    required this.network,
  });
  String imgurl;
  String network;

  @override
  State<TvScreenFirst> createState() => _TvScreenFirstState();
}

class _TvScreenFirstState extends State<TvScreenFirst> {
  bool isClicked = false;
  bool formOpenFlag = true;

  var expansiontitle = 'Select';
  bool isData = false;
  TextEditingController amountController = TextEditingController();
  TextEditingController decoderController = TextEditingController();
  @override
  void initState() {
    amountController.text = "0.00"; //default text
    super.initState();
    expansiontitle = 'Select';

    isClicked = false;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: AssetImage('${widget.imgurl}'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
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
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Enter Decoder Number',
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
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              width: 90 * size.width / 100,
              height: 70,
              child: TextField(
                controller: decoderController,
                cursorColor: Colors.black,
                keyboardType: TextInputType.number,
                // controller: emailController,
                textAlignVertical: TextAlignVertical.center,
                style: const TextStyle(
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
                  hintText: '   0928839110',
                  hoverColor: Colors.transparent,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Choose plan',
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
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
              child: ExpansionTile(
                onExpansionChanged: (val) {
                  formOpenFlag = val; // update here on change
                },
                key: GlobalKey(),
                iconColor: Colors.black,
                textColor: Colors.black,
                title: Text('$expansiontitle'),
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        expansiontitle = 'Compact-Plus';
                        formOpenFlag = !formOpenFlag;
                      });
                    },
                    child: Material(
                      elevation: 3,
                      color: Color(0xffe5e5e5),
                      child: Container(
                        height: 40,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Compact-Plus',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        expansiontitle = 'Premium';
                        formOpenFlag = !formOpenFlag;
                      });
                    },
                    child: Material(
                      elevation: 3,
                      color: Color(0xffe5e5e5),
                      child: Container(
                        height: 40,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Premium',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        expansiontitle = 'Family';
                        formOpenFlag = !formOpenFlag;
                      });
                    },
                    child: Material(
                      elevation: 3,
                      color: Color(0xffe5e5e5),
                      child: Container(
                        height: 40,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Family',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        expansiontitle = 'Basic';
                        formOpenFlag = !formOpenFlag;
                      });
                    },
                    child: Material(
                      elevation: 3,
                      color: Color(0xffe5e5e5),
                      child: Container(
                        height: 40,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Basic',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 30),
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
                          'Pay Utility Bill',
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
                          'N${amountController.text}',
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
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => PaymentSuccess()));
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
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => PaymentSuccess()));
                                },
                                child: Container(
                                  height: 100,
                                  width: 110,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Color(0xfffaefff),
                                  ),
                                  child: Image(
                                    image: AssetImage('asset/images/card.png'),
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
              : Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  width: 90 * size.width / 100,
                  height: 70,
                  child: TextField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(10),
                      LimitRangeTextInputFormatter(1, 1000000),
                    ],
                    controller: amountController,
                    cursorColor: Colors.black,
                    cursorHeight: 30,
                    keyboardType: TextInputType.number,
                    // controller: emailController,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.transparent,
                      // contentPadding: EdgeInsets.all(10),
                      hintStyle: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w300,
                        color: Color.fromARGB(255, 209, 206, 206),
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Image(
                          image: AssetImage('asset/images/naira.png'),
                        ),
                      ),
                      hintText: '0.00',
                      hoverColor: Colors.transparent,
                    ),
                  ),
                ),
          isClicked ? SizedBox(height: 10) : SizedBox(height: 60),
          isClicked
              ? SizedBox.shrink()
              : GestureDetector(
                  onTap: () {
                    if (decoderController.text.isEmpty ||
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
    );
  }
}
