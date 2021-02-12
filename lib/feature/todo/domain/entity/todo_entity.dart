
import 'package:json_annotation/json_annotation.dart';

part 'todo_entity.g.dart';

@JsonSerializable()
class TodoEntity {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  TodoEntity(this.userId, this.id, this.title, this.completed);

  factory TodoEntity.fromJson(Map<String, dynamic> json) =>
      _$TodoEntityFromJson(json);

  Map<String, dynamic> toJson() => _$TodoEntityToJson(this);
}