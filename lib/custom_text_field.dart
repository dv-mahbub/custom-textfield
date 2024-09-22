import 'package:custom_textfield/colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? hint;
  final double? height;
  final double? width;
  final String? label;
  final Color? backgroundColor;
  final String? Function(String? value)? validator;
  final Widget? suffix;
  final Widget? prefix;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final bool enabled;
  final int? maxLine;
  final int? minLine;
  final FocusNode? focusNode;
  final void Function(String value)? onChange;

  const CustomTextField({
    super.key,
    required this.controller,
    this.width,
    this.hint,
    this.label,
    this.height,
    this.backgroundColor,
    this.validator,
    this.suffix,
    this.prefix,
    this.obscureText,
    this.keyboardType,
    this.enabled = true,
    this.maxLine,
    this.minLine,
    this.focusNode,
    this.onChange,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  double borrderRadius = 8.0;
  bool showText = false;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: widget.width ??
          (screenWidth < 600 ? screenWidth * .9 : screenWidth * .5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(borrderRadius),
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
        controller: widget.controller,
        obscureText: widget.obscureText! && !showText,
        maxLines: widget.maxLine,
        minLines: widget.minLine,
        focusNode: widget.focusNode,
        onChanged: widget.onChange,
        decoration: InputDecoration(
          enabled: widget.enabled,
          suffix: widget.suffix,
          prefix: widget.prefix,
          suffixIcon: widget.obscureText!
              ? IconButton(
                  icon:
                      Icon(showText ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      showText = !showText;
                    });
                  },
                )
              : null,
          fillColor: widget.backgroundColor ?? Colors.white,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borrderRadius),
            borderSide: BorderSide(
                color: AppColors.primaryColor), // Default border color
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borrderRadius),
            borderSide: BorderSide(
                color: Colors.green, width: 1.0), // Focused border color
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borrderRadius),
            borderSide:
                BorderSide(color: Colors.red, width: 1.0), // Error border color
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borrderRadius),
            borderSide: BorderSide(
                color: Colors.redAccent, width: 1.0), // Focused error border
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          hintText: widget.hint ?? 'Enter text',
          label: widget.label != null ? Text(widget.label!) : null,
        ),
        validator: widget.validator,
      ),
    );
  }
}
