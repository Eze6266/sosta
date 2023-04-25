import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sosta/services/storage_service.dart';

import '../config/app_config.dart';
import '../models/days_model.dart';
import '../models/service_providers_model.dart';
import '../models/state_model.dart';
import '../models/sub_category_model.dart';
import '../models/transaction_model.dart';

class Api {
  static Future login(email, password) async {
    final response = await http.post(
      Uri.parse('${baseUrl}login'),
      body: {'email': email, 'password': password},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(jsonDecode(response.body)['message']);
    }
  }

  static Future signup(details, auth) async {
    final response = await http.post(
      Uri.parse('${baseUrl}register'),
      body: {
        'username': details.username,
        'first_name': details.first_name,
        'last_name': details.last_name,
        'phone_number': details.phone,
        'role': 'user',
        'email': auth.email,
        'password': auth.password,
        'password_confirmation': auth.confirmPassword,
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(jsonDecode(response.body)['message']);
    }
  }

  static Future signupProvider(
    details,
  ) async {
    print('provider signup');
    print(details);

    var bodyDetails = <String, dynamic>{};
    bodyDetails['charge_type'] = details.chargeType;
    bodyDetails['closing_time'] = details.closingTime;
    bodyDetails['opening_time'] = details.openingTime;
    bodyDetails['sub_category_ids'] = details.subCategoryIds;
    bodyDetails['category_id'] = details.categoryId;
    bodyDetails['day_ids'] = details.dayIds;
    bodyDetails['min_charge'] = details.minCharge;
    bodyDetails['max_charge'] = details.maxCharge;
    bodyDetails['service_name'] = details.serviceName;
    bodyDetails['service_address'] = details.serviceAddress;
    bodyDetails['city'] = details.city;
    bodyDetails['service_description'] = details.serviceDescription;
    bodyDetails['state_id'] = details.stateId;
    bodyDetails['closest_landmark'] = details.closestLandmark;
    bodyDetails['password'] = details.password;
    bodyDetails['password_confirmation'] = details.passwordConfirmation;
    bodyDetails['email'] = details.email;
    bodyDetails['first_name'] = details.firstName;
    bodyDetails['last_name'] = details.lastName;
    bodyDetails['phone_number'] = details.phoneNumber;
    bodyDetails['role'] = 'vendor';

    try {
      final response = await http.post(Uri.parse('${baseUrl}vendor-register'),
          // body: {...details, 'role': 'vendor'},
          body: bodyDetails);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception(jsonDecode(response.body)['message']);
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future verifyPhone(otp) async {
    final response = await http.post(
      Uri.parse('${baseUrl}email/verify'),
      body: {
        'verification_code': otp,
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(response.body);
    }
  }

  static Future forgotPassword(email) async {
    final response = await http.post(
      Uri.parse('${baseUrl}forgot-password'),
      body: {
        'email': email,
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(jsonDecode(response.body)['message']);
    }
  }

  static Future verifyResetToken(token) async {
    final response = await http.post(
      Uri.parse('${baseUrl}verify-token'),
      body: {
        'token': token,
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(jsonDecode(response.body)['message']);
    }
  }

  static Future resetPassword(token, password_confirmation, password) async {
    final response = await http.post(
      Uri.parse('${baseUrl}reset-password'),
      body: {
        'token': token,
        'password': password,
        'password_confirmation': password_confirmation,
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(jsonDecode(response.body)['message']);
    }
  }

  static Future<List<DaysModel>> fetchDays() async {
    final response = await http.get(
      Uri.parse('${baseUrl}service-days'),
    );
    List<DaysModel> ser = [];

    if (response.statusCode == 200) {
      var res = jsonDecode(response.body);

      var data = res["data"] as List<dynamic>;

      for (var element in data) {
        ser.add(DaysModel.fromMap(element));
      }
      return ser;
    } else {
      throw Exception(jsonDecode(response.body)['message']);
    }
  }

  static Future fetchService() async {
    final response = await http.get(
      Uri.parse('${baseUrl}categories'),
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception(response.body);
    }
  }

  static Future<List<SubCategoryModel>> fetchSkills(category) async {
    final response = await http.get(
      Uri.parse('${baseUrl}sub-categories?search=$category'),
    );

    List<SubCategoryModel> ser = [];

    if (response.statusCode == 200) {
      var res = jsonDecode(response.body);
      print(res);
      var data = res["data"] as List<dynamic>;

      for (var element in data) {
        ser.add(SubCategoryModel.fromMap(element));
      }
      return ser;
    } else {
      throw Exception(jsonDecode(response.body)['message']);
    }
  }

  static Future fetchServiceProviders() async {
    final response = await http.get(
      Uri.parse('${baseUrl}categories'),
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception(response.body);
    }
  }

  static Future<List<StateModel>> fetchStates() async {
    final response = await http.get(
      Uri.parse('${baseUrl}states'),
    );
    List<StateModel> ser = [];

    if (response.statusCode == 200) {
      var res = jsonDecode(response.body);
      print(res);
      var data = res["data"] as List<dynamic>;

      for (var element in data) {
        ser.add(StateModel.fromMap(element));
      }
      return ser;
    } else {
      throw Exception(jsonDecode(response.body)['message']);
    }
  }

  ///Auth API
  static Future fundWallet(transaction, id, amount) async {
    String token = await StorageService().getString('SA-token');

    final response = await http.post(
      Uri.parse('${baseUrl}transactions'),
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
      body: {
        'customer_id': id.toString(),
        'amount': amount,
        'type': 'credit',
        'reference': transaction.txRef,
        'response_payload': jsonEncode(transaction),
        'status': transaction.status,
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(jsonDecode(response.body)['message']);
    }
  }

  static Future updateProfile(user) async {
    String token = await StorageService().getString('SA-token');
    final response = await http.post(
      Uri.parse('${baseUrl}users/${user.id}/update'),
      body: {
        'first_name': user.first_name,
        'last_name': user.last_name,
        'phone_number': user.phone_number,
        // 'profile_image': user.profile_image,
        // 'password': user.password
      },
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(jsonDecode(response.body)['message']);
    }
  }

  static Future fetchWalletBalance() async {
    String token = await StorageService().getString('SA-token');
    String user = await StorageService().getString('SA-user');

    final response = await http.get(
      Uri.parse('${baseUrl}wallets/${jsonDecode(user)['id']}'),
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception(jsonDecode(response.body)['message']);
    }
  }

  static Future<List<TransactionModel>> fetchTransactions() async {
    String token = await StorageService().getString('SA-token');

    final response = await http.get(
      Uri.parse('${baseUrl}transactions'),
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
    );

    List<TransactionModel> ser = [];

    if (response.statusCode == 200) {
      var res = jsonDecode(response.body);
      print(res);
      var data = res["data"] as List<dynamic>;

      for (var element in data) {
        ser.add(TransactionModel.fromMap(element));
      }
      return ser;
    } else {
      throw Exception(jsonDecode(response.body)['message']);
    }
  }

  static Future fetchBookings() async {
    String token = await StorageService().getString('SA-token');

    final response = await http.get(
      Uri.parse('${baseUrl}bookings'),
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception(jsonDecode(response.body)['message']);
    }
  }

  static Future<List<ServiceProviderModel>> searchForProviders(search) async {
    String token = await StorageService().getString('SA-token');

    final response = await http.get(
      Uri.parse('${baseUrl}services?search=$search'),
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
    );

    List<ServiceProviderModel> ser = [];

    if (response.statusCode == 200) {
      var res = jsonDecode(response.body);
      print(res);
      var data = res["data"] as List<dynamic>;

      for (var element in data) {
        ser.add(ServiceProviderModel.fromMap(element));
      }

      return ser;
    } else {
      throw Exception(jsonDecode(response.body)['message']);
    }
  }

  static makeBooking(id, clientid, btime, bdate, priceoffer, pquoted) async {
    String token = await StorageService().getString('SA-token');
    var pasyload = {
      "service_id": id,
      "client_id": clientid,
      "booking_time": btime,
      "booking_date": bdate,
      "price_offered": priceoffer,
      "price_quoted": pquoted,
    };

    final response = await http.post(Uri.parse('${baseUrl}bookings'),
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $token',
        },
        body: jsonEncode(pasyload));

    if (response.statusCode == 200) {
      var res = jsonDecode(response.body);
      print(res);
    } else {
      throw Exception(jsonDecode(response.body)['message']);
    }
  }
}
