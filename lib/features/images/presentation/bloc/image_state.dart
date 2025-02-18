part of 'image_cubit.dart';

@freezed
class ImageState with _$ImageState {

  const factory ImageState.initial() = _Initial;

  const factory ImageState.validatingImageUrl() = _ValidatingImageUrl;
  const factory ImageState.validatedImageUrl(bool valid,String url) = _ValidatedImageUrl;
  const factory ImageState.validateImageUrlError(String error) =
      _ValidateImageUrlError;
}
