import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bloc/Day4/View/counter_Screen.dart';
import 'package:my_bloc/Day4/block/counter_bloc.dart';
import 'package:my_bloc/Day5/bloc/switch_block.dart';
import 'package:my_bloc/Day5/view/switch_example_scrren.dart';
import 'package:my_bloc/Day6/View/image_picker_screens.dart';
import 'package:my_bloc/Day6/bloc/image_picker_bloc.dart';
import 'package:my_bloc/utils/image_picker_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Counter Bloc
        BlocProvider(create: (context) => CounterBloc()),

        // Switch Bloc
        BlocProvider(create: (context) => SwitchBlock()),

        // Image Picker Bloc
        BlocProvider(
          create: (context) =>
              ImagePickerBloc(imagePickerUtils: ImagePickerUtils()),
        ),
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: true,

        home: ImagePickerScreen(),
      ),
    );
  }
}
