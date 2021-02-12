import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

/// Singleton navigation service used for navigation between the screens.
/// This service allows navigation from viewmodel without requiring the context
/// details from the widget.
@lazySingleton
class NavigationService {

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future push(String routeName, [Object arguments]) async {
    try {
      return ExtendedNavigator.root?.push(routeName, arguments: arguments);
    } on Exception catch (e) {
      print('Exception occurred in navigateTo: $e');
    }
  }

  Future popAndPush(String routeName, [Object arguments]) async {
    try {
      return ExtendedNavigator?.root?.popAndPush(routeName, arguments: arguments);
    } on Exception catch (e) {
      print('Exception occurred in navigateTo: $e');
    }
  }

  Future pushAndRemoveUntil(String routeName, [Object arguments]) async {
    try {
      return ExtendedNavigator?.root?.pushAndRemoveUntil(
          routeName, (route) => route.isFirst, arguments: arguments);
    } on Exception catch (e) {
      print('Exception occurred in navigateTo: $e');
    }
  }

  void pop([Object arguments]) {
    try {
      return ExtendedNavigator?.root?.pop(arguments);
    } on Exception catch (e) {
      print('Exception occurred in pop: $e');
    }
  }

  void popToRoot() {
    try {
      return ExtendedNavigator?.root?.popUntil((route) => route.isFirst);
    } on Exception catch (e) {
      print('Exception occurred in pop: $e');
    }
  }
}