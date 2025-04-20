import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system/features/home_layout/cubit/home_cubit.dart';
import 'package:system/features/home_layout/cubit/home_stats.dart';
import 'package:system/widgets/Custom_phone_number.dart';
import 'package:system/widgets/custom_add_text_field.dart';
import 'package:system/widgets/custom_select_date.dart';
import '../../../widgets/custom_save_cancel_buttons.dart';

class AddEmployeeScreen extends StatelessWidget {
  final VoidCallback onCancel;
  const AddEmployeeScreen({super.key, required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit = HomeCubit.get(context);
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // employee name
              CustomAddTextField(
                  text: 'Employee Name',
                  textEditingController: cubit.employeeNameCon
              ),
              SizedBox(height: 10,),
              // job title and salary
              Row(
                children: [
                  Expanded(
                    child: CustomAddTextField(
                        text: 'Job Title',
                        textEditingController: cubit.employeeJobCon
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: CustomAddTextField(
                        text: 'Salary',
                        textEditingController: cubit.employeeNameCon
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Expanded(
                    child: CustomAddTextField(
                        text: 'Email',
                        textEditingController: cubit.employeeEmailCon
                    ),
                  ),
                  SizedBox(width: 60,),
                  Expanded(
                    child: CustomPhoneNumber(customFocusNode: cubit.phoneFocusNode),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              CustomSelectDate(),
              Spacer(),
              // cancel and save buttons
              CustomSaveCancelButtons(
                onCancel: (){onCancel();},
                saved: (){},
              ),
            ],
          ),
        );
      },
    );
  }
}
