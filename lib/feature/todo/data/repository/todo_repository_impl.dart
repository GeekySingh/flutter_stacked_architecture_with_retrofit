import 'package:flutter_stacked_arch_retrofit/common/network/result.dart';
import 'package:flutter_stacked_arch_retrofit/feature/todo/data/mapper/todo_entity_model_mapper.dart';
import 'package:flutter_stacked_arch_retrofit/feature/todo/data/model/todo_model.dart';
import 'package:flutter_stacked_arch_retrofit/feature/todo/domain/entity/todo_entity.dart';
import 'package:flutter_stacked_arch_retrofit/feature/todo/domain/repository/todo_repository.dart';
import 'package:flutter_stacked_arch_retrofit/feature/todo/domain/service/todo_api_service.dart';

class TodoRepositoryImpl extends TodoRepository {
  @override
  Future<Result<List<TodoModel>>> getTodos() async {
    return safeCall(TodoApiService(dio, baseUrl: endpoint).getTodos(),
        entityMapper: (List<TodoEntity> entityList) =>
            entityList.map((e) => e.toModel()).toList());
  }

  @override
  Future<Result<TodoModel>> getTodoDetail(int todoId) {
    return safeCall(
        TodoApiService(dio, baseUrl: endpoint).getTodoDetail(todoId),
        entityMapper: (TodoEntity entity) => entity.toModel());
  }
}
