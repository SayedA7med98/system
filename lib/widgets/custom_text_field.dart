import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:system/utils/app_theme.dart';

Widget defaultTextFormField({
  required TextEditingController controller,
  required String? Function(String? value) validator,
  required TextInputType inputType,
  required String label,
  IconData? prefix,
  IconData? suffix,
  Function()? onSuffixPressed,
  Function()? onTap,
  Function(String s)? onSubmit,
  bool isPassword = false,
  bool enable = true,
}) =>
    TextFormField(
      enabled: enable,
      controller: controller,
      keyboardType: inputType,
      obscureText: isPassword,
      onTap: onTap,
      onFieldSubmitted: onSubmit,
      style: GoogleFonts.montserrat(
          color: AppTheme.mainColor,
          fontSize: 16
      ),
      decoration: InputDecoration(
        fillColor: Colors.white.withValues(alpha: 0.4),
        hintText: label,
        hintStyle:  GoogleFonts.montserrat(
          color: AppTheme.mainColor,
          fontSize: 16
        ),
        prefixIcon: prefix==null?null:Icon(prefix,color: AppTheme.mainColor,),
        suffixIcon: IconButton(icon: Icon(suffix),color: AppTheme.mainColor, onPressed: onSuffixPressed),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide:  BorderSide(color: AppTheme.mainColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide:  BorderSide(color: AppTheme.mainColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide:  BorderSide(color: AppTheme.mainColor),

        ),
      ),
      validator: validator,
    );