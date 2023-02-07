import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:joke_app/features/favorite_products/provider/favorite_products_provider.dart';
import 'package:joke_app/features/products/provider/procut_state_provider.dart';

class FavoriteScreen extends ConsumerWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(favoriteProducts);
    return Scaffold(
      appBar: AppBar(title: const Text('Favorite')),
      body: data.isNotEmpty
          ? ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  key: Key(data[index].id.toString()),
                  title: Text(data[index].title.toString()),
                  subtitle: Text('\$${data[index].price.toString()}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.favorite),
                    onPressed: () {
                      ref.read(productsProvider.notifier).toggleFavorite(
                          data[index].id ?? 0,
                          isFavorite: false);
                    },
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 10,
                );
              },
              itemCount: data.length)
          : const Center(child: Text('No Data')),
    );
  }
}
