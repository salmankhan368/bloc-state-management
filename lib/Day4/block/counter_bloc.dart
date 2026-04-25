import 'package:bloc/bloc.dart';
import 'package:my_bloc/Day4/block/counter_event.dart';
import 'package:my_bloc/Day4/block/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState()) {
    on<IncrementCounter>(_increment);
    on<DecrementCounter>(_decrement);
  }
  void _increment(IncrementCounter event, Emitter<CounterState> oninit) {
    emit(state.copyWith(counter: state.counter + 1));
  }

  void _decrement(DecrementCounter event, Emitter<CounterState> oninit) {
    emit(state.copyWith(counter: state.counter - 1));
  }
}
