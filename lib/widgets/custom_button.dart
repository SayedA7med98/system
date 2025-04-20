import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:system/utils/app_theme.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key,
    this.onPressed,
    required this.text,});
  final Function? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppTheme.mainColor,
          foregroundColor: AppTheme.light,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onPressed: (){onPressed!();},
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(text,
            style: GoogleFonts.montserrat().copyWith(
                fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
