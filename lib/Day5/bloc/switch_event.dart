import 'package:equatable/equatable.dart';

abstract class SwitchEvent extends Equatable {
  SwitchEvent();
  @override
  List<Object> get props => [];
}

class EnableOrDisableNotification extends SwitchEvent {}

class SliderEvent extends SwitchEvent {
  final double slider;
  SliderEvent({required this.slider});
  List<Object> get props => [slider];
}
