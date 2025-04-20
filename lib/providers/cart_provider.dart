import 'package:riverpod_files/models/product.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_provider.g.dart';

@riverpod
class CartNotifier extends _$CartNotifier {
  @override
  Set<Product> build() {
    return const {};
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

@riverpod
int cartTotal(ref) {
  final cartProducts = ref.watch(cartNotifierProvider);

  int total = 0;

  for (Product product in cartProducts) {
    total += product.price;
  }

  return total;
}

@riverpod
int cartSum(ref){
final cartProducts = ref.watch(cartNotifierProvider);

int sum = 1;
for(Product product in cartProducts){
   sum * product.price;
}
return sum;
}
