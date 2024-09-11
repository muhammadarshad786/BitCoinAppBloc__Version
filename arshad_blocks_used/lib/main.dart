import 'package:arshad_blocks_used/Ui/Chart/linechart.dart';
import 'package:arshad_blocks_used/Ui/FormDesign/form_design.dart';
import 'package:arshad_blocks_used/Ui/counter_screen.dart';
// import 'package:arshad_blocks_used/Ui/counter_screen.dart';
// import 'package:arshad_blocks_used/Ui/slider_switch.dart';
import 'package:arshad_blocks_used/bloc/ListVIew/ListViewBloc.dart';
import 'package:arshad_blocks_used/bloc/Toggle/togglebloc.dart';
import 'package:arshad_blocks_used/bloc/counter/counter_bloc.dart';
import 'package:arshad_blocks_used/bloc/formvalidation/FormBloc.dart';
import 'package:arshad_blocks_used/bloc/switch/switch_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SwitchBloc(),
        ),
        BlocProvider(
          create: (context) => CounterBloc(),
        ),
          BlocProvider(
          create: (context) => ToggleBloc(),
        ),

         BlocProvider(
          create: (context) => ListViewBloc(),
        ),
         BlocProvider(
          create: (context) => FormesBLoc(),
        ),
      ],
      child:const MaterialApp(
        
        color: Colors.red,
        title: 'Switch',
        
        home: MyWidget(),
        )
    );
     
    
  }
}

