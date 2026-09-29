import 'package:examen/api/dataCarritos.dart';
import 'package:examen/api/dataProducts.dart';
import 'package:examen/api/dataUsers.dart';
import 'package:flutter/material.dart';

class Detallecarrito extends StatelessWidget {

  final int idCarrito;

  const Detallecarrito({
    super.key,
    required this.idCarrito,
  });

  Future<List<Map<String, dynamic>>> loadProductosCarrito(List<dynamic> productosCarrito,) async {

    List<Map<String, dynamic>> productos = [];

    for (var productoCarrito in productosCarrito) {

      final producto = await fetchProductById(productoCarrito["productId"].toString(),);

      productos.add(producto);
    }

    return productos;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(title: Text("Carrito #$idCarrito"),),

      body: FutureBuilder<dynamic>(
        future: fetchCarritoById(idCarrito.toString(),),

        builder: (context, snapshotCarrito) {

          if (snapshotCarrito.connectionState ==ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(),);
          }

          if (snapshotCarrito.hasError) {
            return Center(child: Text("Error: ${snapshotCarrito.error}",),);
          }

          final carrito = snapshotCarrito.data!;

          return FutureBuilder<dynamic>(
            future: fetchUserById(carrito["userId"].toString(),),

            builder: (context, snapshotUsuario) {

              if (snapshotUsuario.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator(),);
              }

              if (snapshotUsuario.hasError) {
                return Center(child: Text("Error: ${snapshotUsuario.error}",),);
              }

              final usuario = snapshotUsuario.data!;

              final List<dynamic> productosCarrito = carrito["products"];

              return FutureBuilder<List<Map<String, dynamic>>>(future: loadProductosCarrito(productosCarrito,),

                builder: (context, snapshotProductos) {

                  if (snapshotProductos.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator(),);
                  }

                  if (snapshotProductos.hasError) {
                    return Center(child: Text("Error: ${snapshotProductos.error}",),);
                  }

                  final productos = snapshotProductos.data ?? [];

                  double total = 0;

                  for (int i = 0; i < productos.length; i++) {
                    double precio = productos[i]["price"].toDouble();
                    int cantidad = productosCarrito[i]["quantity"];
                    total += precio * cantidad;
                  }

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

                        Text( "Nombre: ${usuario["name"]["firstname"]} ${usuario["name"]["lastname"]}",),

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

                        ListView.builder(
                          shrinkWrap: true,

                          physics:const NeverScrollableScrollPhysics(),

                          itemCount: productos.length,

                          itemBuilder: (context, index) {

                            final producto = productos[index];

                            final productoCarrito = productosCarrito[index];

                            int cantidad = productoCarrito["quantity"];

                            double precio = producto["price"].toDouble();

                            double subtotal =  precio * cantidad;

                            return ListTile(

                              leading: Image.network(
                                producto["image"],
                                width: 60,
                                height: 60,
                                fit: BoxFit.contain,
                              ),

                              title: Text( producto["title"],),

                              subtitle: Text( "\$${precio.toStringAsFixed(2)} x $cantidad",),

                              trailing: Text("\$${subtotal.toStringAsFixed(2)}",),
                            );
                          },
                        ),

                        const SizedBox(height: 20),

                        Align(
                          alignment:
                              Alignment.centerRight,

                          child: Text(
                            "Total: \$${total.toStringAsFixed(2)}",
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                      ],
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}