import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:joke_app/features/joke/provider/joke_state_provider.dart';
import 'package:joke_app/features/joke/view/refresh_joke.dart';

import 'joke_view.dart';

class JokeScreen extends ConsumerWidget {
  const JokeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final joke = ref.watch(jokeDataProvider).joke;
    final isLoading = ref.watch(jokeDataProvider).isLoading;

    return Scaffold(
      floatingActionButton: const RefreshJoke(),
      appBar: AppBar(
        title: const Text('Jokes'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : JokeView(jokeData: joke),
    );
  }
}
