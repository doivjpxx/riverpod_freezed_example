import 'package:joke_app/core/network/const/endpoints.dart';
import 'package:joke_app/core/network/dio_client.dart';

class ProductService {
  final DioClient _dioClient;

  ProductService(this._dioClient);

  Future fetchProducts() async {
    try {
      final res = await _dioClient.get(Endpoints.product);
      return res.data;
    } catch (e) {
      rethrow;
    }
  }
}
