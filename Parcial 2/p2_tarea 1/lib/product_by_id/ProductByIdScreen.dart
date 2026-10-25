import 'package:examen/Products/Product.dart';
import 'package:examen/product_by_id/ProductByIdService.dart';
import 'package:examen/widgets/BotonProducto.dart';
import 'package:flutter/material.dart';

class ProductByIdScreen extends StatelessWidget {
  final int id;
  final ProductByIdService productByIdService;

  const ProductByIdScreen({
    super.key,
    required this.id,
    required this.productByIdService,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalle del producto"),
      ),

      body: FutureBuilder<Product>(
        future: productByIdService.getProductById(id),

        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          }

          final product = snapshot.data!;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),

            child: Column(
              children: [
                Text(
                  product.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 22,
                  ),
                ),

                const SizedBox(height: 25),

                Image.network(
                  product.image,
                  width: 220,
                  height: 220,
                  fit: BoxFit.contain,
                ),

                const SizedBox(height: 25),

                Text(
                  product.description,
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 25),

                Text(
                  "Precio: \$${product.price}",
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