import 'package:examen/screens/carrito.dart';
import 'package:examen/screens/products.dart';
import 'package:flutter/material.dart';

class MyBottomNavigatorBar extends StatefulWidget {
  const MyBottomNavigatorBar({super.key});

  @override
  State<MyBottomNavigatorBar> createState() =>
      _MyBottomNavigatorBarState();
}

class _MyBottomNavigatorBarState
    extends State<MyBottomNavigatorBar> {

  int currentIndex = 0;

  final List<Widget> screens = const [
    Products(),
    Carritoscreen()
  ];

  final List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: "Inicio",
    ),

    BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart),
      label: "Carritos",
    ),
  ];

  @override
  Widget build(BuildContext context) {
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