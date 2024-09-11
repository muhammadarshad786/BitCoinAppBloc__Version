import 'package:arshad_blocks_used/Ui/toggle_screen.dart';
import 'package:arshad_blocks_used/bloc/switch/switch_bloc.dart';
import 'package:arshad_blocks_used/bloc/switch/switch_event.dart';
import 'package:arshad_blocks_used/bloc/switch/switch_sate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class SliderShow extends StatefulWidget {
  const SliderShow({super.key});

  @override
  State<SliderShow> createState() => SliderShowState();
}

class SliderShowState extends State<SliderShow> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(title: const Text('Bloc Start'),
        backgroundColor: Colors.purple,),
        ),
        body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,

          children: [
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

             const Text('Notification'),
             BlocBuilder<SwitchBloc,SwitchState>(
              buildWhen: ((previous, current) => previous.isSwitch != current.isSwitch),

          builder: (context, state) {
           return Switch(value: state.isSwitch, onChanged: (newvalue){
            context.read<SwitchBloc>().add(EnableorDisableNottification());
           });
         },),
            
           ],),
          
          

BlocBuilder<SwitchBloc,SwitchState>(
  buildWhen: ((previous, current) => previous.slidervalue != current.slidervalue),
  builder: (context,state)
  {
    return   Container(
            height: 300,
            color: Colors.red.withOpacity(state.slidervalue),
           );
           
    }
    
    ),

  const SizedBox(
            height: 30,
        
           ),

BlocBuilder<SwitchBloc,SwitchState>(
  buildWhen: ((previous, current) => previous.slidervalue != current.slidervalue),
  builder: (context,state)
  {
    return   Slider(value: state.slidervalue, onChanged: (value){
   context.read<SwitchBloc>().add(Slidervaludegets(slidedouble: value));
    });

  }
  
  
  ),


  TextButton(onPressed: (){
Navigator.push(context, MaterialPageRoute(builder: (context)=>ToggleScreen()));
  }, child: Text('go to toggle'))

         
          ],
        ),
   );
  }
}