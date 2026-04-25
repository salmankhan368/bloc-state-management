import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bloc/Day4/block/counter_bloc.dart';
import 'package:my_bloc/Day4/block/counter_event.dart';
import 'package:my_bloc/Day4/block/counter_state.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Center(
          child: Text(
            'Counter App',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              return Center(
                child: Text(
                  state.counter.toString(),
                  style: TextStyle(fontSize: 60),
                ),
              );
            },
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(IncrementCounter());
                  },
                  child: Text(
                    "Increament",
                    style: TextStyle(color: Colors.deepPurple),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(DecrementCounter());
                  },
                  child: Text(
                    "Decreament",
                    style: TextStyle(color: Colors.deepPurple),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
