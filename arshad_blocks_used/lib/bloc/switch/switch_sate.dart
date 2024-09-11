import 'package:equatable/equatable.dart';


class SwitchState extends Equatable
{
  final bool isSwitch;
 final double slidervalue;
  const SwitchState({
  this.isSwitch=false,
  this.slidervalue=0.1
               });

 SwitchState copyWith ({bool ? isSwitch,double ? slidervalue})
{
return SwitchState(
  isSwitch: isSwitch ?? this.isSwitch,
   slidervalue: slidervalue ?? this.slidervalue,
  
  );
}
  
  @override
  List<Object?> get props => [isSwitch,slidervalue];
}