import 'package:ecommerce_app/models/auth_response.dart';
import 'package:ecommerce_app/services/auth_service.dart';
import 'package:flutter/material.dart';

import '../utils/constants/shared_preferences.dart';

class LoginProvider extends ChangeNotifier {
  final AuthService authService;
  LoginProvider({required this.authService}) {
    emailController.addListener(_onTextChanged);
    passwordController.addListener(_onTextChanged);
  }
  String _email = '';
  String _password = '';
  bool _isPasswordVisible = false;
  bool _isLoading = false;

  String get email => _email;
  String get password => _password;
  bool get isPasswordVisible => _isPasswordVisible;
  bool get isLoading => _isLoading;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _onTextChanged() {
    notifyListeners();
  }

  void setEmail(String value) {
    _email = value;
    notifyListeners();
  }

  void setPassword(String value) {
    _password = value;
    notifyListeners();
  }

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  Customerdata? authResponse;
  Future<void> login() async {
    _isLoading = true;
    try {
      notifyListeners();

      final response = await authService.login(
        email: emailController.text,
        password: passwordController.text,
      );
      if (response.success != null && response.success == 1) {
        authResponse = response.customerdata;
        await SharedPref().save(key: "userdata", value: response);
        await SharedPref().getUserData();
      } else {
        authResponse = null;
      }
    } catch (e) {
      authResponse = null;
      print("Exception occured while logging $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
