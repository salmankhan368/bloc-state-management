import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bloc/Day7/bloc/todo_event.dart';
import 'package:my_bloc/Day7/bloc/todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final List<String> todoList = [];

  TodoBloc() : super(TodoState()) {
    on<AddToDoEvent>(_addTodoEvent);
    on<RemoveTodoEvent>(_removeTodoEvent);
  }

  void _addTodoEvent(AddToDoEvent event, Emitter<TodoState> emit) {
    todoList.add(event.task);
    emit(state.copyWith(List.from(todoList)));
  }

  void _removeTodoEvent(RemoveTodoEvent event, Emitter<TodoState> emit) {
    todoList.remove(event.task);
    emit(state.copyWith(List.from(todoList)));
  }
}
