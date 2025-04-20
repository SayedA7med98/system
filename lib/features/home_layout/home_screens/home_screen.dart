import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:system/features/home_layout/cubit/home_cubit.dart';
import 'package:system/features/home_layout/cubit/home_stats.dart';
import 'package:system/utils/app_theme.dart';
import 'package:system/utils/icon_broken.dart';
import 'package:system/widgets/custom_text_field.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit = HomeCubit.get(context);
        return Column(
          children: [
            Container(
              height: 70,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                      color: AppTheme.mainColor
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width *0.25,
                      child: defaultTextFormField(
                        controller: cubit.homeSearchCon,
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
                    Row(
                      children: [
                        Stack(
                         children: [
                           IconButton(
                             onPressed: (){},
                             icon: Icon(IconBroken.Notification,color: AppTheme.mainColor,),
                           ),
                           CircleAvatar(
                             backgroundColor: Colors.red,
                             radius: 8,
                             child: Center(child: Text('1',
                              style: TextStyle(
                                fontSize: 11,
                                color: AppTheme.light
                              ),
                             )),
                           ),
                         ],
                        ),
                        CircleAvatar(
                          radius: 30,
                          child: Icon(IconBroken.User),
                        ),
                        SizedBox(width: 10,),
                        Text('Sayed Ahmed',
                          style: GoogleFonts.montserrat().copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: AppTheme.mainColor,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
