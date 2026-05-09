// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:my_bloc/Day6/bloc/image_picker_bloc.dart';
// import 'package:my_bloc/Day6/bloc/image_picker_event.dart';
// import 'package:my_bloc/Day6/bloc/image_picker_states.dart';

// class ImagePickerScreen extends StatefulWidget {
//   const ImagePickerScreen({super.key});

//   @override
//   State<ImagePickerScreen> createState() => _ImagePickerScreenState();
// }

// class _ImagePickerScreenState extends State<ImagePickerScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Image Picker',
//           style: TextStyle(
//             fontSize: 18,
//             fontStyle: FontStyle.italic,
//             fontWeight: FontWeight.normal,
//           ),
//         ),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           BlocBuilder<ImagePickerBloc, ImagePickerStates>(
//             builder: (context, states) {
//               if (states.file == null) {
//                 return InkWell(
//                   onTap: () {
//                     context.read<ImagePickerBloc>().add(CamerCapture());
//                   },
//                   child: CircleAvatar(child: Icon(Icons.camera)),
//                 );
//               } else {
//                 return Image.file(File(states.file!.path.toString()));
//               }
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bloc/Day6/bloc/image_picker_bloc.dart';
import 'package:my_bloc/Day6/bloc/image_picker_event.dart';
import 'package:my_bloc/Day6/bloc/image_picker_states.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade500,
        title: Center(
          child: Text(
            'Image Picker',
            style: TextStyle(
              fontSize: 18,
              color: Colors.deepPurple.shade100,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        centerTitle: true,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<ImagePickerBloc, ImagePickerStates>(
              builder: (context, states) {
                return Column(
                  children: [
                    // IMAGE SHOW
                    states.file == null
                        ? CircleAvatar(
                            radius: 100,
                            child: Icon(Icons.person, size: 50),
                          )
                        : CircleAvatar(
                            radius: 100,
                            backgroundImage: FileImage(File(states.file!.path)),
                          ),

                    SizedBox(height: 30),

                    // CAMERA BUTTON
                    ElevatedButton.icon(
                      onPressed: () {
                        context.read<ImagePickerBloc>().add(CamerCapture());
                      },
                      label: Text('Camera'),
                      icon: Icon(Icons.camera_alt),
                    ),

                    SizedBox(height: 15),

                    // GALLERY BUTTON
                    ElevatedButton.icon(
                      onPressed: () {
                        context.read<ImagePickerBloc>().add(
                          GalleryImagePicker(),
                        );
                      },
                      label: Text('Gallery'),
                      icon: Icon(Icons.photo),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
