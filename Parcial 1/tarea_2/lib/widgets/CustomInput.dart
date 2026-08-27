import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {

  final String label;
  final TextEditingController controller;

  const CustomInput({
    super.key,
    required this.label,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {

    return TextField(
      controller: controller,

      keyboardType: const TextInputType.numberWithOptions(
        decimal: true,
      ),

      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),

    );
  }
}