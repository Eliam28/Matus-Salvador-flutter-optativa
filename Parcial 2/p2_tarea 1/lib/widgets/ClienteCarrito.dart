import 'package:flutter/material.dart';

class ClienteCarrito extends StatelessWidget {

  final dynamic usuario;

  const ClienteCarrito({
    super.key,
    required this.usuario,
  });

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [

        const Text(
          "Cliente",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 8),

        Text( "Nombre: ${usuario["name"]["firstname"]} ${usuario["name"]["lastname"]}",),

        const SizedBox(height: 5),

        Text("Correo: ${usuario["email"]}",),

      ],
    );
  }
}