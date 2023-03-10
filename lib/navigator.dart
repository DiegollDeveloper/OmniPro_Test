import 'package:flutter/material.dart';
import 'package:omnipro_test/features/home/presentation/pages/home_page.dart';

enum Routes {
  home,
}

class _Page {
  static const String home = "/";

  static const Map<Routes, String> _pageMap = {
    Routes.home: home,
  };

  static String? page(Routes routes) => _pageMap[routes];
}

Route _pageRoute({
  required Widget page,
  RouteSettings? routeSettings,
}) {
  return MaterialPageRoute(
    settings: routeSettings,
    builder: (BuildContext context) => page,
  );
}

class AppNavigator {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static NavigatorState get state => navigatorKey.currentState!;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case _Page.home:
        return _pageRoute(
          page: const HomePage(),
          routeSettings: settings,
        );
      default:
        return _pageRoute(
          page: const HomePage(),
          routeSettings: settings,
        );
    }
  }

  static Future push<T>(Routes route, {Map<String, dynamic>? arguments}) =>
      state.pushNamed(_Page.page(route)!, arguments: arguments);

  static Future pushNamedAndRemoveUntil<T>(Routes route,
          {Map<String, dynamic>? arguments}) =>
      state.pushNamedAndRemoveUntil(_Page.page(route)!, (Route routes) => false,
          arguments: arguments);

  static void pop({Map<String, dynamic>? params}) => state.pop(params);
}
