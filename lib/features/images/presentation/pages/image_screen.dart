import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:link_pic/config/routes/di/dependency_injection.dart';
import 'package:link_pic/config/theme/app_colors.dart';
import 'package:link_pic/core/widgets/custom_context_menu.dart';
import 'package:link_pic/core/widgets/custom_menu_item.dart';
import 'package:link_pic/core/widgets/custom_text_field.dart';
import 'package:link_pic/features/images/presentation/bloc/image_cubit.dart';
import 'package:link_pic/features/images/presentation/widget/image_widget.dart';
import 'package:link_pic/core/helpers/js_helper.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({super.key});

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  late final TextEditingController _controller;
  late String _imageUrl;
  late final JsInteropService _jsUtils;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    // Initial image URL
    _imageUrl = "https://avatars.githubusercontent.com/u/14101776?s=1080&v=4";
    _jsUtils = JsInteropService();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: AppColors.bgDay,
        appBar: AppBar(leading: Container()),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.modalDay,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: BlocProvider(
                      create: (context) => sl<ImageCubit>(),
                      child: ImageWidget(
                        imageUrl: _imageUrl,
                        onDoubleTap: () {
                          _jsUtils.callToggleFullscreen();
                        },
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      controller: _controller,
                      hintText: 'enter image URL',
                      onFieldSubmitted: (value) {
                        setState(() {
                          _imageUrl = _controller.text.trim();
                        });
                      },
                      suffixIcon: IconButton(
                        onPressed: () {
                          FocusManager.instance.primaryFocus!.unfocus();
                          setState(() {
                            _imageUrl = _controller.text.trim();
                          });
                        },
                        icon: Icon(Icons.arrow_forward),
                      ),
                      textInputAction: TextInputAction.done,
                    ),
                  ),
                ],
              ),
              if(kIsWeb)
              const SizedBox(height: 64),
            ],
          ),
        ),

        floatingActionButton: kIsWeb ? CustomContextMenu(
          actions: [
            CustomMenuItem(
              title: 'Enter fullscreen',
              icon: Icons.fullscreen,
              onTap: () {
                _jsUtils.callEnterFullscreen();
              },
            ),
            CustomMenuItem(
              title: 'Exit fullscreen',
              icon: Icons.fullscreen_exit,
              onTap: () {
                _jsUtils.callExitFullscreen();
              },
            ),
          ],
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: AppColors.modalDay,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.add),
          ),
        ) : null,
      ),
    );
  }
}
