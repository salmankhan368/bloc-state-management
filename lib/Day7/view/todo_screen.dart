import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bloc/Day7/bloc/todo_bloc.dart';
import 'package:my_bloc/Day7/bloc/todo_event.dart';
import 'package:my_bloc/Day7/bloc/todo_state.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade500,
        title: Center(
          child: Text(
            "Todo App",
            style: TextStyle(
              color: Colors.deepPurple.shade100,
              fontSize: 18,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<TodoBloc, TodoState>(
              builder: (context, states) {
                if (states.todoList.isEmpty) {
                  return Text('No Todo event are found');
                } else if (states.todoList.isNotEmpty) {
                  return ListView.builder(
                    itemCount: states.todoList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(states.todoList[index].toString()),
                        trailing: IconButton(
                          onPressed: () {
                            context.read<TodoBloc>().add(
                              RemoveTodoEvent(task: states.todoList[index]),
                            );
                          },
                          icon: Icon(Icons.delete, color: Colors.red),
                        ),
                      );
                    },
                  );
                } else {
                  return SizedBox();
                }
              },
            ),
            FloatingActionButton(
              onPressed: () {
                for (int i = 0; i < 1; i++) {
                  context.read<TodoBloc>().add(
                    AddToDoEvent(task: 'Salman' + i.toString()),
                  );
                }
              },
              child: Icon(Icons.add, color: Colors.deepPurple.shade500),
            ),
          ],
        ),
      ),
    );
  }
}
