import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bloc/Day4/View/counter_Screen.dart';
import 'package:my_bloc/Day4/block/counter_bloc.dart';
import 'package:my_bloc/Day5/bloc/switch_block.dart';
import 'package:my_bloc/Day5/view/switch_example_scrren.dart';
import 'package:my_bloc/Day6/View/image_picker_screens.dart';
import 'package:my_bloc/Day6/bloc/image_picker_bloc.dart';
import 'package:my_bloc/Day7/bloc/todo_bloc.dart';
import 'package:my_bloc/Day7/view/todo_screen.dart';
import 'package:my_bloc/Day8/post/View/post_Screen.dart';
import 'package:my_bloc/Day8/post_bloc/post_bloc.dart';
import 'package:my_bloc/project_Day/bloc/crypto_bloc.dart';
import 'package:my_bloc/project_Day/view/crypto_screen.dart';
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
        BlocProvider(create: (context) => TodoBloc()),
        BlocProvider(create: (context) => PostBloc()),
        BlocProvider(create: (context) => CryptoBloc()),
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CryptoScreen(),
      ),
    );
  }
}
