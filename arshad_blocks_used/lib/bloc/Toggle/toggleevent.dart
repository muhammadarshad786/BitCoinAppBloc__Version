import 'package:equatable/equatable.dart';
abstract class TogglessEvent extends Equatable
{

  const TogglessEvent();

@override
  List<Object> get props =>[];

}

class ToggleContainer extends TogglessEvent{}