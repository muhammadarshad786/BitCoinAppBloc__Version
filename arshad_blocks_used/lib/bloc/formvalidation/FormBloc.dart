
import 'package:arshad_blocks_used/bloc/formvalidation/formState.dart';
import 'package:arshad_blocks_used/bloc/formvalidation/formevent.dart';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
class FormesBLoc   extends  Bloc<FormEvent,FormesState>
{

FormesBLoc():super(const FormesState())
{
  on<NamEvent>(_namefun);
  on<EmailEvent>(_emailfun);
    on<PasswordEvent>(_passwordfun);
  on<LoginApiResponse>(_loginApifun);
}


void _namefun(NamEvent event,Emitter<FormesState>emit)
{
  emit(state.copyWith(email: event.enterName ));

}
void _emailfun(EmailEvent event,Emitter<FormesState>emit)
{
    emit(state.copyWith(email: event.enterEmail ));
   
   

}
void _passwordfun(PasswordEvent event,Emitter<FormesState>emit)
{
    emit(state.copyWith(email: event.enterPassword ));

}
Future<void> _loginApifun(LoginApiResponse event,Emitter<FormesState>emit)
async {


 try{

  final response= await http.post(Uri.parse('https://reqres.in/api/login'),
  body:{  "email":state.email,
   "password":state.password}
   );

  //  print(response.body);

  emit(state.copyWith(
      email: state.email,
      statusss: LoginSt.loding,
  )
  );


  if(response.statusCode==200)
  {
     emit(state.copyWith(
      email: state.email,
     statusss: LoginSt.sucess,
      
      
      
      
      )
      );

  }

  else{
 

   emit(state.copyWith(
      email: state.email,
          statusss: LoginSt.error,
          
      
      
   
      
      )
      );
      

  }

 

 }
 catch(e)
 {
  
  emit(state.copyWith(
      email: state.email,
      statusss: LoginSt.error,
      
      
      
      
      )
      );

 }
  
}


}