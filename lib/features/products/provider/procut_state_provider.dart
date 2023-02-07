import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:joke_app/features/products/data/model/product_model.dart';
import 'package:joke_app/features/products/provider/product_provider.dart';

class ProductsNotifier extends StateNotifier<List<ProductModel>> {
  final Ref ref;

  ProductsNotifier({required this.ref}) : super([]) {
    fetchProducts(ref: ref);
  }

  Future fetchProducts({required Ref ref}) async {
    await ref.read(productRepositoryProvider).fetchProducts().then((value) {
      state = value;
      ref.read(isLoadingProvider.notifier).state = false;
    });
  }

  void toggleFavorite(int id, {required bool isFavorite}) {
    final updatedProduct = state
        .firstWhere((element) => element.id == id)
        .copyWith(isFavorite: isFavorite);

    state = [
      for (int i = 0; i < state.length; i++)
        if (state[i].id == id) updatedProduct else state[i]
    ];
  }
}

final productsProvider =
    StateNotifierProvider<ProductsNotifier, List<ProductModel>>(
        (ref) => ProductsNotifier(ref: ref));
