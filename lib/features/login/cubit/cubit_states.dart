abstract class LoginStates {}

class LoginInitState extends LoginStates{}
class LoginLoadingState extends LoginStates{}


class LoginChangePasswordVisibilityState extends LoginStates{}

class LoginResetPasswordLoadingState extends LoginStates{}
class LoginResetPasswordSuccessState extends LoginStates{}
class LoginResetPasswordErrorState extends LoginStates{
  final String error;

  LoginResetPasswordErrorState(this.error);
}
