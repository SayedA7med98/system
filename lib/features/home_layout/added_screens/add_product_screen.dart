import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system/features/home_layout/cubit/home_cubit.dart';
import 'package:system/features/home_layout/cubit/home_stats.dart';
import '../../../widgets/custom_add_text_field.dart';
import '../../../widgets/custom_save_cancel_buttons.dart';


class AddProductScreen extends StatelessWidget {
  final VoidCallback onCancel;
  const AddProductScreen({super.key, required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit = HomeCubit.get(context);
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              // product name
              CustomAddTextField(
                  text: 'Product Name',
                  textEditingController: cubit.productNameCon
              ),
              SizedBox(height: 10,),
              // code and classification
              Row(
                children: [
                  Expanded(
                    child: CustomAddTextField(
                        text: 'Product Code',
                        textEditingController: cubit.productCodeCon
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: CustomAddTextField(
                        text: 'Classification',
                        textEditingController: cubit.productClassificationCon
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              //amount and unit
              Row(
                children: [
                  Expanded(
                    child: Expanded(
                      child:  CustomAddTextField(
                          text: 'Product Amount',
                          textEditingController: cubit.productAmountCon
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child:  CustomAddTextField(
                        text: 'Product Unit',
                        textEditingController: cubit.productAmountCon
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              //purchase and selling  price
              Row(
                children: [
                  Expanded(
                    child: CustomAddTextField(
                        text: 'Purchase Price',
                        textEditingController: cubit.productPurchaseCon
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: CustomAddTextField(
                        text: 'Selling Price',
                        textEditingController: cubit.productSellingCon
                    ),
                  ),
                ],
              ),
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