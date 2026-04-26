import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bloc/Day5/bloc/switch_event.dart';
import 'package:my_bloc/Day5/bloc/switch_state.dart';

class SwitchBlock extends Bloc<SwitchEvent, SwitchState> {
  SwitchBlock() : super(SwitchState()) {
    on<EnableOrDisableNotification>(_enableOrDisableNotification);
  }
  void _enableOrDisableNotification(
    EnableOrDisableNotification events,
    Emitter<SwitchState> emit,
  ) {
    emit(state.copyWith(isSwitch: !state.isSwitch));
  }
}
