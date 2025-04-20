import 'package:flutter/material.dart';
import 'package:system/utils/app_theme.dart';

class CustomTitleText extends StatelessWidget {
  const CustomTitleText({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: AppTheme.textStyle30
    );
  }
}
