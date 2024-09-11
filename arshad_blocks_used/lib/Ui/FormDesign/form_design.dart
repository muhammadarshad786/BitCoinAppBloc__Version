import 'package:arshad_blocks_used/bloc/formvalidation/FormBloc.dart';
import 'package:arshad_blocks_used/bloc/formvalidation/formState.dart';
import 'package:arshad_blocks_used/bloc/formvalidation/formevent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppssForm extends StatefulWidget {
  const AppssForm({super.key});

  @override
  State<AppssForm> createState() => AppFormState();
}

class AppFormState extends State<AppssForm> {
  bool showSecondContainer = false;
  bool accountContainer = false;
  TextEditingController _name=TextEditingController();
  TextEditingController _email=TextEditingController();
  TextEditingController _passworfddd=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FormesBLoc(),
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.7),
                Colors.black.withOpacity(0.9)
              ],
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 500,
                  margin: const EdgeInsets.all(30.0),
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      BlocBuilder<FormesBLoc, FormesState>(
                        builder: (context, state) {
                          return TextFormField(
                            controller: _email,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              labelStyle: const TextStyle(color: Colors.white),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                            onChanged: (value) {
                              context
                                  .read<FormesBLoc>()
                                  .add(NamEvent(enterName: _email.toString()));
                            },
                            validator: (value) {
                              if (value != null && value.length < 5) {
                                return 'Enter at least 5 characters';
                              }
                              return null;
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 30),
                      BlocBuilder<FormesBLoc, FormesState>(
                        builder: (context, state) {
                          return TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Username',
                              labelStyle: const TextStyle(color: Colors.white),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                            onChanged: (value) {
                              context
                                  .read<FormesBLoc>()
                                  .add(EmailEvent(enterEmail: value));
                            },
                            validator: (value) {
                              if (value != null && value.length < 5) {
                                return 'Enter at least 5 characters';
                              }
                              return null;
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 30),
                      BlocBuilder<FormesBLoc, FormesState>(
                        builder: (context, state) {
                          return TextFormField(
                            controller: _passworfddd,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: const TextStyle(color: Colors.white),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                            // onTap: () {
                            //   setState(() {
                            //     showSecondContainer = !showSecondContainer;
                            //   });
                            // },
                            onChanged: (value) {
                              context
                                  .read<FormesBLoc>()
                                  .add(PasswordEvent(enterPassword: _passworfddd.toString()));
                            },
                            validator: (value) {
                              if (value != null && value.length < 5) {
                                return 'Enter at least 5 characters';
                              }
                              return null;
                            },
                          );
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      BlocListener<FormesBLoc, FormesState>(
                        listener: (context, state) {
                            if (state.statusss == LoginSt.error) {
                               
                                     
                                                        
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        SnackBar(content: Text(state.statusss.toString())),
                      );
                  } else if (state.statusss == LoginSt.sucess) {
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        SnackBar(content:Text('Login successful')),
                      );
                  }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          child: BlocBuilder<FormesBLoc, FormesState>(
                            builder: (context, state) {
                              return ElevatedButton(
                                                      style: ElevatedButton.styleFrom(
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(20),
                                                        ),
                                                        elevation: 3,
                                                        minimumSize: const Size(150, 50),
                                                      ),
                                                      onPressed: () {
                                                        context.read<FormesBLoc>().add(LoginApiResponse());
                          
                                                      
                                                      },
                                                      child: const Text('LOGIN'),
                                                    );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      InkWell(
                        onTap: () {
                          setState(() {
                            accountContainer = !accountContainer;
                          });
                        },
                        child: Text(
                          accountContainer
                              ? "Already have a Account"
                              : "Create New Account ",
                          style: const TextStyle(color: Colors.orange),
                        ),
                      ),
                      const SizedBox(height: 30),
                      InkWell(
                        onTap: () {},
                        child: const Text(
                          "Forgot Password",
                          style: TextStyle(color: Colors.orange),
                        ),
                      ),
                    ],
                  ),
                ),
                // if (showSecondContainer)
                //   Padding(
                //     padding: const EdgeInsets.only(top: 20),
                //     child: Column(
                //       children: [

                //       ],
                //     ),
                //   ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
