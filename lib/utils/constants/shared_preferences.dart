import 'dart:convert';


import 'package:ecommerce_app/models/auth_response.dart';
import 'package:ecommerce_app/utils/constants/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  SharedPreferences? sharedPref;

  Future<SharedPreferences> get _instance async =>
      sharedPref ??= await SharedPreferences.getInstance();

  Future<SharedPreferences> init() async {
    sharedPref = await _instance;
    return sharedPref!;
  }

  Future<bool> save({required String key, required dynamic value}) async {
    if (sharedPref == null) await init();
    switch (value.runtimeType) {
      case const (String):
        return await sharedPref!.setString(key, value);
      case const (bool):
        return await sharedPref!.setBool(key, value);
      case const (int):
        return await sharedPref!.setInt(key, value);
      case const (double):
        return await sharedPref!.setDouble(key, value);
      default:
        return await sharedPref!.setString(key, jsonEncode(value));
    }
  }



  Future<AuthResponse?> getUserData() async {
    if (sharedPref == null) await init();
    final String? userDataJson = sharedPref?.getString("userdata");
    if (userDataJson != null) {
      authResponse = AuthResponse.fromJson(jsonDecode(userDataJson));
      return authResponse;
    }
    return null;
  }

 
}
