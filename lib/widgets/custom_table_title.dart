import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:system/utils/app_theme.dart';

class CustomTableTitle extends StatelessWidget {
  const CustomTableTitle({super.key, required this.flex, required this.text});
  final int flex;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(
        height: 35,
        color: AppTheme.mainColor,
        child: Center(child: Text(text,
          style: GoogleFonts.montserrat().copyWith(
            color: AppTheme.light,
          ),
        )),
      ),
    );
  }
}
