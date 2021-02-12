// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../feature/todo/presentation/detail/todo_detail_screen.dart';
import '../../feature/todo/presentation/list/todo_list_screen.dart';

class Routes {
  static const String todoListScreen = '/';
  static const String todoDetailScreen = '/todo-detail-screen';
  static const all = <String>{
    todoListScreen,
    todoDetailScreen,
  };
}

class AppRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.todoListScreen, page: TodoListScreen),
    RouteDef(Routes.todoDetailScreen, page: TodoDetailScreen),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    TodoListScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => TodoListScreen(),
        settings: data,
      );
    },
    TodoDetailScreen: (data) {
      final args = data.getArgs<TodoDetailScreenArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => TodoDetailScreen(args.id),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// TodoDetailScreen arguments holder class
class TodoDetailScreenArguments {
  final int id;
  TodoDetailScreenArguments({@required this.id});
}
