import 'package:dengun_challenge/app/app_router.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:myshopify_repository/myshopify_repository.dart';

final myshopifyRepositoryProvider = Provider<MyShopifyRepository>((ref) {
  return MyShopifyRepository();
});

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: FlexThemeData.light(scheme: FlexScheme.bahamaBlue),
      darkTheme: FlexThemeData.dark(scheme: FlexScheme.bahamaBlue),
      themeMode: ThemeMode.system,
      onGenerateRoute: AppRouter.route,
      initialRoute: MyshopifyPages.tags,
    );
  }
}
