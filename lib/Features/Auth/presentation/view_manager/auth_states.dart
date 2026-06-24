abstract class AuthStates{}
class AuthInitial extends AuthStates{}

/// Login States
class LoginLoading extends AuthStates{}
class LoginFailure extends AuthStates{
  final String errMessage;
  LoginFailure({required this.errMessage});
}
class LoginSuccess extends AuthStates{}

/// Register States
class RegisterLoading extends AuthStates{}
class RegisterFailure extends AuthStates{
  final String errMessage;
  RegisterFailure({required this.errMessage});
}
class RegisterSuccess extends AuthStates{}

/// SignInGoogle
class SignInGoogleLoading extends AuthStates{}
class SignInGoogleFailure extends AuthStates{}
class SignInGoogleSuccess extends AuthStates{}

/// Reset Password
class ResetPasswordLoading extends AuthStates{}
class ResetPasswordFailure extends AuthStates{}
class ResetPasswordSuccess extends AuthStates{}

/// Logout
class LogoutLoading extends AuthStates{}
class LogoutFailure extends AuthStates{}
class LogoutSuccess extends AuthStates{}

/// UserData
class UserDataLoading extends AuthStates{}
class UserDataFailure extends AuthStates{}
class UserDataSuccess extends AuthStates{}

/// GetUserData
class GetUserDataLoading extends AuthStates{}
class GetUserDataFailure extends AuthStates{}
class GetUserDataSuccess extends AuthStates{}