import 'package:flutter/material.dart';

import '../navigation/app_routes_names.dart';

class NavigationService {
  void openHome(BuildContext context) {
    _pushNamed(context, homeRouteName);
  }

  void openFacts(BuildContext context) {
    _pushNamed(context, factsRouteName);
  }

  Future<T?> _pushNamed<T extends Object?>(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) {
    return Navigator.pushNamed(context, routeName, arguments: arguments);
  }
}
