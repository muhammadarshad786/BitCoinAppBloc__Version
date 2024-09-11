import 'package:arshad_blocks_used/bloc/Log_In/loginevent.dart';
import 'package:arshad_blocks_used/bloc/Log_In/loginstate.dart';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
class LoginBLoc   extends  Bloc<LoginEvent,LoginState>
{

LoginBLoc():super(const LoginState())
{
  on<NameGetEvent>(_emailfun);
  on<PasswordGetEvent>(_passwordfun);
  on<LoginApi>(_loginApifun);
}


void _emailfun(NameGetEvent event,Emitter<LoginState>emit)
{
  emit(state.copyWith(email: event.name ));

}
void _passwordfun(PasswordGetEvent event,Emitter<LoginState>emit)
{
   emit(state.copyWith(password: event.password ));
}
Future<void> _loginApifun(LoginApi event,Emitter<LoginState>emit)
async {
   Map data={
    "email":state.email,
   "password":state.password
   };

 try{

  final response= await http.post(Uri.parse('https://reqres.in/api/login'),body:data);

  emit(state.copyWith(
      email: state.email,
      loginstatuss: LoginStatus.loding,
  )
  );


  if(response.statusCode==200)
  {
     emit(state.copyWith(
      email: state.email,
      loginstatuss: LoginStatus.sucess,
      
      
      
      
      )
      );

  }

  else{

   emit(state.copyWith(
      email: state.email,
      loginstatuss: LoginStatus.error,
      
      
      
      
      )
      );
      

  }

 

 }
 catch(e)
 {

  emit(state.copyWith(
      email: state.email,
      loginstatuss: LoginStatus.error,
      
      
      
      
      )
      );

 }
  
}


}