import 'package:arshad_blocks_used/Ui/Login/login.dart';
import 'package:arshad_blocks_used/bloc/Log_In/loginstate.dart';
import 'package:arshad_blocks_used/bloc/Toggle/togglebloc.dart';
import 'package:arshad_blocks_used/bloc/Toggle/toggleevent.dart';
import 'package:arshad_blocks_used/bloc/Toggle/togglestate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';




class ToggleScreen extends StatefulWidget {
  const ToggleScreen({super.key});

  @override
  State<ToggleScreen> createState() => ToggleScreenState();
}

class ToggleScreenState extends State<ToggleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
appBar: AppBar(
  title: const Text('Toggle With Bloc'),
  centerTitle: true,
  backgroundColor: Colors.yellowAccent,
),
body: Container(
  height: MediaQuery.sizeOf(context).height,

  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [

      BlocBuilder<ToggleBloc,ToggleState>(builder: ((context, state) {
        return state.istoggle
        ?Container(
        color: Colors.red,
        height: 300,
        width: 300,
      )  :Container( color: Colors.green,
        height: 300,
        width: 300,
        
        child: const Text('Toggle Green'),
        );

      })),


      InkWell(onTap: (){

        context.read<ToggleBloc>().add(ToggleContainer());
      },child: const Text("click to toggle"),),


      InkWell(onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Formvalidation()));

       
      },child: const Text("click to "),)


      

    ],
  ),
),
    );
  }
}