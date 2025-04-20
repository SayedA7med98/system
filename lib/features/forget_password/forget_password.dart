import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system/features/forget_password/cubit/forget_password_cubit.dart';
import 'package:system/features/forget_password/cubit/forget_password_state.dart';
import 'package:system/features/forget_password/otp_forget_password.dart';
import 'package:system/utils/app_theme.dart';
import 'package:system/utils/constants.dart';
import 'package:system/utils/icon_broken.dart';
import 'package:system/widgets/custom_button.dart';
import 'package:system/widgets/custom_text_field.dart';
import 'package:system/widgets/custom_title_text.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context)=>ForgetPasswordCubit(),
      child: BlocConsumer<ForgetPasswordCubit,ForgetPasswordState>(
        listener: (context,state){},
        builder: (context,state){
          return Scaffold(
            backgroundColor: AppTheme.light,
            body: Row(
              children: [
                Expanded(child: Container(color: AppTheme.mainColor,)),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth*0.1),
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              IconButton(onPressed:(){Navigator.pop(context);}, icon: Icon(IconBroken.Arrow___Left_2),),
                            ],
                          ),
                          SizedBox(height: 16,),
                          CustomTitleText(text: 'Forget Password'),
                          SizedBox(height: 20,),
                          Text('Please enter your Email Address to send to\nyou a verification code',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16,
                                color: AppTheme.dark
                            ),
                          ),
                          SizedBox(height: 16,),
                          defaultTextFormField(
                              controller: emailController,
                              validator: (value){
                                if (value!.isEmpty){
                                  return 'Field is required';
                                }
                                else if (!value.contains('@')||!value.contains('.com')){
                                  return 'Enter valid Email Address';
                                }
                                else{return null;}
                              },
                              inputType: TextInputType.emailAddress,
                              label: 'Email Address',
                              prefix: IconBroken.Message
                          ),
                          SizedBox(height: 16,),
                          ConditionalBuilder(
                              condition: state is! ForgetPasswordLoadingState,
                              builder: (context)=>CustomButton(
                                text: 'Send OTP',
                                onPressed: (){
                                  if(formKey.currentState!.validate())
                                    {
                                      navigateTo(context, OtpForgetPassword(email: emailController.text));
                                    }
                                },
                              ),
                              fallback: (context)=> Center(child: CircularProgressIndicator(color: AppTheme.mainColor,),),
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
