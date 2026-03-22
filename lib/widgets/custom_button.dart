import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/constants/app_colors.dart';
import '../utils/constants/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final bool isEnabled;
  final VoidCallback onPressed;
  final bool isLoading;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isEnabled = true,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isEnabled ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: isEnabled ? AppColors.primary : Colors.grey,
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          elevation: 0,
        ),
        child: isLoading
            ? SizedBox(
                height: 30,
                child: CupertinoActivityIndicator(color: AppColors.white),
              )
            : Text(text, style: AppTextStyles.button),
      ),
    );
  }
}
