import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce/api/items_model.dart';
import 'package:e_commerce/app/cartcontroller.dart'; // Import CartController

class DetailsScreen extends StatelessWidget {
  final Products product;

  DetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find(); // Get the CartController

    return Scaffold(
      appBar: AppBar(
        title: Text(
          product.title,
          style: TextStyle(
              color: Colors.black), // Ensure the text is visible on white
        ),
        backgroundColor: Colors.white, // Set AppBar background to white
        elevation: 0, // Remove shadow for a flat look
        iconTheme: IconThemeData(
            color: Colors.black), // Set icon color to black for visibility
      ),
      backgroundColor: Colors.white, // Set background color of the Scaffold
      body: Stack(
        children: [
          Padding(
            padding:
                const EdgeInsets.all(16.0), // Add padding for better layout
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Display product image
                Center(
                  child: Image.network(
                    product.image,
                    fit: BoxFit.cover,
                    height: 250, // Set a fixed height
                  ),
                ),
                const SizedBox(height: 16),
                // Display product title
                Text(
                  product.title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                // Display product price
                Text(
                  '\$${product.price}',
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: SizedBox(
              width: double.infinity, // Ensures the button spans the width
              child: ElevatedButton(
                onPressed: () {
                  cartController.addToCart(product); // Add product to cart
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${product.title} added to cart')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.orange, // Background color of the button
                  foregroundColor: Colors.white, // Text color of the button
                  padding: EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 24.0), // Adjust padding as needed
                ),
                child: const Text('Add to Cart'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
