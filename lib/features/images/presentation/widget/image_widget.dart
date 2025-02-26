import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:link_pic/config/theme/app_colors.dart';
import 'package:link_pic/features/images/presentation/bloc/image_cubit.dart';

class ImageWidget extends StatefulWidget {
  final String imageUrl;
  final void Function()? onDoubleTap;
  const ImageWidget({super.key, required this.imageUrl, this.onDoubleTap});
  @override
  State<ImageWidget> createState() => _ImageWidgetStaate();
}

class _ImageWidgetStaate extends State<ImageWidget> {
  late final ImageCubit _cubit;
  @override
  void initState() {
    _cubit = context.read<ImageCubit>();
    super.initState();
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _cubit.validateImageUrl(widget.imageUrl);

    return BlocBuilder<ImageCubit, ImageState>(
      builder: (context, state) {
        return state.maybeWhen(
          validatingImageUrl: () {
            return CircularProgressIndicator.adaptive();
          },
          validatedImageUrl: (valid, url) {
            if (valid) {
              if (kIsWeb) {
                return GestureDetector(
                  onDoubleTap: widget.onDoubleTap,
                  child: HtmlWidget('''
                      <img  id="imageElement" src="$url" alt="$url" style="width:100%; height:auto">
                    '''),
                );
              } else {
                return Image.network(
                  url,

                  width: double.maxFinite,
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.fitWidth,
                );
              }
            } else {
              return Text(
                "Please enter a valid image URL.",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.information500,
                ),
                textAlign: TextAlign.center,
              );
            }
          },
          validateImageUrlError: (error) {
            return Text(
              error,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.error500,
              ),    
              textAlign: TextAlign.center,
            );
          },
          orElse: () => Container(),
        );
      },
    );
  }
}
