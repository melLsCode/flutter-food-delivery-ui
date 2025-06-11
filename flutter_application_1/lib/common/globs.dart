import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:food_delivery/main.dart';
import 'dart:convert';

class Globs {
  static const appName = "Food Delivery";

  static const userPayload = "user_payload";
  static const userLogin = "user_login";

 
  static void showHUD({String status = "Loading..."}) async {
    await Future.delayed(const Duration(milliseconds: 1));
    EasyLoading.show(status: status);
  }


  static void hideHUD() {
    EasyLoading.dismiss();
  }

  
  static void udSet(dynamic data, String key) {
    var jsonStr = json.encode(data);
    prefs?.setString(key, jsonStr);
  }

  static void udStringSet(String data, String key) {
    prefs?.setString(key, data);
  }

  static void udBoolSet(bool data, String key) {
    prefs?.setBool(key, data);
  }

  static void udIntSet(int data, String key) {
    prefs?.setInt(key, data);
  }

  static void udDoubleSet(double data, String key) {
    prefs?.setDouble(key, data);
  }

  
  static dynamic udValue(String key) {
    try {
      return json.decode(prefs?.get(key) as String? ?? "{}");
    } catch (_) {
      return {};
    }
  }

  static String udValueString(String key) {
    return prefs?.get(key) as String? ?? "";
  }

  static bool udValueBool(String key) {
    return prefs?.get(key) as bool? ?? false;
  }

  static bool udValueTrueBool(String key) {
    return prefs?.get(key) as bool? ?? true;
  }

  static int udValueInt(String key) {
    return prefs?.get(key) as int? ?? 0;
  }

  static double udValueDouble(String key) {
    return prefs?.get(key) as double? ?? 0.0;
  }

  
  static void udRemove(String key) {
    prefs?.remove(key);
  }
}


class SVKey {
  static const mainUrl = "http://10.0.2.2:5000";
  static const baseUrl = '$mainUrl/api/';
  static const nodeUrl = mainUrl;

  static const svLogin = '${baseUrl}login';
  static const svSignUp = '${baseUrl}sign_up';
  static const svForgotPasswordRequest = '${baseUrl}forgot_password_request';
  static const svForgotPasswordVerify = '${baseUrl}forgot_password_verify';
  static const svForgotPasswordSetNew = '${baseUrl}forgot_password_set_new';
}


class KKey {
  static const payload = "payload";
  static const status = "status";
  static const message = "message";
  static const authToken = "auth_token";
  static const name = "name";
  static const email = "email";
  static const mobile = "mobile";
  static const address = "address";
  static const userId = "user_id";
  static const resetCode = "reset_code";
}


class MSG {
  static const enterEmail = "Please enter your valid email address.";
  static const enterName = "Please enter your name.";
  static const enterCode = "Please enter a valid reset code.";
  static const enterMobile = "Please enter your valid mobile number.";
  static const enterAddress = "Please enter your address.";
  static const enterPassword = "Password must be at least 6 characters.";
  static const enterPasswordNotMatch = "Passwords do not match.";
  static const success = "Success";
  static const fail = "Fail";
}
