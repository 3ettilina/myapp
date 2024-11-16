import 'package:flutter/material.dart';

enum ProductCardType {
  view,
  add,
}

class ProductCard extends StatelessWidget {
  const ProductCard.view({
    required this.title,
    required this.description,
    required this.imageUrl,
    super.key,
  }) : type = ProductCardType.view;

  const ProductCard.add({
    required this.title,
    required this.description,
    required this.imageUrl,
    super.key,
  }): type = ProductCardType.add;

  final ProductCardType type;
  final String title;
  final String description;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Column(
        children: [
          Expanded(child: Image.network(imageUrl)),
          Text(title),
          Text(description)
        ],
      ),
    );
  }
}
