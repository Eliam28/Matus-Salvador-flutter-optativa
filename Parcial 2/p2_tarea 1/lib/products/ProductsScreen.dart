import 'package:examen/Products/Product.dart';
import 'package:examen/Products/ProductsService.dart';
import 'package:examen/product_by_id/ProductByIdScreen.dart';
import 'package:examen/product_by_id/ProductByIdService.dart';
import 'package:flutter/material.dart';

class ProductsScreen extends StatelessWidget {
  final ProductsService productsService;
  final ProductByIdService productByIdService;

  const ProductsScreen({
    super.key,
    required this.productsService,
    required this.productByIdService,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Productos"),
      ),

      body: FutureBuilder<List<Product>>(
        future: productsService.getProducts(),

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

          final products = snapshot.data ?? [];

          return ListView.builder(
            padding: const EdgeInsets.all(5),
            itemCount: products.length,

            itemBuilder: (context, index) {
              final product = products[index];

              return ListTile(
                minTileHeight: 100,

                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductByIdScreen(
                        id: product.id,
                        productByIdService: productByIdService,
                      ),
                    ),
                  );
                },

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
                  '${product.category} - \$${product.price}',
                ),
              );
            },
          );
        },
      ),
    );
  }
}