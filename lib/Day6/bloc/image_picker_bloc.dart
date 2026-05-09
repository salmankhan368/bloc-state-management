import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_bloc/Day6/bloc/image_picker_event.dart';
import 'package:my_bloc/Day6/bloc/image_picker_states.dart';
import 'package:my_bloc/utils/image_picker_utils.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerStates> {
  final ImagePickerUtils? imagePickerUtils;
  ImagePickerBloc({this.imagePickerUtils}) : super(ImagePickerStates()) {
    on<CamerCapture>(cameraCapture);
    on<GalleryImagePicker>(pickFromGallery);
  }
  void cameraCapture(
    CamerCapture event,
    Emitter<ImagePickerStates> emit,
  ) async {
    XFile? file = await imagePickerUtils!.cameraCapture();
    emit(state.copyWith(file: file));
  }

  void pickFromGallery(
    GalleryImagePicker event,
    Emitter<ImagePickerStates> emit,
  ) async {
    XFile? file = await imagePickerUtils!.galleryCapture();
    emit(state.copyWith(file: file));
  }
}
