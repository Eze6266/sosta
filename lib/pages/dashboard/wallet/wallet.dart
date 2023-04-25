// ignore_for_file: prefer_const_constructors

import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import 'package:go_router/go_router.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constant.dart';
import '../../../models/transaction_model.dart';
import '../../../services/api.dart';
import '../../service_provider_signup/widget/input_widget.dart';

class UserWalletPage extends StatefulWidget {
  const UserWalletPage({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _UserWalletPageState createState() => _UserWalletPageState();
}

class _UserWalletPageState extends State<UserWalletPage> {
  final passwordController = TextEditingController();
  bool show = false;
  String text = '';
  List<TransactionModel> transactions = [];

  void initState() {
    super.initState();
    getTransactions();
  }

  void getTransactions() async {
    try {
      transactions = await Api.fetchTransactions();

      print(transactions);
      setState(() {});
    } catch (e) {
      // ElegantNotification.error(
      //         title: Text("Error"), description: Text(e.toString()))
      //     .show(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text(
              'Transactions',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w300),
            ),
            shadowColor: null,
            backgroundColor: Colors.transparent,
            centerTitle: true,
            elevation: 0,
            leading: IconButton(
              onPressed: () => context.pop(),
              color: const Color.fromARGB(255, 109, 105, 105),
              icon: Image.network(
                  'https://res.cloudinary.com/kingstech/image/upload/v1666210470/arrow_ockvre.png'),
              //replace with our own icon data.
            )),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.only(left: 17, right: 17),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    transactions.isEmpty
                        ? Column(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child:
                                    SvgPicture.asset('asset/images/noJob.svg'),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'No transaction yet!',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.w300,
                                      color: tertiary),
                                ),
                              )
                            ],
                          )
                        : Column(
                            children: [
                              InputWidget(
                                onChanged: (text) {},
                                hintText: 'Search',
                                prefixText: '',
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              ...transactions.map((transaction) => Container(
                                    decoration:
                                        BoxDecoration(color: Colors.white),
                                    child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Wallet funded',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w300,
                                                            fontSize: 14,
                                                            color: tertiary),
                                                      ),
                                                      Text(
                                                        DateFormat(
                                                                'MM/dd/yyyy, hh:mm a')
                                                            .format(DateTime.parse(transaction
                                                                    .created_at!
                                                                    .substring(
                                                                        0, 10) +
                                                                ' ' +
                                                                transaction
                                                                    .created_at!
                                                                    .substring(
                                                                        11,
                                                                        23))),
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w300,
                                                            fontSize: 12),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            transaction.amount!,
                                            style: TextStyle(
                                              color: Color(0xfff27AE60),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                  ],
                ))));
  }
}
