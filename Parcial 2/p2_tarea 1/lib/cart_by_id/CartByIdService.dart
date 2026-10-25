import 'dart:convert';

import 'package:examen/base/AbstractServiceHandler.dart';
import 'package:examen/cart_by_id/CartByIdApi.dart';
import 'package:examen/carts/Cart.dart';

class CartByIdService extends AbstractServiceHandler<int, Cart> {
  final CartByIdApi cartByIdApi;

  CartByIdService({
    required this.cartByIdApi,
  });

  Future<Cart> getCartById(int id) {
    return execute(id);
  }

  @override
  Future<Cart> doExecute(int input) async {
    final body = await cartByIdApi.execute(input);

    final json = jsonDecode(body) as Map<String, dynamic>;

    return Cart.fromJson(json);
  }
}