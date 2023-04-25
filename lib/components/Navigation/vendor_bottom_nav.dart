import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class VendorBottomNavWidget extends StatelessWidget {
  const VendorBottomNavWidget({super.key});

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
            onTap: (() => context.go('/provider/dashboard')),
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
            onTap: () => {},
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  'https://res.cloudinary.com/kingstech/image/upload/v1667085954/dash_hqwirz.png',
                ),
                const Text(
                  'Jobs',
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
                  'https://res.cloudinary.com/kingstech/image/upload/v1667085954/home_mnqdzr.png',
                ),
                const Text(
                  'Messages',
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
