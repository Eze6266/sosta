import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Color bgColor;
  final Color color;
  final Color? borderColor;
  final dynamic onTap;
  final double? width;
  final double? right;
  final double? left;
  final double? height;
  final bool? loading;

  const AppButton(
      {super.key,
      required this.text,
      required this.onTap,
      required this.bgColor,
      required this.color,
      this.borderColor = Colors.transparent,
      this.width,
      this.loading = false,
      this.right = 40,
      this.left = 40,
      this.height = 50});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(7),
            border: Border.all(color: borderColor!)),
        child: Padding(
          padding:
              EdgeInsets.only(right: right!, left: left!, top: 10, bottom: 10),
          child: loading!
              ? SizedBox(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                  height: 25,
                  width: 25,
                )
              : Text(
                  text,
                  style: TextStyle(
                      color: color,
                      fontFamily: 'Airbnb',
                      fontSize: 14,
                      fontWeight: FontWeight.w300),
                ),
        ),
      ),
      // decoration: ,
    );
  }
}
