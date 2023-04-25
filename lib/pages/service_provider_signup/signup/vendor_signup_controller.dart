// ignore_for_file: use_build_context_synchronously, prefer_const_constructors

import 'dart:convert';

import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../services/api.dart';
import '../../auth/signup/signup_name.dart';
import '../../auth/signup/signup_password.dart';

class VendorSignupController {
  Future register(
      RegisterName? details, AuthDetails auth, BuildContext context) async {
    try {
      var res = await Api.signup(details, auth);

      print(res);
      ElegantNotification.success(
              title: Text("Success"),
              description: Text(
                  "Kindly verify your phone number to complete the registration."))
          .show(context);

      context.go('/signup/verify-number', extra: details?.phone);
    } catch (e) {
      print('error');
      print(e);

      ElegantNotification.error(
              title: Text("Error"),
              description: Text("Unable to complete request"))
          .show(context);
    }
  }

  Future completeRegistration(BuildContext context, String otp) async {
    try {
      var res = await Api.verifyPhone(otp);

      print(res);
      ElegantNotification.success(
              title: Text("Success"),
              description: Text("Registration completed!"))
          .show(context);

      context.go('/signup/complete');
    } catch (e) {
      print('error');
      print(e);

      ElegantNotification.error(
              title: Text("Error"),
              description: Text("Unable to complete request"))
          .show(context);
    }
  }
}
