import 'package:equatable/equatable.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();
}

class AddToDoEvent extends TodoEvent {
  final String task;
  const AddToDoEvent({required this.task});
  @override
  List<Object?> get props => [task];
}

//remove from todo
class RemoveTodoEvent extends TodoEvent {
  final Object task;
  const RemoveTodoEvent({required this.task});
  @override
  List<Object?> get props => [task];
}
