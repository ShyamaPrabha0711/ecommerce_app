import 'package:ecommerce_app/services/api_service.dart';

import '../models/auth_response.dart';

class AuthService {
  final ApiService apiService;
  AuthService({required this.apiService});

  Future<AuthResponse> login({
    required String email,
    required String password,
  }) async {
    final response = await apiService.post(
      '/login',
      queryParams: {"email_phone": email, "password": password},
    );
    return AuthResponse.fromJson(response);
  }
}
