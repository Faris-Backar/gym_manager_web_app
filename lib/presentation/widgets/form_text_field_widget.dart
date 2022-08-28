import 'package:flutter/material.dart';

import 'package:gym_manager_web_app/core/resources/style_resources.dart';

class FormTextFieldWidget extends StatefulWidget {
  final String? hintText;
  final String? Function(String?)? validatorFunction;
  final bool isPasswordField;
  final Widget? suffixWidget;
  const FormTextFieldWidget({
    Key? key,
    this.hintText,
    this.validatorFunction,
    required this.isPasswordField,
    this.suffixWidget,
  }) : super(key: key);

  @override
  State<FormTextFieldWidget> createState() => _FormTextFieldWidgetState();
}

class _FormTextFieldWidgetState extends State<FormTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
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
