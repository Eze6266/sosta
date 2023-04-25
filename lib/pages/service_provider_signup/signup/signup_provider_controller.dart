// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../services/api.dart';
import '../../../services/storage_service.dart';

class SignupProviderController {
  Future register(BuildContext context) async {
    try {
      var data = await StorageService().getString('signup');
      var res = await Api.signupProvider(data);

      print(res);
      ElegantNotification.success(
              title: const Text("Success"),
              description: const Text(
                  "Kindly verify your phone number to complete the registration."))
          .show(context);

      context.go('/signup/verify-number', extra: data?.phone);
    } catch (e) {
      print('error');
      print(e);

      ElegantNotification.error(
              title: const Text("Error"),
              description: const Text("Unable to complete request"))
          .show(context);
    }
  }

  Future completeRegistration(BuildContext context, String otp) async {
    try {
      var res = await Api.verifyPhone(otp);
      ElegantNotification.success(
              title: const Text("Success"),
              description: const Text("Registration completed!"))
          .show(context);

      context.go('/signup/complete');
    } catch (e) {
      ElegantNotification.error(
              title: const Text("Error"),
              description: const Text("Unable to complete request"))
          .show(context);
    }
  }
}
