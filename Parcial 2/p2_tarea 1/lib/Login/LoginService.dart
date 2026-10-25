import 'dart:convert';

import 'package:examen/Login/LoginApi.dart';
import 'package:examen/Login/UserCredentialsDto.dart';
import 'package:examen/base/AbstractServiceHandler.dart';


class LoginService extends AbstractServiceHandler<UserCredentialsDto, AuthResponseDto> {
  final LoginApi loginApi;

  LoginService({required this.loginApi});

  Future<AuthResponseDto> login(String username, String password) {
    final credentials = UserCredentialsDto(username: username, password: password);
    return execute(credentials);
  }

  @override
  Future<AuthResponseDto> doExecute(UserCredentialsDto input) async {
    final body = await loginApi.execute(input);
    final json = jsonDecode(body) as Map<String, dynamic>;
    return AuthResponseDto.fromJson(json);
  }
}