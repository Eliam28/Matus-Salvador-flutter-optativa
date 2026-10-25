import 'package:examen/cart_by_id/CartByIdScreen.dart';
import 'package:examen/cart_by_id/CartByIdService.dart';

import 'package:examen/carts/Cart.dart';
import 'package:examen/carts/CartsService.dart';

import 'package:examen/product_by_id/ProductByIdService.dart';

import 'package:examen/user_by_id/UserByIdService.dart';

import 'package:flutter/material.dart';

class CartsScreen extends StatelessWidget {
  final CartsService cartsService;
  final CartByIdService cartByIdService;
  final UserByIdService userByIdService;
  final ProductByIdService productByIdService;

  const CartsScreen({
    super.key,
    required this.cartsService,
    required this.cartByIdService,
    required this.userByIdService,
    required this.productByIdService,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Carritos de compra"),
      ),

      body: FutureBuilder<List<Cart>>(
        future: cartsService.getCarts(),

        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                "Error: ${snapshot.error}",
              ),
            );
          }

          final carts = snapshot.data ?? [];

          return ListView.builder(
            padding: const EdgeInsets.all(5),
            itemCount: carts.length,

            itemBuilder: (context, index) {
              final cart = carts[index];

              return ListTile(
                minTileHeight: 80,

                leading: const Icon(
                  Icons.shopping_cart,
                  size: 45,
                ),

                title: Text(
                  "Carrito - ${cart.id}",
                ),

                subtitle: const Text(
                  "Click para ver detalles",
                ),

                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartByIdScreen(
                        idCart: cart.id,
                        cartByIdService: cartByIdService,
                        userByIdService: userByIdService,
                        productByIdService: productByIdService,
                      ),
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