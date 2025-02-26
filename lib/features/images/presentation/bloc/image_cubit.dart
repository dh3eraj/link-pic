import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart' show head;

part 'image_state.dart';
part 'image_cubit.freezed.dart';

class ImageCubit extends Cubit<ImageState> {
  ImageCubit() : super(ImageState.initial());

  /// Checks if the [URL] is valid or not, emits the corresponding state.
  Future<void> validateImageUrl(String url) async {
    try {
      emit(ImageState.validatingImageUrl());
      final response = await head(Uri.parse(url));
      await Future.delayed(Duration(milliseconds:500 ));
      if (response.statusCode == 200) {
        emit(ImageState.validatedImageUrl(true, url));
      } else {
        emit(ImageState.validatedImageUrl(false, url));
      }
    } catch (_) {
      emit(ImageState.validateImageUrlError("Something went wrong!"));
    }
  }
}
