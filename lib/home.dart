import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 241, 246),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 244, 241, 246),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu, color: const Color.fromARGB(255, 9, 9, 9)),
          onPressed: () {},
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage(
                  'assets/images/profile.jpg'), // Replace with user profile image
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Find your',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
            Row(
              children: [
                Text(
                  'unique',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    decorationThickness: 2,
                    decorationColor: const Color.fromARGB(255, 69, 37, 104),
                    color: const Color.fromARGB(255, 67, 24, 71),
                  ),
                ),
                SizedBox(width: 5),
                Text(
                  'style',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  productCard(
                      'assets/images/woddy.jpg', 'Wody sets', '₹120.00'),
                  productCard(
                      'assets/images/chair.jpg', 'Modern Chair', '₹140.00'),
                  productCard(
                      'assets/images/sofa.jpg', 'Minimal Sofa', '₹200.00'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget productCard(String imageUrl, String name, String price) {
    return Container(
      width: 180,
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20)),
              color: Colors.black54,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(price,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                Text(name, style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
