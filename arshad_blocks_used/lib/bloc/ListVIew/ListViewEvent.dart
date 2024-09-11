import 'package:equatable/equatable.dart';

abstract class ListViewEvent extends Equatable
{

  const ListViewEvent();


}


class AddItems extends ListViewEvent
{
final String  taskes ;

const AddItems(this.taskes);

@override
  List<Object > get props => [taskes];
}

class RemoveTodoEvent extends ListViewEvent {
  final Object index;
  const RemoveTodoEvent(this.index);

  @override
  List<Object > get props => [index];
}
