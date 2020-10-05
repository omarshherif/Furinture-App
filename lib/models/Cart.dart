import 'package:flutter/material.dart';

import 'Product.dart';

class Cart {
  final Product product;
  final int numOfItem;
  final String id;
  Cart({@required this.product, @required this.numOfItem, @required this.id});
}

// Demo data for our cart

List<Cart> cartItems = [
  Cart(product: product, numOfItem: 2, id: "2"),
  Cart(product: product, numOfItem: 1, id: "2"),
  Cart(product: product, numOfItem: 1, id: "3"),
  Cart(product: product, numOfItem: 1, id: "4"),
];
