import 'package:flutter/material.dart';
import 'package:system/utils/app_theme.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({super.key, required this.text, required this.onPressed});
  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
      ),
      onPressed: (){onPressed();},
      child: Text(text,
        style: AppTheme.textStyle16,
      ),
    );
  }
}
