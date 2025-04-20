import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system/features/home_layout/cubit/home_cubit.dart';
import 'package:system/features/home_layout/cubit/home_stats.dart';
import 'package:system/widgets/custom_text_field.dart';
import '../../../utils/app_theme.dart';
import '../../../utils/icon_broken.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_table_title.dart';
import '../../../widgets/custom_text_in_list_view.dart';

class ProductScreen extends StatelessWidget {
  final VoidCallback onAddInvoicePressed;
  const ProductScreen({super.key, required this.onAddInvoicePressed});

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
                        controller: cubit.productSearchCon,
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
                        text: 'Add New Product',
                        onPressed: (){onAddInvoicePressed();},
                      ),
                    )
                  ],
                ),
              ),
            ),
            //titles
            Row(
              children: [
                CustomTableTitle(flex: 2, text: 'Product Name'),
                SizedBox(width: 1,),
                CustomTableTitle(flex: 1, text: 'Product Code'),
                SizedBox(width: 1,),
                CustomTableTitle(flex: 1, text: 'Classification'),
                SizedBox(width: 1,),
                CustomTableTitle(flex: 1, text: 'Amount'),
                SizedBox(width: 1,),
                CustomTableTitle(flex: 1, text: 'Measurement'),
                SizedBox(width: 1,),
                CustomTableTitle(flex: 1, text: 'Purchase Price'),
                SizedBox(width: 1,),
                CustomTableTitle(flex: 1, text: 'Selling Price'),
                SizedBox(width: 1,),
                CustomTableTitle(flex: 1, text: 'Delete'),
              ],
            ),
            // list view of the client information
            Expanded(
              child: ListView.separated(
                itemCount: 10,
                itemBuilder: (context,index){
                  return Row(
                    children: [
                      CustomTextInListView(flex:2,index: index, text: 'Rosary'),
                      SizedBox(width: 1,),
                      CustomTextInListView(flex:1,index: index, text: '1000'),
                      SizedBox(width: 1,),
                      CustomTextInListView(flex:1,index: index, text: 'towels'),
                      SizedBox(width: 1,),
                      CustomTextInListView(flex:1,index: index, text: '100'),
                      SizedBox(width: 1,),
                      CustomTextInListView(flex:1,index: index, text: 'grain'),
                      SizedBox(width: 1,),
                      CustomTextInListView(flex:1,index: index, text: '100'),
                      SizedBox(width: 1,),
                      CustomTextInListView(flex:1,index: index, text: '100'),
                      SizedBox(width: 1,),
                      Expanded(
                        child: Container(
                          height: 35,
                          color: index.isOdd?Color(0xffD1E2EA):Color(0xffECE8E8),
                          child: Center(child: IconButton(onPressed:(){},icon: Icon(IconBroken.Delete),color: AppTheme.mainColor,)),
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
