import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:joke_app/core/network/dio_client.dart';

final dioInstanceProvider = Provider<Dio>((ref) => Dio());

final dioClientProvider = Provider<DioClient>((ref) {
  final dio = ref.watch(dioInstanceProvider);
  return DioClient(dio);
});
