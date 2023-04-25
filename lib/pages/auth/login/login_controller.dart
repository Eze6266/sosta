import 'dart:convert';
import 'dart:developer';

import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sosta/services/api.dart';

import '../../../services/storage_service.dart';

class LoginController {
  Future login(String email, String password, BuildContext context) async {
    try {
      var res = await Api.login(email, password);

      StorageService().setString('SA-user', jsonEncode(res['data']['user']));
      StorageService().setString('SA-token', res['data']['token']);
      // ignore: use_build_context_synchronously
      ElegantNotification.success(
              title: Text("Success"),
              description: Text("Successfully signed in."))
          .show(context);
      if (res['data']['user']['default_role'] == 'user') {
        // ignore: use_build_context_synchronously
        context.go('/dashboard');
      } else {
        // ignore: use_build_context_synchronously
        context.go('/provider/dashboard');
      }
    } catch (e) {
      ElegantNotification.error(
              title: Text("Error"), description: Text(e.toString()))
          .show(context);
    }
  }

  Future resetPassword(String email, BuildContext context) async {
    try {
      await Api.forgotPassword(email);

      context.go('/password/retrieve-password/otp', extra: email);
      // ignore: use_build_context_synchronously
      ElegantNotification.success(
              title: Text("Success"), description: Text("Reset token sent!."))
          .show(context);
    } catch (e) {
      ElegantNotification.error(
              title: Text("Error"), description: Text(e.toString()))
          .show(context);
    }
  }

  Future changePassword(String token, String password,
      String password_confirmation, BuildContext context) async {
    try {
      await Api.resetPassword(token, password_confirmation, password);

      // ignore: use_build_context_synchronously
      ElegantNotification.success(
              title: Text("Success"),
              description: Text("Password change successfully!."))
          .show(context);
      context.go('/login');
    } catch (e) {
      ElegantNotification.error(
              title: Text("Error"), description: Text(e.toString()))
          .show(context);
    }
  }
}
