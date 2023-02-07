import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:joke_app/features/joke/provider/joke_provider.dart';
import 'package:joke_app/features/joke/data/repository/joke_repository.dart';
import 'package:joke_app/features/joke/data/state/joke_state.dart';

class JokeDataNotifier extends StateNotifier<JokeState> {
  JokeRepository jokeRepository;

  JokeDataNotifier(this.jokeRepository) : super(JokeState()) {
    getJoke();
  }

  Future<void> getJoke() async {
    state = state.copyWith(isLoading: true);
    await jokeRepository.fetchJoke().then((value) {
      state = state.copyWith(isLoading: false, joke: value);
    });
  }
}

final jokeDataProvider =
    StateNotifierProvider.autoDispose<JokeDataNotifier, JokeState>(
        (ref) => JokeDataNotifier(ref.read(jokeRepositoryProvider)));
