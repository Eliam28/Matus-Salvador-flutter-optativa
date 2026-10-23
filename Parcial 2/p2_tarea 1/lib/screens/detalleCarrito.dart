import 'package:examen/api/dataCarritos.dart';
import 'package:examen/api/dataProducts.dart';
import 'package:examen/api/dataUsers.dart';
import 'package:examen/widgets/ClienteCarrito.dart';
import 'package:examen/widgets/ProductosCarrito.dart';
import 'package:flutter/material.dart';

class Detallecarrito extends StatelessWidget {

  final int idCarrito;

  const Detallecarrito({
    super.key,
    required this.idCarrito,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(title: Text("Carrito #$idCarrito"),),

      body: FutureBuilder<dynamic>(
        future: fetchCarritoById(idCarrito.toString(),),

        builder: (context, snapshotCarrito) {

          if (snapshotCarrito.connectionState == ConnectionState.waiting) {
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

              return FutureBuilder<List<dynamic>>(
                future: fetchProductosCarrito(productosCarrito),

                builder: (context, snapshotProductos) {

                  if (snapshotProductos.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator(),);
                  }

                  if (snapshotProductos.hasError) {
                    return Center(child: Text("Error: ${snapshotProductos.error}",),);
                  }

                  final productos = snapshotProductos.data ?? [];

                  return SingleChildScrollView(
                    padding: const EdgeInsets.all(15),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [

                        ClienteCarrito(usuario: usuario,),

                        const SizedBox(height: 25),

                        ProductosCarrito(productos: productos,productosCarrito:productosCarrito,),

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