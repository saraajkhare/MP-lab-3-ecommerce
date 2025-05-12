import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              radius: 50,
              backgroundImage:
                  AssetImage('assets/images/profile.jpg'), // Profile Picture
            ),
            SizedBox(height: 10),
            Text(
              "Sara Khare",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              "sara@gamil.com",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            Text(
              "Powai,Mumbai",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 20),

            Divider(),

            // Profile Info List
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.person, color: Colors.blue),
                    title: Text("Name"),
                    subtitle: Text("Sara Khare"),
                  ),
                  ListTile(
                    leading: Icon(Icons.email, color: Colors.red),
                    title: Text("Email"),
                    subtitle: Text("sara@gamil.com"),
                  ),
                  ListTile(
                    leading: Icon(Icons.location_on, color: Colors.green),
                    title: Text("Address"),
                    subtitle: Text("Powai,Mumbai"),
                  ),
                ],
              ),
            ),

            Divider(),

            // Past Orders Section
            Padding(
              padding: EdgeInsets.all(10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Past Orders",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            // Use SizedBox with fixed height to avoid Expanded issue
            SizedBox(
              height: 200, // Adjust as needed
              child: ListView(
                shrinkWrap: true,
                children: [
                  ListTile(
                    leading: Icon(Icons.shopping_bag, color: Colors.orange),
                    title: Text("Order #12345"),
                    subtitle: Text("Sofa - ₹10,000"),
                  ),
                  ListTile(
                    leading: Icon(Icons.shopping_bag, color: Colors.orange),
                    title: Text("Order #12346"),
                    subtitle: Text("Chair - ₹15,000"),
                  ),
                  ListTile(
                    leading: Icon(Icons.shopping_bag, color: Colors.orange),
                    title: Text("Order #12347"),
                    subtitle: Text("Table - ₹25,000"),
                  ),
                ],
              ),
            ),

            Divider(),

            // Logout Button
            Padding(
              padding: EdgeInsets.all(20),
              child: ElevatedButton.icon(
                onPressed: () {
                  // Handle Logout
                  Navigator.pop(context);
                },
                icon: Icon(Icons.logout),
                label: Text("Logout"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  minimumSize: Size(double.infinity, 40),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
