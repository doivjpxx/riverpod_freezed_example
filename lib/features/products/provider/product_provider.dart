import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:joke_app/core/shared_provider/shared_provider.dart';
import 'package:joke_app/features/products/data/repository/product_repository.dart';
import 'package:joke_app/features/products/service/product_service.dart';

final productProvider = Provider<ProductService>(
    (ref) => ProductService(ref.read(dioClientProvider)));

final productRepositoryProvider = Provider<ProductRepository>(
    (ref) => ProductRepository(ref.read(productProvider)));

final isLoadingProvider = StateProvider<bool>((ref) => true);
