import 'package:examen/Login/LoginApi.dart';
import 'package:examen/Login/LoginScreen.dart';
import 'package:examen/Login/LoginService.dart';

import 'package:examen/Products/ProductsApi.dart';
import 'package:examen/Products/ProductsService.dart';

import 'package:examen/product_by_id/ProductByIdApi.dart';
import 'package:examen/product_by_id/ProductByIdService.dart';

import 'package:examen/themes/app_theme.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  final httpClient = http.Client();

  // LOGIN
  final loginApi = LoginApi(
    httpClient: httpClient,
  );

  final loginService = LoginService(
    loginApi: loginApi,
  );

  // PRODUCTS
  final productsApi = ProductsApi(
    httpClient: httpClient,
  );

  final productsService = ProductsService(
    productsApi: productsApi,
  );

  // PRODUCT BY ID
  final productByIdApi = ProductByIdApi(
    httpClient: httpClient,
  );

  final productByIdService = ProductByIdService(
    productByIdApi: productByIdApi,
  );

  runApp(
    MainApp(
      loginService: loginService,
      productsService: productsService,
      productByIdService: productByIdService,
    ),
  );
}

class MainApp extends StatelessWidget {
  final LoginService loginService;
  final ProductsService productsService;
  final ProductByIdService productByIdService;

  const MainApp({
    super.key,
    required this.loginService,
    required this.productsService,
    required this.productByIdService,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.themedata,
      home: LoginScreen(
        loginService: loginService,
        productsService: productsService,
        productByIdService: productByIdService,
      ),
    );
  }
}