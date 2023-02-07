import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:joke_app/features/joke/data/repository/joke_repository.dart';
import 'package:joke_app/features/joke/service/joke_service.dart';

import '../../../core/shared_provider/shared_provider.dart';

final jokeProvider =
    Provider<JokeService>((ref) => JokeService(ref.read(dioClientProvider)));

final jokeRepositoryProvider =
    Provider<JokeRepository>((ref) => JokeRepository(ref.read(jokeProvider)));
