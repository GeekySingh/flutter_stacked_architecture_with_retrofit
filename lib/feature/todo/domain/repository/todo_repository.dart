
import 'package:flutter_stacked_arch_retrofit/common/network/repository/base_repository.dart';
import 'package:flutter_stacked_arch_retrofit/common/network/result.dart';
import 'package:flutter_stacked_arch_retrofit/feature/todo/data/model/todo_model.dart';
import 'package:flutter_stacked_arch_retrofit/feature/todo/domain/entity/todo_entity.dart';

/// Repository layer will fetch data from service layer.
/// Two things to note here that
/// 1. Repository will return api success/failure information
/// 2. Service layer returns list of todo entities
/// and repository layer is returning list of todo models. So repository
/// layer will perform entity to model mapping and then will return data to
/// presentation layer
abstract class TodoRepository extends BaseRepository {

  Future<Result<List<TodoModel>>> getTodos();

  Future<Result<TodoModel>> getTodoDetail(int todoId);
}