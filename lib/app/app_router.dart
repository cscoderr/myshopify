import 'package:dengun_challenge/details/view/details_page.dart';
import 'package:dengun_challenge/product/product.dart';
import 'package:dengun_challenge/tags/tags.dart';
import 'package:flutter/material.dart';

/// Dengun MyshopifyPages for the Dengun route
class MyshopifyPages {
  /// The first page when the app loads
  static const String tags = '/';

  /// Dengun notificaiton details page
  static const String product = '/product';

  /// Dengun notificaiton details page
  static const String details = '/details';
}

///The main app routes logic using router generator
class AppRouter {
  ///list of all the app routes
  static Route route(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case MyshopifyPages.tags:
        return MaterialPageRoute<Widget>(
          builder: (context) {
            return const TagsPage();
          },
        );
      case MyshopifyPages.product:
        return MaterialPageRoute<Widget>(
          builder: (context) {
            return ProductPage(tag: args!.toString());
          },
        );
      case MyshopifyPages.details:
        return MaterialPageRoute<Widget>(
          builder: (context) {
            return DetailsPage(productId: args!);
          },
        );
      default:
        return MaterialPageRoute<Widget>(
          builder: (context) {
            return const Text('Error');
          },
        );
    }
  }
}
