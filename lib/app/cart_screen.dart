import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce/api/items_model.dart'; // Import Product
import 'package:e_commerce/app/cartcontroller.dart'; // Import CartController

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find(); // Get the CartController

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              if (cartController.cartItems.isEmpty) {
                return Center(child: Text('No items in cart'));
              }

              return ListView.builder(
                itemCount: cartController.cartItems.length,
                itemBuilder: (context, index) {
                  final Products product = cartController.cartItems[index];
                  return ListTile(
                    leading:
                        Image.network(product.image, width: 50, height: 50),
                    title: Text(product.title),
                    subtitle: Text('\$${product.price}'),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        cartController.removeFromCart(
                            product); // Remove product from cart
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content:
                                  Text('${product.title} removed from cart')),
                        );
                      },
                    ),
                  );
                },
              );
            }),
          ),
          // Total Price and Check Out Button
          Obx(() {
            final totalPrice = cartController.totalPrice;
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 120, // Increased height for the total section
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(16.0),
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment
                          .center, // Center the contents vertically
                      children: [
                        Text(
                          'Total:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '\$${totalPrice.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 16),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Implement check out functionality here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange, // Background color
                      foregroundColor: Colors.white, // Text color
                      padding: EdgeInsets.symmetric(
                          vertical: 16.0,
                          horizontal: 24.0), // Adjust padding as needed
                    ),
                    child: const Text('Check Out'),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
