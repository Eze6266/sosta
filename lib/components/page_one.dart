import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sosta/constant.dart';

import '../widgets/app_button.dart';

class PageOne extends StatelessWidget {
  final Color bgColor;
  final Color bgColor2;
  final String image;
  const PageOne({
    super.key,
    required this.bgColor,
    required this.bgColor2,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [bgColor, bgColor2],
                begin: Alignment.topCenter,
                end: Alignment.center)),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 30, bottom: 30, left: 30, right: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Need anything done faster?',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w100,
                        fontSize: 45),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Get a verified service provider at your doorstep in 2 minutes.',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 25),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              // SvgPicture.asset('asset/images/pageONe.svg'),
              Image.asset(image),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: AppButton(
                      text: 'Login ',
                      bgColor: Colors.white,
                      color: secondary,
                      onTap: () => context.go('/login'),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: AppButton(
                      text: 'Sign up',
                      bgColor: primary,
                      color: Colors.white,
                      onTap: () => context.go('/signup'),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
