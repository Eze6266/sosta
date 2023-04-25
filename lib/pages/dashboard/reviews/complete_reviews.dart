import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import '../../../constant.dart';
import '../../../widgets/app_button.dart';

class CompleteReviewPage extends StatefulWidget {
  const CompleteReviewPage({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _CompleteReviewPageState createState() => _CompleteReviewPageState();
}

class _CompleteReviewPageState extends State<CompleteReviewPage> {
  final passwordController = TextEditingController();
  bool show = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      margin: const EdgeInsets.only(left: 40, right: 40),
      // decoration: BoxDecoration(color: tertiary),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 6),
                borderRadius: BorderRadius.circular(1000),
                image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://res.cloudinary.com/kingstech/image/upload/v1667820237/success_r1wkh6.jpg'))),
            height: 200,
            width: 200,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Thank you for your review.',
            style: TextStyle(
                color: tertiary, fontSize: 20, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'You have recieved N200 bonus for using Sosta',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: tertiary, fontSize: 24, fontWeight: FontWeight.w300),
          ),
          const SizedBox(
            height: 60,
          ),
          AppButton(
            text: 'Continue',
            onTap: () => context.go('/dashboard'),
            bgColor: primary,
            color: Colors.white,
            width: MediaQuery.of(context).size.width - 40,
            height: 55,
          ),
        ],
      ),
    ));
  }
}
