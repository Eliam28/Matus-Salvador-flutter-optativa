import 'package:examen/Products/Product.dart';
import 'package:examen/carts/Cart.dart';
import 'package:flutter/material.dart';

class ProductosCarrito extends StatelessWidget {
  final List<Product> productos;
  final List<CartProduct> productosCarrito;

  const ProductosCarrito({
    super.key,
    required this.productos,
    required this.productosCarrito,
  });

  @override
  Widget build(BuildContext context) {
    double total = 0;

    for (int i = 0; i < productos.length; i++) {
      final double precio = productos[i].price;
      final int cantidad = productosCarrito[i].quantity;

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
            final product = productos[index];
            final cartProduct = productosCarrito[index];

            final int cantidad = cartProduct.quantity;
            final double precio = product.price;
            final double subtotal = precio * cantidad;

            return ListTile(
              leading: Image.network(
                product.image,
                width: 60,
                height: 60,
                fit: BoxFit.contain,
              ),

              title: Text(
                product.title,
              ),

              subtitle: Text(
                "\$${precio.toStringAsFixed(2)} x $cantidad",
              ),

              trailing: Text(
                "\$${subtotal.toStringAsFixed(2)}",
              ),
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