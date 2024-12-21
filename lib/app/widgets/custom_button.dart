import 'package:flutter/material.dart';
import 'package:sophie/app/shared/theme.dart';

enum ButtonType { primary, secondary, danger, white }

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.title = "Button",
    this.titleSize = 18.0,
    this.onPressed,
    this.type = ButtonType.primary,
    this.isLoading = false,
    this.isDisabled = false,
    this.width = double.infinity,
    this.height = 54.0,
    this.prefixIcon,
    this.suffixIcon,
  });

  final Function()? onPressed;
  final String title;
  final double? titleSize;
  final ButtonType type;
  final bool isLoading;
  final bool isDisabled;
  final double? width;
  final double? height;
  final Icon? prefixIcon;
  final Icon? suffixIcon;

  @override
  Widget build(BuildContext context) {
    bool disabled = isLoading || isDisabled;

    Color backgroundColor = primary;
    Color textColor = white;

    switch (type) {
      case ButtonType.primary:
        backgroundColor = primary;
        textColor = white;
      case ButtonType.secondary:
        backgroundColor = secondary;
        textColor = primary;
      case ButtonType.danger:
        backgroundColor = lighRed;
        textColor = darkred;
      case ButtonType.white:
        backgroundColor = white;
        textColor = primary;
      default:
        backgroundColor = primary;
        textColor = white;
    }

    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor.withOpacity(disabled ? 0.8 : 1.0),
          shadowColor: Colors.transparent,
          elevation: 0.0,
        ),
        onPressed: disabled ? () {} : onPressed,
        child: isLoading
            ? SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  color: textColor,
                  strokeWidth: 3.0,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (prefixIcon != null)
                    Row(
                      children: [
                        prefixIcon!,
                        const SizedBox(
                          width: 6.0,
                        ),
                      ],
                    ),
                  Text(
                    title,
                    style: regular.copyWith(
                      fontSize: titleSize,
                      color: textColor,
                    ),
                  ),
                  if (suffixIcon != null)
                    Row(
                      children: [
                        const SizedBox(
                          width: 6.0,
                        ),
                        suffixIcon!,
                      ],
                    )
                ],
              ),
      ),
    );
  }
}
