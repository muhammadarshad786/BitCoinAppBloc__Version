import 'package:equatable/equatable.dart';

enum LoginStatus {initial,loding,sucess,error }
class LoginState extends Equatable
{


  final String email;
  final String password;
  final LoginStatus loginstatuss;
  const LoginState({this.email='',this.password='',this.loginstatuss=LoginStatus.initial});

LoginState copyWith({String ? email,String ? password, LoginStatus ? loginstatuss})
{
  return LoginState(email: email ?? this.email,
  password: password ?? this.password,
  loginstatuss: loginstatuss ?? this.loginstatuss
  );
}

  @override
  List<Object?> get props => [email,password,loginstatuss];

  
}