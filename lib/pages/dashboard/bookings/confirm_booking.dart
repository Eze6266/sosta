// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../constant.dart';
import '../../../widgets/app_button.dart';

class SidebarWidget extends StatelessWidget {
  const SidebarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //  void showBottomSheet() => ;
    return ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xffEBEDFF),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'You can refer someone and get paid in your wallet.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                  ),
                  AppButton(
                      text: 'Refer a friend',
                      onTap: () => showMaterialModalBottomSheet(
                          context: context,
                          builder: (context) => Column(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 120,
                                    decoration:
                                        BoxDecoration(color: Colors.red),
                                  )
                                ],
                              )),
                      bgColor: primary,
                      color: Colors.white)
                ],
              ),
            )),
        const SizedBox(
          height: 40,
        ),
        ListTile(
          title: const Text(
            'Messages',
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15),
          ),
          leading: Image.network(
            'https://res.cloudinary.com/kingstech/image/upload/v1667083520/messages_fg0iz3.png',
          ),
          onTap: () => context.go('/chat'),
        ),
        const SizedBox(
          height: 15,
        ),
        ListTile(
          title: const Text(
            'Bookings',
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15),
          ),
          leading: Image.network(
            'https://res.cloudinary.com/kingstech/image/upload/v1667083520/bookings_g9l38g.png',
          ),
          onTap: () => context.go('/bookings'),
        ),
        const SizedBox(
          height: 15,
        ),
        ListTile(
          title: const Text(
            'Sign up as a service provider',
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15),
          ),
          leading: Image.network(
            'https://res.cloudinary.com/kingstech/image/upload/v1667083520/signup_jdxmkc.png',
          ),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
        const SizedBox(
          height: 15,
        ),
        ListTile(
          title: const Text(
            'Wallet',
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15),
          ),
          leading: Image.network(
            'https://res.cloudinary.com/kingstech/image/upload/v1667083520/wallet_u62yav.png',
          ),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
        const SizedBox(
          height: 15,
        ),
        ListTile(
          title: const Text(
            'Terms & Conditions',
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15),
          ),
          leading: Image.network(
            'https://res.cloudinary.com/kingstech/image/upload/v1667083520/terms_v9mzeh.png',
          ),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
        const SizedBox(
          height: 15,
        ),
        ListTile(
          title: const Text(
            'Settings',
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15),
          ),
          leading: Image.network(
            'https://res.cloudinary.com/kingstech/image/upload/v1667083520/settings_jix3ar.png',
          ),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
        const SizedBox(
          height: 15,
        ),
        ListTile(
          title: const Text(
            'Profile',
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15),
          ),
          leading: Image.network(
            'https://res.cloudinary.com/kingstech/image/upload/v1667083520/profile_yznk33.png',
          ),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
      ],
    );
  }
}
