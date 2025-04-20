import 'package:flutter/material.dart';
import 'package:system/widgets/custom_button_save_cancel.dart';

import '../utils/app_theme.dart';

class CustomSaveCancelButtons extends StatelessWidget {
  final Function onCancel;
  final Function saved;
  const CustomSaveCancelButtons({super.key, required this.onCancel, required this.saved});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomButtonSaveCancel(
            background: AppTheme.black,
            foreColor: AppTheme.light,
            onPressed: (){onCancel();},
            text: 'Cancel'
        ),
        SizedBox(width: 10,),
        CustomButtonSaveCancel(
            background: AppTheme.mainColor,
            foreColor: AppTheme.light,
            onPressed: (){saved();},
            text: 'Save'
        ),
      ],
    );
  }
}
