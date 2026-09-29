import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Detallecarrito extends StatelessWidget {
  final int idCarrito;

  const Detallecarrito({
    super.key,
    required this.idCarrito,
  });

  Future<Map<String, dynamic>> loadCarrito() async {
    final String response = await rootBundle.loadString('lib/api/dataCarrito.json');

    final List<dynamic> carritos = jsonDecode(response);

    final carrito = carritos.firstWhere((carrito) => carrito["id"] == idCarrito,);

    return carrito;
  }

  Future<Map<String, dynamic>> loadUsuario(int userId) async {
    final String response = await rootBundle.loadString('lib/api/dataUser.json');

    final List<dynamic> usuarios = jsonDecode(response);

    final usuario = usuarios.firstWhere((usuario) => usuario["id"] == userId,);

    return usuario;
  }

  Future<List<dynamic>> loadProductos() async {
    final String response = await rootBundle.loadString('lib/api/dataProducts.json');

    final List<dynamic> productos = jsonDecode(response);

    return productos;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(title: Text("Carrito #$idCarrito"),),

      body: FutureBuilder<Map<String, dynamic>>(
        future: loadCarrito(),

        builder: (context, snapshotCarrito) {
          if (snapshotCarrito.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(),);
          }

          if (snapshotCarrito.hasError) {
            return Center(child: Text("Error: ${snapshotCarrito.error}",),);
          }

          final carrito = snapshotCarrito.data!;

          return FutureBuilder<Map<String, dynamic>>(
            future: loadUsuario(carrito["userId"]),

            builder: (context, snapshotUsuario) {
              if (snapshotUsuario.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator(),);
              }

              if (snapshotUsuario.hasError) {
                return Center(child: Text("Error: ${snapshotUsuario.error}",),);
              }

              final usuario = snapshotUsuario.data!;

              return SingleChildScrollView(
                padding: const EdgeInsets.all(15),

                child: Column(
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

                    Text("Nombre: ${usuario["name"]["firstname"]} ${usuario["name"]["lastname"]}",),

                    const SizedBox(height: 5),

                    Text("Correo: ${usuario["email"]}",),

                    const SizedBox(height: 25),

                    const Text(
                      "Productos",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    FutureBuilder<List<dynamic>>(
                      future: loadProductos(),

                      builder: (context, snapshotProductos) {
                        if (snapshotProductos.connectionState ==ConnectionState.waiting) {
                          return const Center(child: CircularProgressIndicator(),);
                        }

                        if (snapshotProductos.hasError) {
                          return Center(child: Text("Error: ${snapshotProductos.error}",),);
                        }

                        final productos = snapshotProductos.data ?? [];
                        final productosCarrito = carrito["products"];

                        double total = 0;

                        for (var productoCarrito in productosCarrito) {
                          final producto = productos.firstWhere(
                            (producto) => producto["id"] ==productoCarrito["productId"],
                          );

                          double precio = producto["price"].toDouble();

                          int cantidad =productoCarrito["quantity"];

                          total += precio * cantidad;
                        }

                        return Column(
                          children: [
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),

                              itemCount: productosCarrito.length,

                              itemBuilder: (context, index) {
                                final productoCarrito = productosCarrito[index];

                                final producto = productos.firstWhere(
                                  (producto) => producto["id"] == productoCarrito["productId"],
                                );

                                int cantidad = productoCarrito["quantity"];

                                double precio = producto["price"].toDouble();

                                double subtotal = precio * cantidad;

                                return ListTile(
                                  leading: Image.network(
                                    producto["image"],
                                    width: 60,
                                    height: 60,
                                    fit: BoxFit.contain,
                                  ),

                                  title: Text(producto["title"],),

                                  subtitle: Text("\$${precio.toStringAsFixed(2)} x $cantidad",),

                                  trailing: Text("\$${subtotal.toStringAsFixed(2)}",),
                                );
                              },
                            ),

                            const SizedBox(height: 20),

                            Align(
                              alignment: Alignment.centerRight,

                              child: Text(
                                "Total: \$${total.toStringAsFixed(2)}",
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}