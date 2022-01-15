import 'package:flutter/material.dart';

import '../screens/product_detail_screen.dart';
import '../screens/products_overview_screen.dart';

class AppRouter {
  static Map map = {
    '/': (args) =>
        MaterialPageRoute(builder: (ctx) => const ProjectOverviewScreen()),
    ProductDetailScreen.routeWithArgs: (args) =>
        MaterialPageRoute(builder: (ctx) => ProductDetailScreen.withArgs(args)),
  };

  Route onGenerateRoute(RouteSettings settings) {
    return map[settings.name](settings.arguments);
  }
}
