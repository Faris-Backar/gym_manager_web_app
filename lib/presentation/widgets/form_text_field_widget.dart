import 'package:flutter/material.dart';

import 'package:gym_manager_web_app/core/resources/style_resources.dart';

class FormTextFieldWidget extends StatefulWidget {
  final String? hintText;
  final String? Function(String?)? validatorFunction;
  final bool isPasswordField;
  final Widget? suffixWidget;
  final TextEditingController controller;
  final bool? isPasswordVisible;
  final Color? borderColor;
  final Color? textColor;
  final TextInputType? textInputType;
  const FormTextFieldWidget({
    Key? key,
    this.hintText,
    this.validatorFunction,
    required this.isPasswordField,
    this.suffixWidget,
    required this.controller,
    this.isPasswordVisible,
    this.borderColor,
    this.textColor,
    this.textInputType,
  }) : super(key: key);

  @override
  State<FormTextFieldWidget> createState() => _FormTextFieldWidgetState();
}

class _FormTextFieldWidgetState extends State<FormTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.isPasswordVisible ?? false,
      controller: widget.controller,
      style: TextStyle(color: widget.textColor ?? Colors.black),
      keyboardType: widget.textInputType,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: widget.borderColor ?? Colors.black),
          borderRadius: BorderRadius.circular(5),
        ),
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          color: StyleResorces.shadedText,
        ),
        suffixIcon: widget.suffixWidget,
      ),
      validator: widget.validatorFunction,
    );
  }
}
