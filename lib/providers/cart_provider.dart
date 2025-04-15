// import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_files/models/product.dart';

class CartNotifier extends Notifier<Set<Product>> {
  @override
  Set<Product> build() {
    return const {
      Product(
          id: '4',
          title: 'Red Backpack',
          price: 14,
          image: 'assets/products/backpack.png'),
    };
  }
  void addProduct(Product cartProduct){
    if (!state.contains(cartProduct)){
      state = {...state, cartProduct};
    }
  }

  void removeProduct(Product cartProduct){
    if (state.contains(cartProduct)){
      state = state.where((p) => p.id != cartProduct.id).toSet();
    }
  }
}

final cartNotifierProvider = NotifierProvider<CartNotifier, Set<Product>>(() {
  return CartNotifier();
});
