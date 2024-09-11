import 'package:arshad_blocks_used/Ui/LIstView/listtodo.dart';
import 'package:arshad_blocks_used/Ui/slider_switch.dart';
import 'package:arshad_blocks_used/bloc/counter/counter_bloc.dart';
import 'package:arshad_blocks_used/bloc/counter/counter_event.dart';
import 'package:arshad_blocks_used/bloc/counter/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Import the required package

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => MyWidgetState();
}

class MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         BlocBuilder<CounterBloc,CounterState>(

          builder: (context, state) {
           return Center(child: Text(state.counter.toString(),style: const TextStyle(fontSize: 60),));
         },),

         Row(
         mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(onPressed: (){
             context.read<CounterBloc>().add(IncrementCounter());
            }, child: const Text(' Increment Increment',style: TextStyle(fontSize: 20),)),
            const SizedBox(width: 20,),
            ElevatedButton(onPressed: (){
                 context.read<CounterBloc>().add(DecrementCounter());
            }, child:const Text('Decrement',style: TextStyle(fontSize: 20))),
          ],
         ),
           ElevatedButton(onPressed: (){
            
         

            Navigator.push(context, MaterialPageRoute(builder: ((context) => MyWidgetList())));
                
            }, child:const Text('Move',style: TextStyle(fontSize: 20))),
            Container(

height: 300,
             // child: ModelViewer(src: 'assets/astonode.glb'),
            )


        ],
      ),
    );
  }
}
