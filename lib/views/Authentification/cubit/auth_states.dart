class AuthStates{}
class InitialApp extends AuthStates{}
class ChangePasswordVisibilityState extends AuthStates{}

class LoginLoadingState extends AuthStates{}
class LoginSuccessState extends AuthStates{
  final String uid;
  LoginSuccessState(this.uid);
}
class LoginErrorState extends AuthStates{
  final  onError;
  LoginErrorState(this.onError);
}

class RegisterLoadingState extends AuthStates{}
class RegisterSuccessState extends AuthStates{
  final String uid;
  RegisterSuccessState(this.uid);
}
class RegisterErrorState extends AuthStates{
  final String error;
  RegisterErrorState(this.error);
}

class CreateUserSuccessState extends AuthStates{
  final String uid;
  CreateUserSuccessState(this.uid);
}
class CreateUserErrorState extends AuthStates{
  final  error;
  CreateUserErrorState(this.error);
}

