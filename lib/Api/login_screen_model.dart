import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Model/login_response_data.dart';

class LoginAuthenticate with ChangeNotifier {
  // List<LoginScreenModelView> _login = [];

  Future<LoginResponse> getUserLoginDetails(
      String phoneNumber, String countryCode) async {
    const url = "http://staging-api.rapido.bid/api/v1/login";
    var response;
    try {
      response = await http.post(Uri.parse(url),
          headers: {"Content-Type": "application/json"},
          body: json.encode({
            "phone": phoneNumber,
            "countryCode": countryCode,
          }));

      if (response != null) {
        print(json.decode(response.body));
        return LoginResponse.fromMap(json.decode(response.body));
      } else {
        return null;
      }
    } catch (error) {
      throw error;
    }
  }

  Future<void> otpResponse(String token, String Otp) async {
    const url = "http://staging-api.rapido.bid/api/v1/verify";
    var otpResponse;
    try {
      otpResponse = await http.post(Uri.parse(url),
          headers: {"Content-Type": "application/json"}, body: json.encode({}));
    } catch (error) {
      throw error;
    }
  }
}
