import 'package:flutter/material.dart';

class ProductosCarrito extends StatelessWidget {

  final List<dynamic> productos;
  final List<dynamic> productosCarrito;

  const ProductosCarrito({
    super.key,
    required this.productos,
    required this.productosCarrito,
  });

  @override
  Widget build(BuildContext context) {

    double total = 0;

    for (int i = 0; i < productos.length; i++) {

      double precio = productos[i]["price"].toDouble();
      int cantidad = productosCarrito[i]["quantity"];

      total += precio * cantidad;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [

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
          physics: const NeverScrollableScrollPhysics(),

          itemCount: productos.length,

          itemBuilder: (context, index) {

            final producto = productos[index];
            final productoCarrito = productosCarrito[index];

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

              title: Text( producto["title"],),

              subtitle: Text("\$${precio.toStringAsFixed(2)} x $cantidad",),

              trailing: Text( "\$${subtotal.toStringAsFixed(2)}",),

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
  }
}