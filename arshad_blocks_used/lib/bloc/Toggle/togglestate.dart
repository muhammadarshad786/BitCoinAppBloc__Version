import 'package:equatable/equatable.dart';


class ToggleState extends Equatable{


  final bool istoggle;

const ToggleState({this.istoggle=false});


ToggleState copyWith({bool ? istoggle})
{
  return ToggleState(istoggle: istoggle ?? this.istoggle
  
  );
}
  @override
  List<Object> get props =>[istoggle];


  
}