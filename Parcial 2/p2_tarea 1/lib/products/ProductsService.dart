import 'dart:convert';

import 'package:examen/Products/Product.dart';
import 'package:examen/Products/ProductsApi.dart';
import 'package:examen/base/AbstractServiceHandler.dart';

class ProductsService extends AbstractServiceHandler<void, List<Product>> {
  final ProductsApi productsApi;

  ProductsService({
    required this.productsApi,
  });

  Future<List<Product>> getProducts() {
    return execute(null);
  }

  @override
  Future<List<Product>> doExecute(void input) async {
    final body = await productsApi.execute(null);

    final List<dynamic> json = jsonDecode(body);

    return json
        .map(
          (item) => Product.fromJson(
            item as Map<String, dynamic>,
          ),
        )
        .toList();
  }
}