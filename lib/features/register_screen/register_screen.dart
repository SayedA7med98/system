import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system/features/login/login_screen.dart';
import 'package:system/features/register_screen/otp_verification.dart';
import 'package:system/features/register_screen/cubit/register_cubit.dart';
import 'package:system/features/register_screen/cubit/register_state.dart';
import 'package:system/utils/app_theme.dart';
import 'package:system/utils/constants.dart';
import 'package:system/utils/icon_broken.dart';
import 'package:system/widgets/custom_button.dart';
import 'package:system/widgets/custom_text_button.dart';
import 'package:system/widgets/custom_text_field.dart';
import 'package:system/widgets/custom_title_text.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context)=>RegisterCubit(),
      child: BlocConsumer<RegisterCubit,RegisterStates>(
        listener: (context,state){},
        builder: (context,state){
          var cubit = RegisterCubit.get(context);
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
                          CustomTitleText(text: 'Register'),
                          SizedBox(height: 20,),
                          defaultTextFormField(
                            controller: nameController,
                            label: 'Full Name',
                            inputType : TextInputType.name,
                            validator: (value){
                              if(value!.isEmpty)
                              {
                                return 'Field is required';
                              }
                              else {return null;}
                            },
                            prefix: IconBroken.User,
                          ),
                          SizedBox(height: 16,),
                          defaultTextFormField(
                            controller: phoneController,
                            label: 'Mobile Phone',
                            inputType: TextInputType.phone,
                            validator: (value){
                              if(value!.isEmpty)
                              {
                                return 'Field is required';
                              }
                              else {return null;}
                            },
                            prefix: IconBroken.Call,
                          ),
                          SizedBox(height: 16,),
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
                          SizedBox(height: 16,),
                          defaultTextFormField(
                              controller: passwordController,
                              label: 'Password',
                              inputType: TextInputType.visiblePassword,
                              validator: (value){
                                if(value!.isEmpty)
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
                          SizedBox(height: 16,),
                          defaultTextFormField(
                              controller: confirmPasswordController,
                              label: 'Confirm Password',
                              inputType: TextInputType.visiblePassword,
                              validator: (value){
                                if(value!.isEmpty)
                                {
                                  return 'Field is required';
                                }
                                else if(value != passwordController.text){
                                  return 'Password does\'t match';
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
                          SizedBox(height: 16,),
                          ConditionalBuilder(
                            condition: state is! RegisterLoadingState,
                            builder: (BuildContext context)=>CustomButton(
                              onPressed: (){
                                if(formKey.currentState!.validate()){
                                  navigateTo(context, OtpVerification(email: emailController.text));
                                  nameController.clear();
                                  emailController.clear();
                                  phoneController.clear();
                                  phoneController.clear();
                                  confirmPasswordController.clear();
                                }
                              },
                              text: 'Register',
                            ),
                            fallback: (BuildContext context)=>Center(child: CircularProgressIndicator(color: AppTheme.mainColor,),),
                          ),
                          SizedBox(height: 16,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Already have account ?',style: AppTheme.textStyle16.copyWith(
                                  color: AppTheme.dark
                              ),),
                              SizedBox(width: 8,),
                              CustomTextButton(text: 'Log in', onPressed: (){navigateAndFinish(context, LoginScreen());}),
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
