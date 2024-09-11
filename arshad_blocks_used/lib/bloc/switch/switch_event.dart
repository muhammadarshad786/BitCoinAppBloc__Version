import 'package:equatable/equatable.dart';

abstract class SwitchEvent extends Equatable{

const SwitchEvent();

@override
List<Object> get props=>[];
}


class EnableorDisableNottification extends SwitchEvent{}

class Slidervaludegets extends SwitchEvent{

 final double slidedouble;
 const Slidervaludegets({required this.slidedouble});


 @override
 List<Object> get props=>[slidedouble];
}