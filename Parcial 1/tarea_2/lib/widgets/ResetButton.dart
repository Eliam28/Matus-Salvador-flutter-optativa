import 'package:flutter/material.dart';

class ResetButton extends StatelessWidget {

  final TextEditingController numero1Controller;
  final TextEditingController numero2Controller;
  final VoidCallback onReset;

  const ResetButton({
    super.key,
    required this.numero1Controller,
    required this.numero2Controller,
    required this.onReset,
  });


  void resetear() {
    numero1Controller.clear();
    numero2Controller.clear();
    onReset();
  }


  @override
  Widget build(BuildContext context) {

    return ElevatedButton.icon(
      onPressed: resetear,
      icon: const Icon(Icons.refresh,),
      label: const Text("Resetear",),

      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurpleAccent,
        foregroundColor: Colors.white,
        minimumSize: const Size(200,50,),
      ),
    );
  }
}