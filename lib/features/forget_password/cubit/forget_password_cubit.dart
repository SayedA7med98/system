
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system/features/forget_password/cubit/forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(ForgetPasswordInitState());

  static ForgetPasswordCubit get(context) => BlocProvider.of(context);

  IconData suffixIcon = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffixIcon =
    isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangeNewPasswordVisibilityState());
  }

}