import 'package:flutter/material.dart';

class ProductDetailsPage extends StatelessWidget {
  final Map<String, String> product;

  const ProductDetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.ios_share), // Use appropriate share icon
            onPressed: () {
              // Handle share functionality
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        // For scrollable content
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Align text to the left
            children: [
              // Use a Stack to position the image and 360 view text
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image.asset(
                    // Assuming it's an asset image, if network, use Image.network
                    product['image']!,
                    fit: BoxFit
                        .cover, // Cover the width, adjust height as needed
                    width: double.infinity, // Image takes full width
                  ),
                  if (product.containsKey(
                      '360view')) // Conditionally show 360 view text
                    Container(
                      padding: EdgeInsets.all(4),
                      margin: EdgeInsets.only(
                          bottom: 16), // Add margin at the bottom
                      decoration: BoxDecoration(
                        color: Colors.black
                            .withOpacity(0.5), // Semi-transparent background
                        borderRadius:
                            BorderRadius.circular(8), // Rounded corners
                      ),
                      child: Text(
                        '360 View',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                ],
              ),
              SizedBox(height: 16), // Increased spacing

              Text(product['name']!,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 8), // Reduced spacing

              // Color options
              if (product.containsKey('colors'))
                Row(
                  children: [
                    Text('Colors:'),
                    SizedBox(width: 8),
                    for (var color in product['colors']
                        as List) // Assuming colors is a list of strings
                      Container(
                        width: 24,
                        height: 24,
                        margin: EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          color: Color(int.parse(
                              color.toString().substring(2, 10),
                              radix: 16)), // Convert hex string to Color
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.grey), // Add border
                        ),
                      ),
                  ],
                ),
              SizedBox(height: 16), // Increased spacing

              Text(product['price']!,
                  style: TextStyle(fontSize: 20, color: Colors.green)),
              SizedBox(height: 16), // Increased spacing

              Text(product['description']!),
              SizedBox(height: 16), // Increased spacing

              // Add to cart button
              Center(
                // Center the button
                child: ElevatedButton(
                  onPressed: () {
                    // Handle add to cart
                  },
                  child: Text('Add to Cart'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
