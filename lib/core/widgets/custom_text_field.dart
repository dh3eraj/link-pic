import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:link_pic/config/theme/app_colors.dart';
class CustomTextField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final TextStyle? style;
  final int? hintMaxLines;
  final TextStyle? hintStyle;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? initialValue;
  final int? maxLines;
  final List<TextInputFormatter>? inputFormatters;
  final bool obscureText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final void Function(String value)? onFieldSubmitted;
  final void Function(String value)? onChanged;
  final Color? cursorColor;
  final TextInputType? keyboardType;
  final int? maxLength;
  final bool readOnly;
  final void Function()? onTap;
  final String obscuringCharacter;
  final TextAlign textAlign;
  final EdgeInsetsGeometry? contentPadding;
  final InputDecoration? decoration;
  final Widget? Function(BuildContext,
      {required int currentLength,
      required bool isFocused,
      required int? maxLength})? buildCounter;
  const CustomTextField({
    super.key,
    this.hintText,
    this.hintMaxLines,
    this.hintStyle,
    this.prefixIcon,
    this.labelText,
    this.suffixIcon,
    this.obscureText = false,
    this.style,
    this.controller,
    this.focusNode,
    this.textInputAction,
    this.onFieldSubmitted,
    this.onChanged,
    this.cursorColor,
    this.keyboardType,
    this.maxLength,
    this.readOnly = false,
    this.buildCounter,
    this.textAlign = TextAlign.left,
    this.obscuringCharacter = '•',
    this.contentPadding,
    this.onTap,
    this.decoration,
    this.inputFormatters,
    this.initialValue,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (labelText != null)
              Container(
                height: 6,
              ),
            TextFormField(
              maxLines: maxLines,
              onTap: onTap,
              initialValue: initialValue,
              controller: controller,
              focusNode: focusNode,
              onChanged: onChanged,
              maxLength: maxLength,
              onFieldSubmitted: onFieldSubmitted,
              textInputAction: textInputAction,
              cursorColor: cursorColor ?? AppColors.neutralDay300,
              readOnly: readOnly,
              textAlign: textAlign,
              inputFormatters: inputFormatters,
              buildCounter: buildCounter ??
                  (
                    context, {
                    required int currentLength,
                    required bool isFocused,
                    int? maxLength,
                  }) {
                    return null;
                  },
              decoration: decoration ??
                  InputDecoration(
                    contentPadding: contentPadding ??
                        EdgeInsets.only(
                          left: 22,
                          top: 19,
                          bottom: 19,
                          right: 22,
                        ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        width: 1,
                        color: AppColors.neutralDay700,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        width: 1,
                        color: AppColors.neutralDay700,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        width: 1,
                        color: AppColors.neutralDay700,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        width: 1,
                        color: AppColors.neutralDay700,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        width: 1,
                        color: AppColors.neutralDay700,
                      ),
                    ),
                    filled: true,
                    fillColor: AppColors.neutralDay900,
                    prefixIcon: prefixIcon != null
                        ? SizedBox(
                            width: 26,
                            height: 26,
                            child: prefixIcon,
                          )
                        : null,
                    suffixIcon: suffixIcon != null
                        ? SizedBox(
                            height:26,
                            child: suffixIcon,
                          )
                        : null,
                    hintText: hintText,
                    hintMaxLines: hintMaxLines,
                    hintStyle: hintStyle ??
                        TextStyle(
                          fontSize: 14,
                          color: AppColors.neutralDay300,
                        ),
                  ),
              keyboardType: keyboardType,
              style: style ??
                  TextStyle(
                    fontSize: 14,
                    color: AppColors.neutralDay300,
                  ),
              obscureText: obscureText,
              obscuringCharacter: obscuringCharacter,
            ),
          ],
        ),
        if (labelText != null)
          Positioned(
            left: 
              16,
            child: Container(
              padding: EdgeInsets.only(left: 6, right: 6),
              decoration: BoxDecoration(
                color: AppColors.neutralDay800,
                borderRadius: BorderRadius.circular(
                  8,
                ),
              ),
              child: Text(
                labelText ?? "",
                style: TextStyle(
                  color: AppColors.neutralDay100,
                  backgroundColor: AppColors.neutralDay800,
                  fontSize: 12,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
