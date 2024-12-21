import 'package:flutter/material.dart';
import 'package:sophie/app/shared/theme.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.label = "Label",
    this.labelColor = Colors.black,
    this.placeholder = "Input",
    this.icon,
    this.iconColor,
    this.controller,
    this.disabled = false,
    this.onPressed,
    this.validator,
  });

  final String label;
  final String? placeholder;
  final Color? labelColor;
  final IconData? icon;
  final Color? iconColor;
  final TextEditingController? controller;
  final bool disabled;
  final void Function()? onPressed;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(top: 10.0, bottom: 6.0),
          child: Text(
            label,
            style: medium.copyWith(
              fontSize: 18,
              color: labelColor,
            ),
          ),
        ),
        disabled && onPressed != null
            ? ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                child: Material(
                  color: white,
                  child: InkWell(
                    onTap: onPressed,
                    child: IgnorePointer(child: _buildTextField(filled: false)),
                  ),
                ),
              )
            : _buildTextField(filled: true),
      ],
    );
  }

  TextFormField _buildTextField({required bool filled}) {
    return TextFormField(
      readOnly: disabled,
      controller: controller,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: iconColor ?? black,
        ),
        hintText: placeholder,
        hintStyle: medium.copyWith(fontSize: 17, color: black),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFFCDCDCD), width: 1),
          borderRadius: BorderRadius.circular(12.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: primary, width: 1),
          borderRadius: BorderRadius.circular(12.0),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFFCDCDCD), width: 1),
          borderRadius: BorderRadius.circular(12.0),
        ),
        contentPadding: const EdgeInsets.all(20.0),
        fillColor: disabled ? Colors.grey[200] : white,
        filled: filled,
      ),
    );
  }
}
