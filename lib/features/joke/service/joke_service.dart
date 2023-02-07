import 'package:joke_app/core/network/const/endpoints.dart';

import '../../../core/network/dio_client.dart';

class JokeService {
  final DioClient _dioClient;

  JokeService(this._dioClient);

  Future<Map<String, dynamic>> fetchJokes() async {
    try {
      final res = await _dioClient.get(Endpoints.jokes);
      return res.data;
    } catch (e) {
      rethrow;
    }
  }
}
