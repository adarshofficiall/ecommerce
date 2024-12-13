import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHomePage();
  }

  // Navigate to home page after a delay
  _navigateToHomePage() async {
    await Future.delayed(Duration(seconds: 3)); // 3 seconds delay
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Displaying a logo or image on the splash screen
            Image.asset('assets/logo.png', width: 150), // Replace with your logo image path
            SizedBox(height: 20),
            CircularProgressIndicator(), // Showing loading indicator
            SizedBox(height: 20),
            Text(
              "Welcome to my shop", // Text welcoming the user
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Map<String, String>> products = [
    {'name': 'Product 1', 'price': '\$29.99', 'image': 'assets/product1.jpg'},
    {'name': 'Product 2', 'price': '\$39.99', 'image': 'assets/product2.jpg'},
    {'name': 'Product 3', 'price': '\$49.99', 'image': 'assets/product3.jpg'},
    {'name': 'Product 4', 'price': '\$19.99', 'image': 'assets/product4.jpg'},
    {'name': 'Product 5', 'price': '\$59.99', 'image': 'assets/product5.jpg'},
    {'name': 'Product 6', 'price': '\$89.99', 'image': 'assets/product6.jpg'},
    {'name': 'Product 7', 'price': '\$99.99', 'image': 'assets/product7.jpg'},
    {'name': 'Product 8', 'price': '\$79.99', 'image': 'assets/product8.jpg'},
    {'name': 'Product 9', 'price': '\$89.99', 'image': 'assets/product9.jpg'},
    {'name': 'Product 10', 'price': '\$129.99', 'image': 'assets/product10.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to ShopX'),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 products per row
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.75, // Adjust the aspect ratio for the product cards
        ),
        itemCount: products.length,
        itemBuilder: (ctx, index) {
          return ProductCard(
            name: products[index]['name']!,
            price: products[index]['price']!,
            image: products[index]['image']!,
          );
        },
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String name;
  final String price;
  final String image;

  ProductCard({
    required this.name,
    required this.price,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product image
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: Image.asset(
              image,
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              name,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              price,
              style: TextStyle(
                fontSize: 16,
                color: Colors.greenAccent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
