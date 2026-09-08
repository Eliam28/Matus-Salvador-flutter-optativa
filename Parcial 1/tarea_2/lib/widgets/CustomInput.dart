import 'package:flutter/material.dart';

class Custominput extends StatefulWidget{
  final TextEditingController input;
  final String labelText;
  final bool readOnly;
  final FocusNode? focusNode;

  const Custominput({super.key, required this.input, this.labelText = "", this.readOnly = false, this.focusNode});

  @override
  State<Custominput> createState() => _Custominput();
}

class _Custominput extends State<Custominput>{

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: widget.readOnly,
      controller: widget.input,
      focusNode: widget.focusNode,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: widget.labelText,
      ),
    );
  }
}