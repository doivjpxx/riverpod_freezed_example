import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:joke_app/core/network/dio_exceptions.dart';
import 'package:joke_app/features/products/data/model/product_model.dart';
import 'package:joke_app/features/products/service/product_service.dart';

class ProductRepository {
  final ProductService _productService;

  ProductRepository(this._productService);

  Future<List<ProductModel>> fetchProducts() async {
    try {
      final res = await _productService.fetchProducts();
      final productsModel =
          (res as List).map((e) => ProductModel.fromJson(e)).toList();

      return productsModel;
    } on DioError catch (e) {
      final err = DioExceptions.fromDioError(e);
      log(err.toString());
      rethrow;
    }
  }
}
