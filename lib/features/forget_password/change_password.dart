import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system/features/forget_password/cubit/forget_password_cubit.dart';
import 'package:system/features/forget_password/cubit/forget_password_state.dart';
import 'package:system/features/login/login_screen.dart';
import 'package:system/utils/app_theme.dart';
import 'package:system/utils/constants.dart';
import 'package:system/utils/icon_broken.dart';
import 'package:system/widgets/custom_button.dart';
import 'package:system/widgets/custom_text_field.dart';
import 'package:system/widgets/custom_title_text.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context)=>ForgetPasswordCubit(),
      child: BlocConsumer<ForgetPasswordCubit,ForgetPasswordState>(
        listener: (context,state){},
        builder: (context,state){
          var cubit = ForgetPasswordCubit.get(context);
          return Scaffold(
            body: Row(
              children: [
                Expanded(child: Container(color: AppTheme.mainColor,)),
                Expanded(
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: screenWidth*0.1),
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(IconBroken.Arrow___Left_2)),
                            ],
                          ),
                          SizedBox(height: 16,),
                          CustomTitleText(text: 'Change Password'),
                          SizedBox(height: 16,),
                          defaultTextFormField(
                            controller: passwordController,
                            validator: (value){
                              if(value!.isEmpty){
                                return 'Field is required';
                              }
                              return null;
                            },
                            inputType: TextInputType.visiblePassword,
                            label: 'New Password',
                            prefix: IconBroken.Lock,
                            suffix: cubit.suffixIcon,
                            isPassword: cubit.isPassword,
                            onSuffixPressed: (){
                              cubit.changePasswordVisibility();
                            }
                          ),
                          SizedBox(height: 16,),
                          defaultTextFormField(
                            controller: confirmPasswordController,
                            validator: (value){
                              if(value!.isEmpty){
                                return 'Field is required';
                              }
                              else if (confirmPasswordController.text != passwordController.text){
                                return 'Password does\'t match';
                              }
                              return null;
                            },
                            inputType: TextInputType.visiblePassword,
                            label: 'New Password',
                            prefix: IconBroken.Lock,
                            suffix: cubit.suffixIcon,
                            isPassword: cubit.isPassword,
                            onSuffixPressed: (){
                              cubit.changePasswordVisibility();
                            }
                          ),
                          SizedBox(height: 16,),
                          ConditionalBuilder(
                            condition: state is! ChangeNewPasswordLoadingState,
                            builder: (context)=> CustomButton(
                              text: 'Change Password',
                              onPressed: (){
                                if(formKey.currentState!.validate()){
                                  navigateTo(context, LoginScreen());
                                }
                              },
                            ),
                            fallback: (context)=>Center(child: CircularProgressIndicator(color: AppTheme.mainColor,),),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
