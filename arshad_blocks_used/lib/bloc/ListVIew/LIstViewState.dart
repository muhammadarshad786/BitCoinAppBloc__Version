import 'package:equatable/equatable.dart';


class ListViewState extends Equatable
{

final List<String> lisy;

const ListViewState({this.lisy=const []});

ListViewState copyWith({List <String> ? lisy})
{
  return ListViewState(lisy: lisy ?? this.lisy);
}


@override
  List <Object >  get props => [lisy];
}