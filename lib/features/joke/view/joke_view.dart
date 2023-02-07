import 'package:flutter/material.dart';
import 'package:joke_app/features/joke/data/model/joke_model.dart';

class JokeView extends StatelessWidget {
  final JokeModel jokeData;
  const JokeView({Key? key, required this.jokeData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Text(
          jokeData.joke ?? '',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
