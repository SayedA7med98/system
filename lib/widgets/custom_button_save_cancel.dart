import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:system/utils/app_theme.dart';

class CustomButtonSaveCancel extends StatelessWidget {
  final Color background;
  final Color foreColor;
  final Function onPressed;
  final String text;
  const CustomButtonSaveCancel({super.key, required this.background, required this.foreColor, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: background,
            foregroundColor: foreColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            )
        ),
        onPressed: (){onPressed();},
        child: Text(text,
          style: GoogleFonts.montserrat().copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppTheme.light,
          ),
        )
    );
  }
}
