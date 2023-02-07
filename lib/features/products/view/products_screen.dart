import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:joke_app/features/products/provider/product_provider.dart';

import '../../../routes/routes.dart';
import '../provider/procut_state_provider.dart';

class ProductsScreen extends ConsumerWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(productsProvider);
    final isLoading = ref.watch(isLoadingProvider);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(Routes.favorites);
        },
        child: const Icon(Icons.shopping_bag_outlined),
      ),
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.separated(
              itemCount: data.length,
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 10,
                );
              },
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(data[index].title.toString()),
                  subtitle: Text('\$${data[index].price.toString()}'),
                  trailing: IconButton(
                    icon: Icon(
                      data[index].isFavorite
                          ? Icons.favorite
                          : Icons.favorite_outline,
                    ),
                    onPressed: () {
                      ref.read(productsProvider.notifier).toggleFavorite(
                          data[index].id ?? 0,
                          isFavorite: !data[index].isFavorite);
                    },
                  ),
                );
              },
            ),
    );
  }
}
