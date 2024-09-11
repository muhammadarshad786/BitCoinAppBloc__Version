import 'package:equatable/equatable.dart';

abstract class FormEvent extends Equatable {
  const FormEvent();

  @override
  List<Object> get props => [];
}
class NamEvent extends FormEvent
{
  final String enterName;
const NamEvent({required this.enterName});
@override
  List<Object> get props =>[enterName];
}
class EmailEvent extends FormEvent
{
  final String enterEmail;
const EmailEvent({required this.enterEmail});
@override
  List<Object> get props =>[enterEmail];
}
class PasswordEvent extends FormEvent
{
  final String enterPassword;
const PasswordEvent({required this.enterPassword});
@override
  List<Object> get props =>[enterPassword];
}
class LoginApiResponse extends FormEvent{}



