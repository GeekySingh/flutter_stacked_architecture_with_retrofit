

import 'package:dio/dio.dart';
import 'package:flutter_stacked_arch_retrofit/common/network/result.dart';
import 'package:flutter_stacked_arch_retrofit/feature/todo/domain/entity/todo_entity.dart';
import 'package:retrofit/http.dart';

part 'todo_api_service.g.dart';

/// this service class is similar as Retrofit service (Android)
/// where we need to declare api type, parameters and return type etc.
/// build_runner tool will generate the code for this service
@RestApi()
abstract class TodoApiService {

  factory TodoApiService(Dio dio, {String baseUrl}) = _TodoApiService;

  @GET("todos")
  Future<List<TodoEntity>> getTodos();

  @GET("todos/{id}")
  Future<TodoEntity> getTodoDetail(@Path("id") int todoId);

}