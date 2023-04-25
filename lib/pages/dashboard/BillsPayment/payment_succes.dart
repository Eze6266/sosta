// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:go_router/go_router.dart';
import 'package:sosta/pages/dashboard/BillsPayment/bill_payment.dart';

class PaymentSuccess extends StatefulWidget {
  const PaymentSuccess({super.key});

  @override
  State<PaymentSuccess> createState() => _PaymentSuccessState();
}

class _PaymentSuccessState extends State<PaymentSuccess> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => BillPayment()));
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffe5e5e5),
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
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 10 * size.height / 100),
          child: Column(
            children: [
              Material(
                borderRadius: BorderRadius.circular(10),
                elevation: 6,
                child: Container(
                  height: 224,
                  width: 224,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Image(
                    image: AssetImage('asset/images/done.png'),
                  ),
                ),
              ),
              SizedBox(height: 50),
              Text(
                'Payment Successful',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff29002e),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  // set up the button

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    content: Image(
      image: AssetImage('asset/images/done.png'),
    ),
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
