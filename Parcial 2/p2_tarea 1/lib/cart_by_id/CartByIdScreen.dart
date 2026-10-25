import 'package:examen/Products/Product.dart';
import 'package:examen/cart_by_id/CartByIdService.dart';
import 'package:examen/carts/Cart.dart';
import 'package:examen/product_by_id/ProductByIdService.dart';
import 'package:examen/user_by_id/User.dart';
import 'package:examen/user_by_id/UserByIdService.dart';
import 'package:examen/widgets/ClienteCarrito.dart';
import 'package:examen/widgets/ProductosCarrito.dart';
import 'package:flutter/material.dart';

class CartByIdScreen extends StatelessWidget {
  final int idCart;

  final CartByIdService cartByIdService;
  final UserByIdService userByIdService;
  final ProductByIdService productByIdService;

  const CartByIdScreen({
    super.key,
    required this.idCart,
    required this.cartByIdService,
    required this.userByIdService,
    required this.productByIdService,
  });

  Future<List<Product>> getProducts(
    List<CartProduct> cartProducts,
  ) async {
    final List<Product> products = [];

    for (final cartProduct in cartProducts) {
      final product = await productByIdService.getProductById(
        cartProduct.productId,
      );

      products.add(product);
    }

    return products;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carrito #$idCart"),
      ),

      body: FutureBuilder<Cart>(
        future: cartByIdService.getCartById(idCart),

        builder: (context, snapshotCart) {
          if (snapshotCart.connectionState ==
              ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshotCart.hasError) {
            return Center(
              child: Text(
                "Error: ${snapshotCart.error}",
              ),
            );
          }

          final cart = snapshotCart.data!;

          return FutureBuilder<User>(
            future: userByIdService.getUserById(
              cart.userId,
            ),

            builder: (context, snapshotUser) {
              if (snapshotUser.connectionState ==
                  ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (snapshotUser.hasError) {
                return Center(
                  child: Text(
                    "Error: ${snapshotUser.error}",
                  ),
                );
              }

              final user = snapshotUser.data!;

              return FutureBuilder<List<Product>>(
                future: getProducts(
                  cart.products,
                ),

                builder: (context, snapshotProducts) {
                  if (snapshotProducts.connectionState ==
                      ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (snapshotProducts.hasError) {
                    return Center(
                      child: Text(
                        "Error: ${snapshotProducts.error}",
                      ),
                    );
                  }

                  final products =
                      snapshotProducts.data ?? [];

                  return SingleChildScrollView(
                    padding: const EdgeInsets.all(15),

                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,

                      children: [
                        ClienteCarrito(
                          usuario: user,
                        ),

                        const SizedBox(height: 25),

                        ProductosCarrito(
                          productos: products,
                          productosCarrito:
                              cart.products,
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