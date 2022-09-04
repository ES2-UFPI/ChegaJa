import 'package:flutter/material.dart';

class FormFieldWidget extends StatelessWidget {
  const FormFieldWidget({
    Key? key,
    required this.type,
    required this.label,
    required this.controller,
    this.isLast = false,
    this.validator,
    this.maxLengthText,
  }) : super(key: key);

  final TextInputType type;
  final String label;
  final TextEditingController controller;
  final bool isLast;
  final String? Function(String?)? validator;
  final int? maxLengthText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        controller: controller,
        validator: validator ??
            (value) {
              return (value?.isEmpty ?? true)
                  ? '$label não pode ficar vazio'
                  : null;
            },
        keyboardType: type,
        maxLength: maxLengthText,
        textInputAction: isLast ? TextInputAction.done : TextInputAction.next,
        decoration: InputDecoration(
          counterText: '',
          labelText: label,
          filled: true,
          fillColor: const Color(0xFFF5F5F5),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
