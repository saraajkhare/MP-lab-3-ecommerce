import 'package:flutter/material.dart';
import 'home.dart';
import 'prod.dart';
import 'cart.dart';
import 'profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce App',
      routes: {
        '/cart': (context) => CartScreen(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    HomePage(),
    ProductListPage(),
    CartScreen(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home,
                  color: _selectedIndex == 0
                      ? const Color.fromARGB(255, 104, 45, 109)
                      : Colors.black),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag,
                  color: _selectedIndex == 1
                      ? const Color.fromARGB(255, 104, 45, 109)
                      : Colors.black),
              label: 'Products'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart,
                  color: _selectedIndex == 2
                      ? const Color.fromARGB(255, 104, 45, 109)
                      : Colors.black),
              label: 'Cart'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person,
                  color: _selectedIndex == 3
                      ? const Color.fromARGB(255, 104, 45, 109)
                      : Colors.black),
              label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 104, 45, 109),
        unselectedItemColor: Colors.black,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
