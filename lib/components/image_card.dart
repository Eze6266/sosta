import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant.dart';

class ImageCard extends StatelessWidget {
  final String mImage;
  final String sImage;
  final String lImage;
  const ImageCard(
      {super.key,
      required this.mImage,
      required this.sImage,
      required this.lImage});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Padding(
      padding: const EdgeInsets.only(right: 50, left: 50),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(lImage))),
              height: 90.w,
              width: 90.w,
            ),
          ),
          Positioned(
            right: 127,
            top: 20,
            child: Container(
              height: 15.w,
              width: 15.w,
              decoration: BoxDecoration(
                  color: secondary, borderRadius: BorderRadius.circular(100)),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 6),
                  borderRadius: BorderRadius.circular(1000),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(mImage))),
              height: 140.w,
              width: 140.w,
            ),
          ),
          Positioned(
            right: 105,
            top: 95,
            child: Container(
              height: 20.w,
              width: 20.w,
              decoration: BoxDecoration(
                  color: primary, borderRadius: BorderRadius.circular(100)),
            ),
          ),
        ],
      ),
    ));
  }
}
