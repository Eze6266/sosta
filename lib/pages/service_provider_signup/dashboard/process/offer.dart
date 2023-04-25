// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sosta/models/service_providers_model.dart';
import 'package:sosta/pages/service_provider_signup/widget/input_widget.dart';

import '../../../../constant.dart';
import '../../../../widgets/app_button.dart';
import '../../../dashboard/process/cancel.dart';
import '../../../dashboard/process/pricing.dart';
import '../../../dashboard/process/request.dart';

class OfferWidget extends StatefulWidget {
  String text;
  bool show;
  Color bgColor;
  Color color;
  Color? borderColor;
  double? height;

  OfferWidget(
      {super.key,
      this.text = 'Continue',
      this.bgColor = primary,
      this.color = Colors.white,
      this.borderColor = Colors.transparent,
      this.show = false,
      ServiceProviderModel? serviceProviderModel});

  @override
  State<OfferWidget> createState() => OfferWidgetState();
}

class OfferWidgetState extends State<OfferWidget> {
  @override
  Widget build(BuildContext context) {
    return AppButton(
        text: widget.text,
        onTap: () => {Navigator.pop(context), callModalTwo()},
        color: widget.color,
        height: 63,
        borderColor: widget.borderColor,
        bgColor: widget.bgColor);
  }

  callModalTwo() {
    showModalBottomSheet(
        context: context,
        isDismissible: true,
        isScrollControlled: true,
        builder: (context) => OfferPriceWidget(show: widget.show));
  }
}

class OfferPriceWidget extends StatefulWidget {
  final bool show;
  OfferPriceWidget({super.key, this.show = false});

  @override
  State<OfferPriceWidget> createState() => _OfferPriceWidgetState();
}

class _OfferPriceWidgetState extends State<OfferPriceWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
              PricingWidget(),
              const SizedBox(
                height: 10,
              ),
              widget.show
                  ? InputWidget(
                      onChanged: (text) => {setState(() => text)},
                      hintText: 'enter amount',
                      prefixText: '',
                    )
                  : const Text(
                      'Offer your fare ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: tertiary,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
              const SizedBox(
                height: 10,
              ),
              AppButton(
                  text: 'Offer your fare',
                  onTap: () => {},
                  color: tertiary,
                  bgColor: Color(0xfffFFD9B1)),
              const SizedBox(
                height: 10,
              ),
              RequestProcess(),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: AppButton(
                      right: 10,
                      left: 10,
                      text: 'N1,650',
                      onTap: () {},
                      bgColor: Color(0xfffFFD9B1),
                      color: tertiary,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: AppButton(
                        right: 10,
                        left: 10,
                        text: 'N1,800',
                        onTap: () {},
                        color: tertiary,
                        bgColor: Color(0xfffFFD9B1)),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: AppButton(
                        right: 10,
                        left: 10,
                        text: 'N1,950',
                        onTap: () {},
                        color: tertiary,
                        bgColor: Color(0xfffFFD9B1)),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              // CancelBooking(action: callModalTwo),
              CancelBooking(),
              // AppButton(
              //     text: 'Cancel',
              //     onTap: () => {},
              //     color: tertiary,
              //     bgColor: Color(0xfffF5F5F5)),
            ],
          ),
        ))
      ],
    );
  }
}
