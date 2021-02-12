
import 'package:flutter_stacked_arch_retrofit/feature/todo/data/model/todo_model.dart';
import 'package:flutter_stacked_arch_retrofit/feature/todo/domain/entity/todo_entity.dart';

extension EntityModelMapper on TodoEntity {
  TodoModel toModel() {
    return TodoModel(userId, id, title, completed);
  }
}