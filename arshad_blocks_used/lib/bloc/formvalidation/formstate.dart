import 'package:equatable/equatable.dart';


enum LoginSt {initial,loding,sucess,error }

class FormesState extends Equatable {
  final String name;
  final String email;
  final String password;
   final  LoginSt   statusss;

  const FormesState({
    this.name = '',
    this.email = '',
    this.password = '',
    this.statusss=LoginSt.initial
  });

  FormesState copyWith({String? name, String? email, String? password,LoginSt ? statusss}) {
    return FormesState(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      statusss: statusss ?? this.statusss

    );
  }

  @override
  List<Object?> get props => [name, email, password,statusss];
}