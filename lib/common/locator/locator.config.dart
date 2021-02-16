// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../router/dialog_service.dart';
import '../service/navigation_service.dart';
import '../../feature/todo/presentation/detail/todo_detail_view_model.dart';
import '../../feature/todo/presentation/list/todo_list_view_model.dart';
import '../../feature/todo/domain/repository/todo_repository.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<DialogService>(() => DialogService());
  gh.lazySingleton<NavigationService>(() => NavigationService());
  gh.factory<TodoDetailViewModel>(
      () => TodoDetailViewModel(get<TodoRepository>()));
  gh.factory<TodoListViewModel>(
      () => TodoListViewModel(get<TodoRepository>(), get<NavigationService>()));
  return get;
}
