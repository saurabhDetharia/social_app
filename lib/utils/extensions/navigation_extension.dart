import 'package:flutter/material.dart';

extension NavigationExtension on BuildContext {
  /// Redirects to the new route.
  Future<T?> push<T>(Widget child) async {
    return await Navigator.push(
      this,
      MaterialPageRoute(
        builder: (builderCtx) {
          return child;
        },
      ),
    );
  }

  /// Replaces the current route with the new route.
  Future<T?> pushReplacement<T>(Widget child) async {
    return await Navigator.pushReplacement(
      this,
      MaterialPageRoute(
        builder: (builderCtx) {
          return child;
        },
      ),
    );
  }

  /// Redirects to the new route and removes all previous routes.
  Future<T?> pushAndRemoveUntil<T>(
    Widget child,
    bool Function(Route route) routePredicate,
  ) async {
    return await Navigator.pushAndRemoveUntil(
      this,
      MaterialPageRoute(
        builder: (builderCtx) {
          return child;
        },
      ),
      routePredicate,
    );
  }

  /// Removes the current route from the stack.
  void pop<T>({T? result}) {
    Navigator.pop(
      this,
      result,
    );
  }
}
