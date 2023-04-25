import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavWidget extends StatelessWidget {
  const BottomNavWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 69,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(6)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: (() => context.go('/dashboard')),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  'https://res.cloudinary.com/kingstech/image/upload/v1667085954/home_mnqdzr.png',
                ),
                const Text(
                  'Home',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: (() => context.go('/dashboard/billpayment')),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'asset/images/billpay.png',
                ),
                const Text(
                  'Bill payment',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: (() => context.go('/dashboard/categories')),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  'https://res.cloudinary.com/kingstech/image/upload/v1667085954/dash_hqwirz.png',
                ),
                const Text(
                  'Categories',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                )
              ],
            ),
          ),
          GestureDetector(
              onTap: (() => {}),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    'https://res.cloudinary.com/kingstech/image/upload/v1667085954/account_k8dyry.png',
                  ),
                  const Text(
                    'Account',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
