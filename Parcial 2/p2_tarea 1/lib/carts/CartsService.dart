import 'dart:convert';

import 'package:examen/base/AbstractServiceHandler.dart';
import 'package:examen/carts/Cart.dart';
import 'package:examen/carts/CartsApi.dart';

class CartsService extends AbstractServiceHandler<void, List<Cart>> {
  final CartsApi cartsApi;

  CartsService({
    required this.cartsApi,
  });

  Future<List<Cart>> getCarts() {
    return execute(null);
  }

  @override
  Future<List<Cart>> doExecute(void input) async {
    final body = await cartsApi.execute(null);

    final List<dynamic> json = jsonDecode(body);

    return json
        .map(
          (item) => Cart.fromJson(
            item as Map<String, dynamic>,
          ),
        )
        .toList();
  }
}