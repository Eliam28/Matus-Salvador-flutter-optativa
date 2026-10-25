import 'dart:convert';

import 'package:examen/Products/Product.dart';
import 'package:examen/base/AbstractServiceHandler.dart';
import 'package:examen/product_by_id/ProductByIdApi.dart';

class ProductByIdService extends AbstractServiceHandler<int, Product> {
  final ProductByIdApi productByIdApi;

  ProductByIdService({
    required this.productByIdApi,
  });

  Future<Product> getProductById(int id) {
    return execute(id);
  }

  @override
  Future<Product> doExecute(int input) async {
    final body = await productByIdApi.execute(input);

    final json = jsonDecode(body) as Map<String, dynamic>;

    return Product.fromJson(json);
  }
}