import 'package:flutter_stacked_arch_retrofit/common/network/result.dart';
import 'package:flutter_stacked_arch_retrofit/feature/todo/data/model/todo_model.dart';
import 'package:flutter_stacked_arch_retrofit/feature/todo/domain/repository/todo_repository.dart';
import 'package:flutter_stacked_arch_retrofit/feature/todo/domain/service/todo_api_service.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_stacked_arch_retrofit/feature/todo/data/mapper/todo_entity_model_mapper.dart';

class TodoRepositoryImpl extends TodoRepository {
  @override
  Future<Result<List<TodoModel>>> getTodos() async {
    final result = await safeCall(TodoApiService(dio, baseUrl: endpoint).getTodos());
    result.when(
      success: (data) {
        return data.map((e) => e.toModel());
      },
      error: (error) {
        return error;
      }
    );
  }

  @override
  Future<Result<TodoModel>> getTodoDetail(int todoId) {
    // TODO: implement getTodoDetail
    throw UnimplementedError();
  }
}
