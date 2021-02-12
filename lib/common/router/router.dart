import 'package:auto_route/auto_route_annotations.dart';
import 'package:flutter_stacked_arch_retrofit/feature/todo/presentation/detail/todo_detail_screen.dart';
import 'package:flutter_stacked_arch_retrofit/feature/todo/presentation/list/todo_list_screen.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  MaterialRoute(page: TodoListScreen, initial: true),
  MaterialRoute(page: TodoDetailScreen)
])

/// $ symbol denotes that this AppRouter class will be generated
/// by the build_runner tool. This generated code will have all the required
/// information to perform navigation between the above mentioned routes.
///
/// This router information will be defined in main.dart file so that TodoApp
/// will have information of all the routes.
class $AppRouter {}
