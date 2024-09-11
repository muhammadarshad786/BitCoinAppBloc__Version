import 'package:arshad_blocks_used/bloc/ListVIew/LIstViewState.dart';
import 'package:arshad_blocks_used/bloc/ListVIew/ListViewEvent.dart';
import 'package:bloc/bloc.dart';



class ListViewBloc extends Bloc<ListViewEvent,ListViewState>
{

  final List<String>  listview=[];
 ListViewBloc():super(const ListViewState())
 {
     on<AddItems>(_addToEvent);
    on<RemoveTodoEvent>(_removeEvent);
 }


 void _addToEvent(AddItems event,Emitter <ListViewState>emit)
 {

listview.add(event.taskes);
  emit(state.copyWith(lisy:List.from(listview)));

 }

 void _removeEvent(RemoveTodoEvent event,Emitter <ListViewState>emit)
 {

  listview.remove(event.index);
  emit(state.copyWith(lisy:List.from(listview)));
  
 }
}