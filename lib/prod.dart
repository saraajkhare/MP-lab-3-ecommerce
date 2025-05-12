import 'package:ecomm/proddetails.dart';
import 'package:flutter/material.dart';
import 'cart.dart';

class ProductListPage extends StatelessWidget {
  final List<Map<String, String>> products = [
    {
      'name': 'Sofa',
      'price': '₹10,000',
      'description': 'Description 1',
      'image': 'assets/images/sofa.jpg'
    },
    {
      'name': 'Chair',
      'price': '₹15,000',
      'description': 'Description 2',
      'image': 'assets/images/chair2.jpg'
    },
    {
      'name': 'Bed',
      'price': '₹20,000',
      'description': 'Description 3',
      'image': 'assets/images/bed.jpg'
    },
    {
      'name': 'Table',
      'price': '₹25,000',
      'description': 'Description 4',
      'image': 'assets/images/table.jpg'
    },
    {
      'name': 'Book Shelf',
      'price': '₹23,000',
      'description': 'Description 5',
      'image': 'assets/images/wardrobe.jpg'
    },
  ];

  ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Handle search
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Handle cart
              Navigator.pushNamed(context, '/cart');
            },
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75, // Adjust as needed
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ProductDetailsPage(product: products[index]),
                ),
              );
            },
            child: Card(
              elevation: 2,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      products[index]['image']!,
                      fit: BoxFit.cover,
                      errorBuilder: (context, object, stackTrace) {
                        // Handle image errors
                        return Center(
                            child: Icon(Icons.error)); // Show an error icon
                      },
                      frameBuilder:
                          (context, child, frame, wasSynchronouslyLoaded) {
                        // Show a loading indicator
                        if (wasSynchronouslyLoaded) return child;
                        return AnimatedOpacity(
                          opacity: frame == null ? 0 : 1,
                          duration: const Duration(seconds: 1),
                          child: child,
                        );
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      color: Colors.black.withOpacity(0.5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            products[index]['name']!,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            products[index]['price']!,
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
