import 'package:flutter/material.dart';

import '../ui/screens/screens.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashScreen.routeName:
      return _customPageRoute(
        child: const SplashScreen(),
      );
    case AddressBookScreen.routeName:
      return _customPageRoute(
        child: const AddressBookScreen(),
      );
    case ContactDetailsScreen.routeName:
      return _slidePageRoute(
          child: const ContactDetailsScreen(), settings: settings);
    default:
      return _customPageRoute(
        child: Container(),
      );
  }
}

/// Create custom page route transition
_customPageRoute({
  required Widget child,
  RouteSettings? settings,
}) {
  return PageRouteBuilder(
    settings: settings,
    pageBuilder: (_, __, ___) => child,
    transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c),
    transitionDuration: Duration.zero,
  );
}

/// Create custom page route transition
_slidePageRoute({
  required Widget child,
  RouteSettings? settings,
}) {
  return PageRouteBuilder(
    settings: settings,
    pageBuilder: (
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
    ) =>
        child,
    transitionsBuilder: (
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child,
    ) =>
        SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1.0, 0.0),
        end: Offset.zero,
      ).animate(animation),
      child: child,
    ),
  );
}
