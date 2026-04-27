import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bloc/Day5/bloc/switch_event.dart';
import 'package:my_bloc/Day5/bloc/switch_state.dart';

class SwitchBlock extends Bloc<SwitchEvent, SwitchState> {
  SwitchBlock() : super(SwitchState()) {
    on<EnableOrDisableNotification>(_enableOrDisableNotification);
    on<SliderEvent>(_slider);
  }
  void _enableOrDisableNotification(
    EnableOrDisableNotification events,
    Emitter<SwitchState> emit,
  ) {
    emit(state.copyWith(isSwitch: !state.isSwitch));
  }

  void _slider(SliderEvent events, Emitter<SwitchState> emit) {
    emit(state.copyWith(slider: events.slider));
  }
}
