import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system/features/home_layout/cubit/home_cubit.dart';
import 'package:system/features/home_layout/cubit/home_stats.dart';
import 'package:system/widgets/custom_add_text_field.dart';
import 'package:system/widgets/custom_save_cancel_buttons.dart';
import 'package:system/widgets/custom_select_date.dart';

class AddSalesInvoice extends StatelessWidget {
  const AddSalesInvoice({super.key, required this.onCancel});
  final VoidCallback onCancel;

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
              // Client name
              CustomAddTextField(
                  text: 'Client Name',
                  textEditingController: cubit.clientNameSalesCon
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Expanded(
                    child: CustomAddTextField(
                        text: 'Product',
                        textEditingController: cubit.productSalesCon
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: CustomAddTextField(
                        text: 'Amount',
                        textEditingController: cubit.amountSalesCon
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Expanded(
                    child: CustomAddTextField(
                        text: 'Price',
                        textEditingController: cubit.priceSalesCon
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: CustomAddTextField(
                        text: 'Total',
                        textEditingController: cubit.totalSalesCon
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Expanded(
                    child: CustomAddTextField(
                        text: 'Amount Paid',
                        textEditingController: cubit.amountPaidSalesCon
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: CustomAddTextField(
                        text: 'Residual',
                        textEditingController: cubit.residualSalesCon
                    ),
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