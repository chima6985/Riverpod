import 'package:riverpod_files/models/product.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_provider.g.dart';

@riverpod
class CartNotifier extends _$CartNotifier {
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

  void addProduct(Product cartProduct) {
    if (!state.contains(cartProduct)) {
      state = {...state, cartProduct};
    }
  }

  void removeProduct(Product cartProduct) {
    if (state.contains(cartProduct)) {
      state = state.where((p) => p.id != cartProduct.id).toSet();
    }
  }
}


