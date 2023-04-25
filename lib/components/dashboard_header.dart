// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:go_router/go_router.dart';

import '../constant.dart';
import '../pages/service_provider_signup/widget/input_widget.dart';
import '../services/api.dart';
import '../services/payment_service.dart';
import '../services/storage_service.dart';
import '../widgets/app_button.dart';

class DashboardHeaderWidget extends StatefulWidget {
  bool name;
  DashboardHeaderWidget({super.key, this.name = false});

  @override
  State<DashboardHeaderWidget> createState() => _DashboardHeaderWidgetState();
}

class _DashboardHeaderWidgetState extends State<DashboardHeaderWidget> {
  final amountController = TextEditingController();
  dynamic name = '';
  bool loading = false;
  String? wallet;

  @override
  void initState() {
    super.initState();
    getUserDetails();
    getWallet();
  }

  void getUserDetails() async {
    var res = await StorageService().getString('SA-user');
    setState(() {
      name = jsonDecode(res)['first_name'];
    });
  }

  void getWallet() async {
    try {
      var res = await Api.fetchWalletBalance();
      setState(() {
        wallet = jsonDecode(res)['data']['available_balance'];
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        widget.name
            ? Text(
                'Hi, ${name}',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 24,
                  color: tertiary,
                ),
              )
            : GestureDetector(
                onTap: () => fundWallet(context),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'N$wallet',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 24,
                        color: secondary,
                      ),
                    ),
                    Row(
                      children: [
                        Image.network(
                            'https://res.cloudinary.com/kingstech/image/upload/v1667084881/wallet_balance_bf3f5e.png'),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'Wallet Balance',
                          style: TextStyle(
                            fontSize: 16,
                            color: secondary,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
        GestureDetector(
          // onTap: () => Scaffold.of(context).openDrawer(),
          onTap: () => context.go('/dashboard/sidebar'),
          child: Container(
            height: 58,
            width: 58,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://res.cloudinary.com/kingstech/image/upload/v1667074497/profile-image_jzw7yh.jpg'))),
          ),
        ),
      ],
    );
  }

  fundWallet(context) {
    showModalBottomSheet(
        context: context,
        enableDrag: true,
        isDismissible: true,
        isScrollControlled: true,
        useRootNavigator: true,
        builder: (context) => Padding(
              padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Fund Wallet',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: tertiary,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InputWidget(
                    onChanged: (text) =>
                        {setState(() => amountController.text = text)},
                    hintText: 'Amount (NGN)',
                    prefixText: '',
                    type: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  AppButton(
                      text: 'Fund',
                      bgColor: amountController.text.isEmpty
                          ? const Color(0xffE5E5E5)
                          : primary,
                      color: Colors.white,
                      height: 55,
                      loading: loading,
                      width: MediaQuery.of(context).size.width,
                      onTap: () async => {
                            if (amountController.text.isNotEmpty)
                              {
                                setState(
                                  () {
                                    loading = true;
                                  },
                                ),
                                await PaymentService().FlutterwavePayment(
                                    context, amountController.text),
                                setState(
                                  () {
                                    loading = false;
                                  },
                                ),
                              },
                          }),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ));
  }
}
