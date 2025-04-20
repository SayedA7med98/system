import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:system/widgets/custom_text_field.dart';
import '../utils/app_theme.dart';

class CustomAddTextField extends StatelessWidget {
  final String text;
  final TextEditingController textEditingController;
  const CustomAddTextField({super.key, required this.text, required this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text,
          style: GoogleFonts.montserrat().copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppTheme.mainColor
          ),
        ),
        defaultTextFormField(
          controller: textEditingController,
          validator: (value){
            if(value!.isEmpty){
              return 'Required';
            }
            return null;
          },
          inputType: TextInputType.text,
          label: text,
        ),
      ],
    );
  }
}
