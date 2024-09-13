import 'package:bot_toast/bot_toast.dart';
import 'package:briktest/providers_setup.dart';
import 'package:briktest/ui/router.dart' as router;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/constants/app_constants.dart';
import 'core/services/navigation_service.dart';

void main() {
  runApp(const ProductApp());
}

class ProductApp extends StatelessWidget {
  const ProductApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: getProviders(),
      child: Builder(
        builder: (BuildContext context) {
          return GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: MaterialApp(
              title: 'Grocery Product',
              builder: BotToastInit(),
              navigatorObservers: <NavigatorObserver>[
                BotToastNavigatorObserver(),
              ],
              theme: ThemeData(
                primarySwatch: Colors.red,
                primaryColor: Colors.white,
                scaffoldBackgroundColor: Colors.white,
              ),
              initialRoute: RoutePaths.productList,
              onGenerateRoute: router.Router.generateRoute,
              navigatorKey:
              Provider.of<NavigationService>(context).navigatorKey,
            ),
          );
        },
      ),
    );
  }
}
