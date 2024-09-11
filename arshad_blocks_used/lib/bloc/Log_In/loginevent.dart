import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable
{
  const LoginEvent();

  @override
  List<Object> get props =>[];
}


class NameGetEvent extends LoginEvent
{
  final String name;
const NameGetEvent({required this.name});



@override
List<Object> get props =>[name];
}

class PasswordGetEvent extends LoginEvent
{
  final String password;
const PasswordGetEvent({required this.password});

@override
List<Object> get props =>[password];
}


class LoginApi extends LoginEvent{}