import 'dart:convert';

import 'package:examen/base/AbstractServiceHandler.dart';
import 'package:examen/user_by_id/User.dart';
import 'package:examen/user_by_id/UserByIdApi.dart';

class UserByIdService extends AbstractServiceHandler<int, User> {
  final UserByIdApi userByIdApi;

  UserByIdService({
    required this.userByIdApi,
  });

  Future<User> getUserById(int id) {
    return execute(id);
  }

  @override
  Future<User> doExecute(int input) async {
    final body = await userByIdApi.execute(input);

    final json = jsonDecode(body) as Map<String, dynamic>;

    return User.fromJson(json);
  }
}