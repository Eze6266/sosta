// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../../../../constant.dart';

class PricingWidget extends StatelessWidget {
  const PricingWidget(
      {super.key,
      required String name,
      required String min,
      required String max,
      required String image});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffFFD9B1), width: 6),
                  borderRadius: BorderRadius.circular(1000),
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://res.cloudinary.com/kingstech/image/upload/v1666183614/image_1_mwux5a.jpg'))),
              height: 75,
              width: 75,
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              children: [
                Text(
                  'James Kolawole',
                  style: TextStyle(
                      color: tertiary,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                Row(
                  children: [
                    Text(
                      'from',
                      style: TextStyle(color: Color(0xfffD1D3D9), fontSize: 14),
                    ),
                    Text(
                      'N1,500 - N2,000',
                      style: TextStyle(
                          color: tertiary,
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
        Container(
          height: 58,
          width: 58,
          decoration: BoxDecoration(
              color: primary, borderRadius: BorderRadius.circular(5)),
          child: Column(
            children: [
              Text('18',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w700)),
              Text('min away',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w500)),
            ],
          ),
        )
      ],
    ));
  }
}
