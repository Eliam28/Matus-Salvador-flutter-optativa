import 'package:examen/Products/ProductsScreen.dart';
import 'package:examen/Products/ProductsService.dart';

import 'package:examen/cart_by_id/CartByIdService.dart';

import 'package:examen/carts/CartsScreen.dart';
import 'package:examen/carts/CartsService.dart';

import 'package:examen/product_by_id/ProductByIdService.dart';

import 'package:examen/user_by_id/UserByIdService.dart';

import 'package:flutter/material.dart';

class MyBottomNavigatorBar extends StatefulWidget {
  final ProductsService productsService;
  final ProductByIdService productByIdService;
  final CartsService cartsService;
  final CartByIdService cartByIdService;
  final UserByIdService userByIdService;

  const MyBottomNavigatorBar({
    super.key,
    required this.productsService,
    required this.productByIdService,
    required this.cartsService,
    required this.cartByIdService,
    required this.userByIdService,
  });

  @override
  State<MyBottomNavigatorBar> createState() =>
      MyBottomNavigatorBarState();
}

class MyBottomNavigatorBarState
    extends State<MyBottomNavigatorBar> {

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      ProductsScreen(
        productsService: widget.productsService,
        productByIdService: widget.productByIdService,
      ),

      CartsScreen(
        cartsService: widget.cartsService,
        cartByIdService: widget.cartByIdService,
        userByIdService: widget.userByIdService,
        productByIdService: widget.productByIdService,
      ),
    ];

    final List<BottomNavigationBarItem> items = const [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: "Productos",
      ),

      BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart),
        label: "Carritos",
      ),
    ];

    return Scaffold(
      body: screens[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,

        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },

        items: items,
      ),
    );
  }
}