import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:joke_app/core/network/dio_exceptions.dart';
import 'package:joke_app/features/joke/data/model/joke_model.dart';
import 'package:joke_app/features/joke/service/joke_service.dart';

class JokeRepository {
  final JokeService _jokeService;

  JokeRepository(this._jokeService);

  Future<JokeModel> fetchJoke() async {
    try {
      final res = await _jokeService.fetchJokes();
      final jokeModel = JokeModel.fromJson(res);

      return jokeModel;
    } on DioError catch (e) {
      final errMsg = DioExceptions.fromDioError(e);
      log(errMsg.toString());
      rethrow;
    }
  }
}
