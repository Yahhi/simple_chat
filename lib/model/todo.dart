import 'package:json_annotation/json_annotation.dart';

part 'todo.g.dart';

@JsonSerializable(nullable: true)
class Todo {
  Todo(this.userId, this.id, this.title, this.completed);

  final int userId;
  final int id;
  final String title;
  final bool completed;

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);
  Map<String, dynamic> toJson() => _$TodoToJson(this);
}
