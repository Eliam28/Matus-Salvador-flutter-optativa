import 'package:flutter/material.dart';

class BotonProducto extends StatelessWidget {

  final IconData icono;
  final String texto;
  final String mensaje;

  const BotonProducto({
    super.key,
    required this.icono,
    required this.texto,
    required this.mensaje,
  });

  @override
  Widget build(BuildContext context) {

    return ElevatedButton.icon(

      onPressed: () {

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(mensaje),
            duration: const Duration(seconds: 2),
            behavior: SnackBarBehavior.floating,
          ),
        );

      },

      icon: Icon(icono),

      label: Text(texto),

    );
  }
}