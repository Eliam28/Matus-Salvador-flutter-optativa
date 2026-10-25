import 'dart:convert';

import 'package:examen/Login/UserCredentialsDto.dart';
import 'package:examen/base/AbstractApiHandler.dart';



class LoginApi extends AbstractApiHandler<UserCredentialsDto, String> {
  LoginApi({required super.httpClient});

  static const String _url = 'https://dummyjson.com/auth/login';

  @override
  Future<String> doExecute(UserCredentialsDto input) async {
    return await webClientPost(_url, input.toJson());
  }
}