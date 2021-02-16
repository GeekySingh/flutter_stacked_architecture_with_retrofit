import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stacked_arch_retrofit/common/locator/locator.dart';
import 'package:flutter_stacked_arch_retrofit/common/router/router.gr.dart';
import 'package:flutter_stacked_arch_retrofit/common/service/navigation_service.dart';

void main() {
  setupLocator();
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: ExtendedNavigator<AppRouter>(
            router: AppRouter(), navigatorKey: locator<NavigationService>()
            .navigatorKey));
  }
}