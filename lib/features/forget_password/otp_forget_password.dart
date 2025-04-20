import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:system/features/forget_password/change_password.dart';
import 'package:system/features/forget_password/cubit/forget_password_cubit.dart';
import 'package:system/features/forget_password/cubit/forget_password_state.dart';
import 'package:system/utils/app_theme.dart';
import 'package:system/utils/constants.dart';
import 'package:system/utils/icon_broken.dart';
import 'package:system/widgets/custom_button.dart';
import 'package:system/widgets/custom_title_text.dart';

class OtpForgetPassword extends StatefulWidget {
  const OtpForgetPassword({super.key, required this.email});
  final String email;
  @override
  State<OtpForgetPassword> createState() => _OtpForgetPasswordState();
}

class _OtpForgetPasswordState extends State<OtpForgetPassword> {
  TextEditingController otp = TextEditingController();
  var formKey = GlobalKey<FormState>();
  int secondsRemaining = 120;
  bool resendEnabled = false;
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    Future.delayed(Duration(seconds: 1), () {
      if (secondsRemaining > 0) {
        setState(() {
          secondsRemaining--;
        });
        startTimer();
      } else {
        setState(() {
          resendEnabled = true;
        });
      }
    });
  }
  void resendOTP() {
    setState(() {
      secondsRemaining = 155;
      resendEnabled = false;
    });
    startTimer();
    // Trigger OTP resend function
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("OTP Resent")),
    );
  }
  void verifyOTP() {
    String enteredOTP = otp.text;
    if (enteredOTP.length == 6) {
      // Handle OTP verification
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("OTP Verified!")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter a valid OTP")),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
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
                          CustomTitleText(text: 'OTP Verification'),
                          Text('',
                            textAlign: TextAlign.center,
                            style: AppTheme.textStyle16.copyWith(
                                color: Colors.white
                            ),
                          ),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: 'Please enter the code send to your Email\nAddress ',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: AppTheme.dark
                              ),
                              children:[
                                TextSpan(text:widget.email, style: AppTheme.textStyle16),
                              ],
                            ),
                          ),
                          SizedBox(height: 16,),
                          Text(
                            "${(secondsRemaining ~/ 60).toString().padLeft(2, '0')}:${(secondsRemaining % 60).toString().padLeft(2, '0')}",
                            style: AppTheme.textStyle16,
                          ),
                          SizedBox(height: 20),
                          Pinput(
                            validator: (value){
                              if(value!.isEmpty){
                                return 'Fields are required';
                              }
                              return null;
                            },
                            controller: otp,
                            length: 6,
                            defaultPinTheme: PinTheme(
                              width: 50,
                              height: 50,
                              textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: AppTheme.mainColor),
                              ),
                            ),
                          ),
                          SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('I didn\'t receive any code .'),
                              TextButton(
                                  onPressed: resendEnabled?(){}:null,
                                  child: Text('Resend',
                                    style: AppTheme.textStyle16,
                                  )
                              ),
                            ],
                          ),
                          SizedBox(height: 40,),
                          ConditionalBuilder(
                            condition: state is! OTPForgetPasswordVerificationLoadingState,
                            builder: (context)=>CustomButton(
                                onPressed: (){
                                  if(formKey.currentState!.validate()){
                                    navigateTo(context, ChangePassword());
                                  }
                                },
                                text: 'Submit'
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
