import 'package:flutter/material.dart';

import '../../../../constant.dart';
import '../../../../widgets/app_button.dart';

class WhyCancelBooking extends StatefulWidget {
  // void action;
  WhyCancelBooking({
    super.key,
  });

  @override
  State<WhyCancelBooking> createState() => _WhyCancelBookingState();
}

class _WhyCancelBookingState extends State<WhyCancelBooking> {
  @override
  Widget build(BuildContext context) {
    return AppButton(
      text: 'Yes, Cancel',
      onTap: () => {vendorQ()},
      bgColor: const Color(0xffF5F5F5),
      color: tertiary,
    );
  }

  void vendorQ() {
    Navigator.pop(context);
    showModalBottomSheet(
        context: context,
        enableDrag: true,
        isDismissible: true,
        isScrollControlled: true,
        useRootNavigator: true,
        builder: (context) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                    child: Padding(
                        padding: EdgeInsets.only(
                          top: 42,
                          bottom: 42,
                          right: 32,
                          left: 32,
                        ),
                        child: Column(
                          children: [
                            const Text(
                              'Tell us why you’re cancelling your booking with vendor',
                              style: TextStyle(
                                  color: tertiary,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 50,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color(0xffF5F5F5), width: 3)),
                              child: Padding(
                                padding: EdgeInsets.all(19),
                                child: Text(
                                  'Vendor is not responding to calls/messages',
                                  style: TextStyle(
                                      color: tertiary,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 50,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color(0xffF5F5F5), width: 3)),
                              child: Padding(
                                padding: EdgeInsets.all(19),
                                child: Text(
                                  'Vendor is not responding to calls/messages',
                                  style: TextStyle(
                                      color: tertiary,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 50,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color(0xffF5F5F5), width: 3)),
                              child: Padding(
                                padding: EdgeInsets.all(19),
                                child: Text(
                                  'Vendor is not responding to calls/messages',
                                  style: TextStyle(
                                      color: tertiary,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 50,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color(0xffF5F5F5), width: 3)),
                              child: Padding(
                                padding: EdgeInsets.all(19),
                                child: Text(
                                  'Vendor is not responding to calls/messages',
                                  style: TextStyle(
                                      color: tertiary,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            AppButton(
                                text: 'Continue',
                                onTap: () {},
                                color: Colors.white,
                                bgColor: primary),
                          ],
                        )))
              ],
            ));
  }
}
