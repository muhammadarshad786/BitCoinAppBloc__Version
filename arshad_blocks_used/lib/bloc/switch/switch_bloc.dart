import 'package:arshad_blocks_used/bloc/switch/switch_event.dart';
import 'package:arshad_blocks_used/bloc/switch/switch_sate.dart';
import 'package:bloc/bloc.dart';


class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {


  SwitchBloc():super(const SwitchState())
  {

    on<EnableorDisableNottification>(_enableordisable);
    on<Slidervaludegets>(_sliderdisable);

  }

  void _enableordisable(EnableorDisableNottification event , Emitter<SwitchState>emit)
  {
    emit(state.copyWith(isSwitch: ! state.isSwitch));


  }
   void _sliderdisable(Slidervaludegets event , Emitter<SwitchState>emit)
  {
    emit(state.copyWith(slidervalue:event.slidedouble.toDouble()));


  }
 
}