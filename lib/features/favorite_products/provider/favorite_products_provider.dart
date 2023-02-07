import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:joke_app/features/products/data/model/product_model.dart';
import 'package:joke_app/features/products/provider/procut_state_provider.dart';

final favoriteProducts = StateProvider<List<ProductModel>>((ref) {
  final res = ref
      .watch(productsProvider)
      .where((element) => element.isFavorite == true)
      .toList();
  return res;
});
