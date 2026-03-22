
import 'package:ecommerce_app/screens/login/login_screen.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/app_strings.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        fontFamily: 'Lufga',
      ),
      home: const LoginScreen()
    );
  }
}
