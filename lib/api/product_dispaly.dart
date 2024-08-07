import 'package:flutter/material.dart';
import 'package:e_commerce/api/items_model.dart';

class ProductsDisplay extends StatelessWidget {
  const ProductsDisplay({super.key, required this.product});

  final Products product;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
      child: Stack(
        children: [
          // Image
          Container(
            height: 160,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                image: AssetImage(product.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Heart Icon
          Positioned(
            top: 8,
            right: 8,
            child: Icon(
              Icons.favorite_border,
              color: Colors.red,
              size: 24,
            ),
          ),
          // Price
          Positioned(
            bottom: 8,
            left: 8,
            child: Text(
              '\$${product.price}',
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
