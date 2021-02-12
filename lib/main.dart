import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stacked_arch_retrofit/common/constant/colors.dart';
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
        theme: ThemeData(
          unselectedWidgetColor: AppColors.black,
          appBarTheme: AppBarTheme(
              elevation: 0
          ),
          iconTheme: IconThemeData(
            color: AppColors.white,
          ),
          primaryIconTheme: IconThemeData(
            color: AppColors.white,
          ),
          primarySwatch: AppColors.materialAccent,
          primaryTextTheme:
          TextTheme(headline6: TextStyle(color: AppColors.white)),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        builder: ExtendedNavigator<AppRouter>(
            router: AppRouter(), navigatorKey: locator<NavigationService>()
            .navigatorKey));
  }
}