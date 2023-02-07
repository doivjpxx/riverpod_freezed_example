import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../routes/routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('title'.tr())),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.joke);
              },
              child: Text('jokes'.tr()),
              color: Theme.of(context).primaryColor,
            ),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.products);
              },
              child: Text('products'.tr()),
              color: Theme.of(context).primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
