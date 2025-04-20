import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system/features/home_layout/cubit/home_cubit.dart';
import 'package:system/features/home_layout/cubit/home_stats.dart';
import 'package:system/widgets/Custom_phone_number.dart';
import 'package:system/widgets/custom_add_text_field.dart';
import 'package:system/widgets/custom_select_date.dart';
import '../../../widgets/custom_save_cancel_buttons.dart';

class AddClientScreen extends StatefulWidget {
  final VoidCallback onCancel;
  const AddClientScreen({super.key, required this.onCancel, });

  @override
  State<AddClientScreen> createState() => _AddClientScreenState();
}

class _AddClientScreenState extends State<AddClientScreen> {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit = HomeCubit.get(context);
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // client Name
              CustomAddTextField(
                text: 'Client Name',
                textEditingController: cubit.clientNameCon,
              ),
              SizedBox(height: 10,),
              // Address and Phone
              Row(
                children: [
                  Expanded(
                    child:  CustomAddTextField(
                      text: 'Client Address',
                      textEditingController: cubit.clientNameCon,
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: CustomPhoneNumber(customFocusNode: cubit.phoneFocusNode,),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              //debtor and creditor
              Row(
                children: [
                  Expanded(
                    child: CustomAddTextField(
                      text: 'Debtor',
                      textEditingController: cubit.clientDebtorCon,
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: CustomAddTextField(
                      text: 'Creditor',
                      textEditingController: cubit.clientCreditorCon,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              // statements and date
              Row(
                children: [
                  Expanded(
                    child: CustomAddTextField(
                      text: 'Amount Statement',
                      textEditingController:cubit.clientAccountStatementCon
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: CustomSelectDate(),
                  ),
                ],
              ),
              Spacer(),
              // cancel and save buttons
              CustomSaveCancelButtons(
                onCancel: (){widget.onCancel();},
                saved: (){},
              ),
            ],
          ),
        );
      },
    );
  }
}