import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/app_theme.dart';

class CustomTextInListView extends StatelessWidget {
  final int index;
  final String text;
  final int flex;

  const CustomTextInListView({super.key, required this.index, required this.text, required this.flex});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex:flex,
      child: Container(
        height: 35,
        color: index.isOdd?Color(0xffD1E2EA):Color(0xffECE8E8),
        child: Center(child: Text(
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          text,
          style: GoogleFonts.montserrat().copyWith(
            color: AppTheme.mainColor,
            fontWeight: FontWeight.w600,
          ),
        )),
      ),
    );
  }
}

