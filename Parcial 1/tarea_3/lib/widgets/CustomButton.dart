import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  final String texto;
  final bool readOnly;

  const CustomButton({super.key,required this.texto,this.readOnly = false,});

  @override
  Widget build(BuildContext context) {

    return ElevatedButton(
      onPressed: readOnly
          ? null
          : () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Presionaste $texto"),
                  backgroundColor: Colors.green,
                  duration: const Duration(seconds: 3),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },

      child: Text(texto),
    );
  }
}