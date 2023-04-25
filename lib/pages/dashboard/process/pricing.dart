// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../constant.dart';

class PricingWidget extends StatelessWidget {
  final image;
  final name;
  final min;
  final max;

  const PricingWidget(
      {super.key, this.image, this.name, this.min = 0, this.max = 0});

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
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(image!))),
              height: 75,
              width: 75,
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              children: [
                Text(
                  name,
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
                      'N$min - N$max',
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
