import 'package:examen/Products/ProductsScreen.dart';
import 'package:examen/Products/ProductsService.dart';
import 'package:examen/product_by_id/ProductByIdService.dart';
import 'package:examen/screens/carrito.dart';
import 'package:flutter/material.dart';

class MyBottomNavigatorBar extends StatefulWidget {
  final ProductsService productsService;
  final ProductByIdService productByIdService;

  const MyBottomNavigatorBar({
    super.key,
    required this.productsService,
    required this.productByIdService,
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

      const Carritoscreen(),
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