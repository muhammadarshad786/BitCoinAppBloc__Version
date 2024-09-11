import 'package:arshad_blocks_used/bloc/Toggle/toggleevent.dart';
import 'package:arshad_blocks_used/bloc/Toggle/togglestate.dart';
import 'package:bloc/bloc.dart';


class ToggleBloc extends Bloc<TogglessEvent,ToggleState>
{
 ToggleBloc():super(const ToggleState())
  {

    on<ToggleContainer>(_toggingiscomplete);

  }
  void _toggingiscomplete(ToggleContainer event , Emitter<ToggleState>emit)
  {
    emit(state.copyWith(istoggle: ! state.istoggle));
  }
}