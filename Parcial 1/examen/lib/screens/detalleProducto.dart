import 'dart:convert';

import 'package:examen/widgets/BotonProducto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Detalleproducto extends StatelessWidget {

  final int id;

  const Detalleproducto({
    super.key,
    required this.id,
  });

  Future<Map<String, dynamic>> loadProducto() async {

    final String response = await rootBundle.loadString('lib/api/dataProducts.json');

    final List<dynamic> productos = jsonDecode(response);

    final producto = productos.firstWhere((producto) => producto["id"] == id,);

    return producto;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(title: const Text("Detalle del producto"),),

      body: FutureBuilder<Map<String, dynamic>>(

        future: loadProducto(),

        builder: (context, snapshot) {

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(),);
          }

          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}",),);
          }

          final producto = snapshot.data!;

          return SingleChildScrollView(

            padding: const EdgeInsets.all(20),

            child: Column(

              children: [

                Text(
                  producto["title"],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),

                const SizedBox(height: 25),

                Image.network(
                  producto["image"],
                  width: 220,
                  height: 220,
                  fit: BoxFit.contain,
                ),

                const SizedBox(height: 25),

                Text(
                  producto["description"],
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 25),

                Text(
                  "Precio: \$${producto["price"]}",
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightBlue,
                  ),
                ),

                const SizedBox(height: 25),

                Row(

                  children: [

                    Expanded(
                      child: BotonProducto(
                        icono: Icons.add_shopping_cart,
                        texto: "Agregar",
                        mensaje: "Producto agregado al carrito",
                      ),
                    ),

                    const SizedBox(width: 15),

                    Expanded(
                      child: BotonProducto(
                        icono: Icons.delete,
                        texto: "Eliminar",
                        mensaje: "Producto eliminado",
                      ),
                    ),

                  ],
                ),

              ],
            ),
          );
        },
      ),
    );
  }
}