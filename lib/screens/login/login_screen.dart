import 'package:ecommerce_app/screens/home/home_screen.dart';
import 'package:ecommerce_app/utils/constants/app_strings.dart';
import 'package:ecommerce_app/utils/extensions/margin_extension.dart';
import 'package:ecommerce_app/widgets/custom_svg.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/login_provider.dart';
import '../../utils/constants/app_colors.dart';
import '../../utils/constants/app_text_styles.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cardBackground,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: double.infinity,
                  child: const AppImage(assetName: AppStrings.loginBg),
                ),
                Positioned(
                  top: 20,
                  right: 10,
                  child: TextButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        const Text(
                          AppStrings.skip,
                          style: AppTextStyles.whiteBold,
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: AppColors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  12.hBox,
                  const Text(AppStrings.login, style: AppTextStyles.heading),
                  20.hBox,

                  Consumer<LoginProvider>(
                    builder: (context, loginProvider, child) {
                      return Column(
                        children: [
                          CustomTextField(
                            controller: loginProvider.emailController,
                            label: AppStrings.emailAddress,
                            hintText: AppStrings.emailHint,
                            onChanged: loginProvider.setEmail,
                          ),
                          20.hBox,
                          CustomTextField(
                            controller: loginProvider.passwordController,
                            label: AppStrings.password,
                            hintText: AppStrings.passwordHint,
                            isPassword: true,
                            isVisible: loginProvider.isPasswordVisible,
                            onChanged: loginProvider.setPassword,
                            onToggleVisibility:
                                loginProvider.togglePasswordVisibility,
                          ),
                        ],
                      );
                    },
                  ),
                  20.hBox,
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        AppStrings.forgotPassword,
                        style: AppTextStyles.bodySmall.copyWith(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                  20.hBox,
                  Consumer<LoginProvider>(
                    builder: (context, loginProvider, child) {
                      return CustomButton(
                        isEnabled:
                            loginProvider.emailController.text.isNotEmpty &&
                            loginProvider.passwordController.text.isNotEmpty,
                        text: AppStrings.login,
                        onPressed: () {
                          loginProvider.login();
                        },
                      );
                    },
                  ),

                  20.hBox,
                  Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: AppStrings.dontHaveAccount,
                            style: AppTextStyles.bodySmall,
                          ),
                          TextSpan(
                            text: AppStrings.signUp,
                            style: AppTextStyles.link,
                          ),
                        ],
                      ),
                    ),
                  ),
                  19.hBox,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
