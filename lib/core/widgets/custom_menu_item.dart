import 'package:flutter/material.dart';
import 'package:link_pic/config/theme/app_colors.dart';

/// Action item for [CustomContextMenu]
class CustomMenuItem extends StatefulWidget {
  final String title;
  final IconData icon;

  final void Function()? onTap;
  const CustomMenuItem({
    super.key,
    this.onTap,
    required this.title,
    required this.icon,
  });
  @override
  State<CustomMenuItem> createState() => _CustomMenuItemState();
}

class _CustomMenuItemState extends State<CustomMenuItem> {
  late bool _isHovering;

  @override
  void initState() {
    _isHovering = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          widget.onTap != null
              ? () {
                Navigator.pop(context);
                widget.onTap!();
              }
              : null,
      child: MouseRegion(
        onEnter: (event) {
          setState(() {
            _isHovering = true;
          });
        },
        onExit: (event) {
          setState(() {
            _isHovering = false;
          });
        },
        onHover: (event) {
          setState(() {
            _isHovering = true;
          });
        },
        child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color:
                _isHovering ? AppColors.neutralDay000 : AppColors.neutralDay900,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color:
                      _isHovering == false
                          ? AppColors.neutralDay000
                          : AppColors.neutralDay900,
                ),
              ),
              SizedBox(width: 8),
              Icon(
                widget.icon,
                color:
                    _isHovering == false
                        ? AppColors.neutralDay000
                        : AppColors.neutralDay900,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
