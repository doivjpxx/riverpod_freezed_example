import 'package:joke_app/features/favorite_products/view/favorite_products_screen.dart';
import 'package:joke_app/features/home/view/home_screen.dart';
import 'package:joke_app/features/products/view/products_screen.dart';
import 'package:joke_app/routes/routes.dart';

import '../features/joke/view/joke_screen.dart';

class AppRoutes {
  static final routes = {
    Routes.home: (context) => const HomeScreen(),
    Routes.joke: (context) => const JokeScreen(),
    Routes.products: (context) => const ProductsScreen(),
    Routes.favorites: (context) => const FavoriteScreen()
  };
}
