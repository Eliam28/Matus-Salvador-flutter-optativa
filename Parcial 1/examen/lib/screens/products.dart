import 'dart:convert';

import 'package:examen/screens/detalleProducto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Products extends StatelessWidget {
  const Products({super.key});

  Future<List<dynamic>> loadProducts() async {
    final String response = await rootBundle.loadString('lib/api/dataProducts.json');

    final List<dynamic> data = jsonDecode(response);

    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Productos"),),

      body: FutureBuilder<List<dynamic>>(
        future: loadProducts(),

        builder: (context, snapshot) {

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(),);
          }

          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"),);
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
                    MaterialPageRoute(builder: (context)=>Detalleproducto(id: product["id"],))  
                  );
                },

                leading: Image.network(
                  product["image"],
                  width: 60,
                  height: 60,
                  fit: BoxFit.contain,
                ),

                title: Text(
                  product["title"],
                ),

                subtitle: Text(
                  '${product["category"]} - \$${product["price"]}',
                ),
              );
            },
          );
        },
      ),
    );
  }
}