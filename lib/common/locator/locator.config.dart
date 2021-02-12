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
import 'locator.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  final repositoryModule = _$RepositoryModule();
  final viewModelModule = _$ViewModelModule(get);
  gh.lazySingleton<DialogService>(() => DialogService());
  gh.lazySingleton<NavigationService>(() => NavigationService());
  gh.factory<TodoRepository>(() => repositoryModule.todoRepository);
  gh.factory<TodoDetailViewModel>(() => viewModelModule.todoDetailViewModel);
  gh.factory<TodoListViewModel>(() => viewModelModule.todoListViewModel);
  return get;
}

class _$RepositoryModule extends RepositoryModule {}

class _$ViewModelModule extends ViewModelModule {
  final GetIt _get;
  _$ViewModelModule(this._get);
  @override
  TodoDetailViewModel get todoDetailViewModel =>
      TodoDetailViewModel(_get<TodoRepository>());
  @override
  TodoListViewModel get todoListViewModel =>
      TodoListViewModel(_get<TodoRepository>(), _get<NavigationService>());
}
