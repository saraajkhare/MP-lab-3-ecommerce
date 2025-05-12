import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/cart': (context) => CartScreen(),
      },
      home: CartScreen(),
    );
  }
}

class CartScreen extends StatelessWidget {
  // Static cart items with images
  final List<Map<String, dynamic>> cartItems = [
    {
      'name': 'Bed',
      'price': 20000,
      'quantity': 2,
      'image': 'assets/images/bed.jpg'
    },
    {
      'name': 'Chair',
      'price': 15000,
      'quantity': 3,
      'image': 'assets/images/chair2.jpg'
    },
    {
      'name': 'Table',
      'price': 25000,
      'quantity': 1,
      'image': 'assets/images/table.jpg'
    },
  ];

  CartScreen({super.key});

  // Function to calculate total price
  int getTotalPrice() {
    return cartItems.fold(0, (total, item) {
      return total +
          ((item['price'] as num) * (item['quantity'] as int)).toInt();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cart")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ListTile(
                    leading: Image.asset(
                      item['image'],
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                    title: Text(item['name'],
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle:
                        Text("Price: ₹${item['price']} x ${item['quantity']}"),
                    trailing: Text(
                      "Total: ₹${((item['price'] as num) * item['quantity']).toStringAsFixed(2)}",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Total Price: ₹${getTotalPrice()}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
