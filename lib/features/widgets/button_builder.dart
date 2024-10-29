
import 'package:examen_flutter/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


enum ButtonType { outlined, toggle, iconArrow, flat, text, rounded, icon}

@immutable
class ButtonBuilder extends StatelessWidget {
  final VoidCallback? onPressed;
  final ButtonType buttonType;
  Color? foregroundColor;
  final EdgeInsetsGeometry? padding;
  final String label;
  final bool? isActive;
  Color? backgroundColor;
  final double fontSize;
  final Color _baseColor = AppColors.primaryColor;
  final AlignmentGeometry? alignment;
  final FontWeight? fontWeight;
  final double borderRadius;
  final Widget? icon;

  ButtonBuilder({
    super.key,
    this.onPressed,
    required this.buttonType,
    this.foregroundColor = AppColors.white,
    this.padding = const EdgeInsets.symmetric(vertical: 22.0),
    required this.label,
    this.isActive,
    this.backgroundColor = AppColors.primaryColor,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w500,
    this.alignment,
    this.borderRadius = 16.0,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    createStyle();

    OutlinedBorder? shape = buttonType == ButtonType.rounded ? const StadiumBorder() : RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(borderRadius),
    );

    return buttonType == ButtonType.outlined || buttonType == ButtonType.toggle
        ? OutlinedButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
          textStyle: TextStyle(fontSize: context.sp(14), fontWeight: fontWeight, color: foregroundColor),
          foregroundColor: foregroundColor,
          side: BorderSide(
              width: 1,
              color: buttonType == ButtonType.outlined ? AppColors.lightGrey : _baseColor),
          padding: padding,
          shape: shape),
      child: _buildLabel(context),
    ) : buttonType == ButtonType.icon ? TextButton.icon(
        onPressed: onPressed,
        style: TextButton.styleFrom(
            textStyle: TextStyle(fontSize: context.sp(14), fontWeight: fontWeight, ),
            backgroundColor: backgroundColor,
            foregroundColor: foregroundColor,
            padding: padding,
            shape: shape,
            alignment: alignment
        ),
        icon: icon!,
        label: _buildLabel(context))
        : TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          textStyle: TextStyle(fontSize: context.sp(14), fontWeight: fontWeight, ),
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          padding: padding,
          shape: shape,
          alignment: alignment,
        ),
        child: buttonType == ButtonType.iconArrow
            ? _buildLabelWithArrow(context)
            : _buildLabel(context));
  }

  Widget _buildLabelWithArrow(BuildContext context) {
    return Row(
      children: [
        _buildLabel(context),
        const Spacer(),
        const Icon(
          Icons.arrow_forward_ios_rounded,
          size: 17.0,
        )
      ],
    );
  }

  Widget _buildLabel(BuildContext context) {
    return Text(
      label,
      style: TextStyle(fontSize: context.sp(fontSize), fontWeight: fontWeight),
    );
  }

  void createStyle() {
    switch (buttonType) {
      case ButtonType.flat:
        backgroundColor = onPressed != null ? backgroundColor : const Color.fromRGBO(211, 216, 226, 1);
        break;
      case ButtonType.text:
        foregroundColor = _baseColor;
        break;
      case ButtonType.iconArrow:
        foregroundColor = _baseColor;
        break;
      case ButtonType.outlined:
      //foregroundColor = _baseColor;
        break;
      case ButtonType.toggle:
        foregroundColor = isActive! ? Colors.white : _baseColor;
        backgroundColor = isActive! ? _baseColor : Colors.white;
        break;
      case ButtonType.rounded:
        backgroundColor = backgroundColor;
        break;
      case ButtonType.icon:
        backgroundColor = onPressed != null ? backgroundColor : const Color.fromRGBO(211, 216, 226, 1);
        break;
    }
  }
}