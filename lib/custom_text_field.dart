import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hint;
  final double? height;
  final double? width;
  final String? label;
  final Color? backgroundColor;
  final String? Function(String? value)? validator;

  const CustomTextField({
    super.key,
    required this.controller,
    this.width,
    this.hint,
    this.label,
    this.height,
    this.backgroundColor,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: width ?? (screenWidth < 600 ? screenWidth * .9 : screenWidth * .5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            fillColor: backgroundColor ?? Colors.white,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            hintText: hint ?? 'Enter text',
            label: label != null ? Text(label!) : null,
          ),
          validator: validator),
    );
  }
}
