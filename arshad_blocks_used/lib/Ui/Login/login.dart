import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:arshad_blocks_used/bloc/Log_In/loginbloc.dart';
import 'package:arshad_blocks_used/bloc/Log_In/loginevent.dart';
import 'package:arshad_blocks_used/bloc/Log_In/loginstate.dart';

class Formvalidation extends StatefulWidget {
  const Formvalidation({Key? key}) : super(key: key);

  @override
  State<Formvalidation> createState() => FormvalidationState();
}

class FormvalidationState extends State<Formvalidation> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late LoginBLoc _loginBlocs;

    @override
  void initState() {
    super.initState();
    _loginBlocs = LoginBLoc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_)=>_loginBlocs,
        child: Card(
          elevation: 20,
          color: Colors.yellow[300],
          shadowColor: Colors.red,
          child: Column(
            children: [
              BlocBuilder<LoginBLoc, LoginState>(
                builder: (context, state) {
                  return TextFormField(
                    controller: _emailController,
                    keyboardAppearance: Brightness.dark,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      context.read<LoginBLoc>().add(NameGetEvent(name: value));
                    },
                    decoration:const  InputDecoration(
                      labelText: 'Email',
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              BlocBuilder<LoginBLoc, LoginState>(
                builder: (context, state) {
                  return TextFormField(
                   
                    
                    controller: _passwordController,
                    keyboardAppearance: Brightness.dark,
                    
                    onChanged: (value) {
                      context
                          .read<LoginBLoc>()
                          .add(PasswordGetEvent(password: value));

                         
                    },
                    obscureText: true,
                  
                    decoration: const InputDecoration(
                      labelText: 'Password',
                    ),
                  );
                },
              ),
              BlocListener<LoginBLoc, LoginState>(
                listener: (context, state) {
                  if (state.loginstatuss == LoginStatus.error) {
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        SnackBar(content: Text(state.loginstatuss.toString())),
                      );
                  } else if (state.loginstatuss == LoginStatus.sucess) {
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        SnackBar(content: Text('Login successful')),
                      );
                  }
                },
                child: BlocBuilder<LoginBLoc, LoginState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: () {
                        context.read<LoginBLoc>().add(
                              LoginApi(
                              
                              ),
                            );
                      },
                      child: const Text('Login'),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
