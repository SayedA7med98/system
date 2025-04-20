
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system/features/home_layout/cubit/home_cubit.dart';
import 'package:system/features/home_layout/cubit/home_stats.dart';
import 'package:system/utils/app_theme.dart';
import 'package:system/utils/icon_broken.dart';
import 'package:system/widgets/custom_table_title.dart';
import 'package:system/widgets/custom_text_field.dart';

import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text_in_list_view.dart';

class SalesInvoiceScreen extends StatelessWidget {
  final VoidCallback onAddInvoicePressed;
  const SalesInvoiceScreen({super.key, required this.onAddInvoicePressed});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit = HomeCubit.get(context);
        return Column(
          children: [
            // search and add client button
            SizedBox(
              height: 70,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width *0.25,
                      child: defaultTextFormField(
                        controller: cubit.customerSearchCon,
                        validator: (value){
                          if(value!.isEmpty)
                          {
                            return 'required';
                          }
                          return null;
                        },
                        inputType: TextInputType.text,
                        label: 'Search',
                        prefix: IconBroken.Search,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.2,
                      child: CustomButton(
                        text: 'Add New Invoice',
                        onPressed: (){onAddInvoicePressed();},
                      ),
                    )
                  ],
                ),
              ),
            ),
            // title of clients information
            Row(
              children: [
                CustomTableTitle(flex: 2,text: 'Client Name',),
                SizedBox(width: 1,),
                CustomTableTitle(flex: 2,text: 'Product',),
                SizedBox(width: 1,),
                CustomTableTitle(flex: 1,text: 'Amount',),
                SizedBox(width: 1,),
                CustomTableTitle(flex: 1,text: 'Price',),
                SizedBox(width: 1,),
                CustomTableTitle(flex: 1,text: 'Total',),
                SizedBox(width: 1,),
                CustomTableTitle(flex: 1,text: 'Amount Paid',),
                SizedBox(width: 1,),
                CustomTableTitle(flex: 1,text: 'Residual',),
                SizedBox(width: 1,),
                CustomTableTitle(flex: 1,text: 'Date',),
                SizedBox(width: 1,),
                CustomTableTitle(flex: 1,text: 'Delete',),
              ],
            ),
            SizedBox(height: 4.0,),
            // list view of the client information
            Expanded(
              child: ListView.separated(
                itemCount: 10,
                itemBuilder: (context,index){
                  return Row(
                    children: [
                      CustomTextInListView(flex:2,index: index, text: 'Sayed'),
                      SizedBox(width: 1,),
                      CustomTextInListView(flex:2,index: index, text: 'Flower'),
                      SizedBox(width: 1,),
                      CustomTextInListView(flex:1,index: index, text: '100'),
                      SizedBox(width: 1,),
                      CustomTextInListView(flex:1,index: index, text: '1000'),
                      SizedBox(width: 1,),
                      CustomTextInListView(flex:1,index: index, text: '1000'),
                      SizedBox(width: 1,),
                      CustomTextInListView(flex:1,index: index, text: '1000'),
                      SizedBox(width: 1,),
                      CustomTextInListView(flex:1,index: index, text: '1000'),
                      SizedBox(width: 1,),
                      CustomTextInListView(flex:1,index: index, text: 'Dec,3,2024'),
                      SizedBox(width: 1,),
                      Expanded(
                        child: Container(
                          height: 35,
                          color: index.isOdd?Color(0xffD1E2EA):Color(0xffECE8E8),
                          child: Center(child: Icon(IconBroken.Delete,color: AppTheme.mainColor,)),
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (context,index)=>SizedBox(height: 4,),
              ),
            ),
          ],
        );
      },
    );
  }
}
