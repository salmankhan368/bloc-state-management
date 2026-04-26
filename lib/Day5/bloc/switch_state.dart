import 'package:equatable/equatable.dart';

class SwitchState extends Equatable {
  bool isSwitch;
  SwitchState({this.isSwitch = false});
  SwitchState copyWith({bool? isSwitch}) {
    return SwitchState(isSwitch: isSwitch ?? this.isSwitch);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [isSwitch];
}
