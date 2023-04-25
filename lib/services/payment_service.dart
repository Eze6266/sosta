import 'dart:convert';
import 'dart:math';

// import 'package:flutterwave_standard/core/flutterwave.dart';
// import 'package:flutterwave_standard/models/requests/customer.dart';
// import 'package:flutterwave_standard/models/requests/customizations.dart';
// import 'package:flutterwave_standard/models/responses/charge_response.dart';
import 'package:flutterwave_standard/flutterwave.dart';
import 'package:sosta/services/storage_service.dart';

import '../config/app_config.dart';
import 'api.dart';

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();

class PaymentService {
  Future FlutterwavePayment(context, amount) async {
    var res = jsonDecode(await StorageService().getString('SA-user'));
    final Customer customer = Customer(
        name: "${res['first_name']} ${res['last_name']}",
        phoneNumber: "${res['phone_number']}",
        email: "${res['email']}");
    final Flutterwave flutterwave = Flutterwave(
        context: context,
        publicKey: FLUTTERWAVE_PUBLIC_KEY,
        currency: "NGN",
        redirectUrl: "https://sosta.slait.com.ng/api/login",
        txRef: "SOSTA-${getRandomString(40)}",
        amount: "$amount",
        customer: customer,
        paymentOptions: "ussd, card, barter, payattitude",
        customization: Customization(title: "My Payment"),
        isTestMode: true);

    final ChargeResponse response = await flutterwave.charge();

    if (response.status == 'successful') {
      print(response);
      var data = await Api.fundWallet(response, res['id'], amount);
      print(data);
      return response;
    }
  }

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
}
