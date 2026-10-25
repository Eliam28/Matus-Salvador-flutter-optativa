import 'package:examen/Login/LoginApi.dart';
import 'package:examen/Login/LoginScreen.dart';
import 'package:examen/Login/LoginService.dart';

import 'package:examen/Products/ProductsApi.dart';
import 'package:examen/Products/ProductsService.dart';

import 'package:examen/product_by_id/ProductByIdApi.dart';
import 'package:examen/product_by_id/ProductByIdService.dart';

import 'package:examen/carts/CartsApi.dart';
import 'package:examen/carts/CartsService.dart';

import 'package:examen/cart_by_id/CartByIdApi.dart';
import 'package:examen/cart_by_id/CartByIdService.dart';

import 'package:examen/user_by_id/UserByIdApi.dart';
import 'package:examen/user_by_id/UserByIdService.dart';

import 'package:examen/themes/app_theme.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  final httpClient = http.Client();

  final loginApi = LoginApi(
    httpClient: httpClient,
  );

  final loginService = LoginService(
    loginApi: loginApi,
  );

  final productsApi = ProductsApi(
    httpClient: httpClient,
  );

  final productsService = ProductsService(
    productsApi: productsApi,
  );

  final productByIdApi = ProductByIdApi(
    httpClient: httpClient,
  );

  final productByIdService = ProductByIdService(
    productByIdApi: productByIdApi,
  );

  final cartsApi = CartsApi(
    httpClient: httpClient,
  );

  final cartsService = CartsService(
    cartsApi: cartsApi,
  );

  final cartByIdApi = CartByIdApi(
    httpClient: httpClient,
  );

  final cartByIdService = CartByIdService(
    cartByIdApi: cartByIdApi,
  );

  final userByIdApi = UserByIdApi(
    httpClient: httpClient,
  );

  final userByIdService = UserByIdService(
    userByIdApi: userByIdApi,
  );

  runApp(
    MainApp(
      loginService: loginService,
      productsService: productsService,
      productByIdService: productByIdService,
      cartsService: cartsService,
      cartByIdService: cartByIdService,
      userByIdService: userByIdService,
    ),
  );
}

class MainApp extends StatelessWidget {
  final LoginService loginService;
  final ProductsService productsService;
  final ProductByIdService productByIdService;
  final CartsService cartsService;
  final CartByIdService cartByIdService;
  final UserByIdService userByIdService;

  const MainApp({
    super.key,
    required this.loginService,
    required this.productsService,
    required this.productByIdService,
    required this.cartsService,
    required this.cartByIdService,
    required this.userByIdService,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.themedata,
      home: LoginScreen(
        loginService: loginService,
        productsService: productsService,
        productByIdService: productByIdService,
        cartsService: cartsService,
        cartByIdService: cartByIdService,
        userByIdService: userByIdService,
      ),
    );
  }
}