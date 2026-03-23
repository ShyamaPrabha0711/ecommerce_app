import 'package:ecommerce_app/providers/home_provider.dart';
import 'package:ecommerce_app/screens/home/home_screen.dart';
import 'package:ecommerce_app/services/home_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/login_provider.dart';
import 'screens/app/app.dart';
import 'services/api_service.dart';
import 'services/auth_service.dart';
import 'utils/constants/constants.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<ApiService>(create: (context) => ApiService(baseUrl: baseUrl)),
        Provider<AuthService>(
          create: (context) =>
              AuthService(apiService: context.read<ApiService>()),
        ),
        Provider<HomeService>(
          create: (context) =>
              HomeService(apiService: context.read<ApiService>()),
        ),
         ChangeNotifierProvider(
          create: (context) =>
              HomeProvider(homeService: context.read<HomeService>()),
        ),
        ChangeNotifierProvider(
          create: (context) =>
              LoginProvider(authService: context.read<AuthService>()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
