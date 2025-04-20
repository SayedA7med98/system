import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system/features/forget_password/forget_password.dart';
import 'package:system/features/login/cubit/cubit_states.dart';
import 'package:system/features/login/cubit/login_cubit.dart';
import 'package:system/features/register_screen/register_screen.dart';
import 'package:system/utils/app_theme.dart';
import 'package:system/utils/constants.dart';
import 'package:system/utils/icon_broken.dart';
import 'package:system/widgets/custom_button.dart';
import 'package:system/widgets/custom_text_button.dart';
import 'package:system/widgets/custom_text_field.dart';
import 'package:system/widgets/custom_title_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  var formKey= GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (BuildContext context)=>LoginCubit(),
      child: BlocConsumer<LoginCubit,LoginStates>(
        listener: (context,state){},
        builder: (context,state){
          var cubit = LoginCubit.get(context);
          return Scaffold(
            backgroundColor: AppTheme.light,
            body: Row(
              children: [
                Expanded(
                  child: Container(
                    color: AppTheme.mainColor,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth*0.1),
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomTitleText(text: 'Log in'),
                          SizedBox(height: 20,),
                          defaultTextFormField(
                            controller: emailController,
                            label: 'Email',
                            inputType: TextInputType.emailAddress,
                            validator: (value){
                              if(value!.isEmpty)
                              {
                                return 'Field is required';
                              }
                              else if(!value.contains('@')||!value.contains('.com')){
                                return 'Write valid Email Address';
                              }
                              else {return null;}
                            },
                            prefix: IconBroken.Message,
                          ),
                          SizedBox(height: 28,),
                          defaultTextFormField(
                              controller: passController,
                              label: 'Password',
                              inputType: TextInputType.visiblePassword,
                              validator: (value){
                                if(value!.isEmpty )
                                {
                                  return 'Field is required';
                                }

                                else {return null;}
                              },
                              prefix: IconBroken.Lock,
                              suffix: cubit.suffixIcon,
                              isPassword: cubit.isPassword,
                              onSuffixPressed: (){
                                cubit.changePasswordVisibility();
                              }
                          ),
                          SizedBox(height: 25,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CustomTextButton(text: 'Forget Password?', onPressed: (){
                                navigateTo(context, ForgetPassword());
                              }),
                            ],
                          ),
                          SizedBox(height: 28,),
                          ConditionalBuilder(
                            condition: state is! LoginLoadingState,
                            builder: (context)=>CustomButton(
                              onPressed: (){
                                if(formKey.currentState!.validate()){

                                }
                              },
                              text: 'Log in',
                            ),
                            fallback: (BuildContext context)=>Center(child: CircularProgressIndicator(color: AppTheme.mainColor,),),
                          ),
                          SizedBox(height: 17,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Don\'t have account ?',style: AppTheme.textStyle16.copyWith(
                                  color: AppTheme.dark
                              ),),
                              SizedBox(width: 8,),
                              CustomTextButton(text: 'Register', onPressed: (){navigateAndFinish(context, RegisterScreen());}),
                            ],
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
