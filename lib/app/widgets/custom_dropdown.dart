import 'package:flutter/material.dart';
import 'package:sophie/app/shared/theme.dart';

class CustomDropdown extends StatelessWidget {
  const CustomDropdown({
    super.key,
    required this.options,
    required this.label,
    required this.icon,
    this.controller,
  });

  final String label;
  final List<String> options;
  final TextEditingController? controller;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(top: 10.0, bottom: 6.0),
          child: Text(
            label,
            style: medium.copyWith(fontSize: 15),
          ),
        ),
        DropdownMenu<String>(
          controller: controller,
          expandedInsets: const EdgeInsets.all(0),
          trailingIcon: const Icon(Icons.keyboard_arrow_down_rounded),
          leadingIcon: Icon(icon),
          selectedTrailingIcon: const Icon(Icons.keyboard_arrow_up_rounded),
          inputDecorationTheme: InputDecorationTheme(
            contentPadding: const EdgeInsets.all(16.0),
            fillColor: white,
            filled: true,
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
          ),
          menuStyle: MenuStyle(
            backgroundColor: WidgetStatePropertyAll(Colors.grey.shade100),
            elevation: const WidgetStatePropertyAll(0.5),
          ),
          initialSelection: options.first,
          onSelected: (value) {
            if (controller != null) controller!.text = value ?? options.first;
          },
          dropdownMenuEntries: options.map((String value) {
            return DropdownMenuEntry(value: value, label: value);
          }).toList(),
        ),
      ],
    );
  }
}
