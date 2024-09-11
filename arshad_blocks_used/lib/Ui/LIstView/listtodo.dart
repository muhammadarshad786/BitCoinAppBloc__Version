import 'package:arshad_blocks_used/bloc/ListVIew/LIstViewState.dart';
import 'package:arshad_blocks_used/bloc/ListVIew/ListViewBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/ListVIew/ListViewEvent.dart'; // Import the required package

class MyWidgetList extends StatefulWidget {
  const MyWidgetList({super.key});

  @override
  State<MyWidgetList> createState() => MyWidgetStatelist();
}

class MyWidgetStatelist extends State<MyWidgetList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: BlocBuilder<ListViewBloc,ListViewState>(
        
        builder: (context,state)
        {
           if (state.lisy.isEmpty) 
           {
            return const Center(
              child: Text('No todos yet.'),
            );

         
         }

         else if(state.lisy.isNotEmpty)
         {
          return ListView.builder(
            itemCount: state.lisy.length,
            itemBuilder: (context, index) {

              return ListTile(
                  title: Text(state.lisy[index]),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      BlocProvider.of<ListViewBloc>(context).add(RemoveTodoEvent(state.lisy[index]));
                    },
                  ),
              );
            
            },
          );

         }

         else {
            return const Center(
              child: Text('Unknown state.'),
            );
          }
           
       }
        
        
        
        
        ),

          floatingActionButton: FloatingActionButton(
        onPressed: ()  {
          for(int i = 0 ; i < 10 ; i++ ){
            BlocProvider.of<ListViewBloc>(context).add(AddItems('Task $i'));
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}