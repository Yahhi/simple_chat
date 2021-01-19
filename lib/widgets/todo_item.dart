import 'package:flutter/material.dart';
import 'package:simple_chat/model/todo.dart';

class TodoItem extends StatelessWidget {
  const TodoItem(
    this.todo, {
    Key key,
  }) : super(key: key);

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(todo.title),
      enabled: false,
      tileColor: todo.completed ? Colors.green : Colors.white,
    );
  }
}
