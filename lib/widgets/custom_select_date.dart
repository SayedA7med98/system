import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;
import 'package:intl/intl.dart';

import '../utils/app_theme.dart';
import '../utils/icon_broken.dart';

class CustomSelectDate extends StatefulWidget {
  const CustomSelectDate({super.key});

  @override
  State<CustomSelectDate> createState() => _CustomSelectDateState();
}

class _CustomSelectDateState extends State<CustomSelectDate> {
  DateTime? selectedDate;

  Future<void> selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2500),
    );

    setState(() {
      selectedDate = pickedDate;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Date',
          style: GoogleFonts.montserrat().copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppTheme.mainColor
          ),
        ),
        Container(
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(width: 1,color: AppTheme.mainColor),
            borderRadius:BorderRadius.circular(5),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  selectedDate != null
                      ? DateFormat('MMM, dd, yyyy').format(selectedDate!)
                      : 'Date',
                ),
                IconButton(onPressed: (){selectDate();}, icon: Icon(IconBroken.Calendar))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
