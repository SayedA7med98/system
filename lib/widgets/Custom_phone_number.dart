import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class CustomPhoneNumber extends StatelessWidget {
  final FocusNode customFocusNode;
  const CustomPhoneNumber({super.key,required this.customFocusNode});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Phone Number',
          style: GoogleFonts.montserrat().copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        IntlPhoneField(
          focusNode: customFocusNode,
          initialCountryCode: 'EG',
          decoration: InputDecoration(
            hintText: 'Phone Number',
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
