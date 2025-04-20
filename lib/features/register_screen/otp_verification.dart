import 'package:flutter/material.dart';
import 'package:system/utils/app_theme.dart';
import 'package:system/utils/icon_broken.dart';
import 'package:system/widgets/custom_button.dart';
import 'package:system/widgets/custom_title_text.dart';
import 'package:pinput/pinput.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({super.key, required this.email});
  final String email;
  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {

  TextEditingController otp = TextEditingController();
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
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppTheme.light,
      body: Row(
        children: [
          Expanded(child: Container(color: AppTheme.mainColor,)),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth*0.1),
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
                  CustomButton(
                      onPressed: (){},
                      text: 'Submit'
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
