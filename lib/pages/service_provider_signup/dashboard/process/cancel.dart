// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../../constant.dart';
import '../../../../widgets/app_button.dart';
import '../../../dashboard/process/offer.dart';
import '../../../dashboard/process/why_cancel_modal.dart';

class CancelBooking extends StatefulWidget {
  // void action;
  CancelBooking({
    super.key,
  });

  @override
  State<CancelBooking> createState() => _CancelBookingState();
}

class _CancelBookingState extends State<CancelBooking> {
  @override
  Widget build(BuildContext context) {
    return AppButton(
        text: 'Cancel',
        onTap: () => {Navigator.pop(context), cancelModal()},
        color: tertiary,
        bgColor: Color(0xfffF5F5F5));
  }

  void cancelModal() {
    showModalBottomSheet(
        context: context,
        isDismissible: true,
        isScrollControlled: true,
        builder: (context) => Column(mainAxisSize: MainAxisSize.min, children: [
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
                            'Cancel Booking?',
                            style: TextStyle(
                                color: tertiary,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          const Text(
                            'Do you want to cancel your booking with this vendor?',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xff50555C),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              WhyCancelBooking(),
                              const SizedBox(
                                width: 15,
                              ),
                              AppButton(
                                  text: 'No, Please',
                                  onTap: () => {
                                        Navigator.pop(context),
                                        showModalBottomSheet(
                                            context: context,
                                            isDismissible: true,
                                            isScrollControlled: true,
                                            builder: (context) =>
                                                OfferPriceWidget())
                                      },
                                  color: Colors.white,
                                  bgColor: tertiary),
                            ],
                          )
                        ],
                      )))
            ]));
  }
}
