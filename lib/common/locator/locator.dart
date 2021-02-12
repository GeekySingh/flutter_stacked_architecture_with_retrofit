import 'package:flutter_stacked_arch_retrofit/feature/todo/data/repository/todo_repository_impl.dart';
import 'package:flutter_stacked_arch_retrofit/feature/todo/domain/repository/todo_repository.dart';
import 'package:flutter_stacked_arch_retrofit/feature/todo/presentation/detail/todo_detail_view_model.dart';
import 'package:flutter_stacked_arch_retrofit/feature/todo/presentation/list/todo_list_view_model.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'locator.config.dart';

final locator = GetIt.instance;

@injectableInit
void setupLocator() => $initGetIt(locator);

/// define all the view models here to locate their dependencies
@module
abstract class ViewModelModule {

  @factoryMethod
  TodoListViewModel get todoListViewModel;

  @factoryMethod
  TodoDetailViewModel get todoDetailViewModel;
}

@module
abstract class RepositoryModule {

  @factoryMethod
  TodoRepository get todoRepository => TodoRepositoryImpl();
}