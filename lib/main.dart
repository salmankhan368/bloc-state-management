import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bloc/Day4/View/counter_Screen.dart';
import 'package:my_bloc/Day4/block/counter_bloc.dart';
import 'package:my_bloc/Day5/bloc/switch_block.dart';
import 'package:my_bloc/Day5/view/switch_example_scrren.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterBloc()),
        BlocProvider(create: (context) => SwitchBlock()),
      ],
      child: MaterialApp(home: SwitchExampleS()),
    );
    // return BlocProvider(
    //   //this for example 1
    //   // create: (context) => CounterBloc(),
    //   // child: MaterialApp(home: CounterScreen()),

    //   //-- this for switch example
    //   create: (context) => SwitchBlock(),
    // child: MaterialApp(home: SwitchExampleS()),
  }
}
