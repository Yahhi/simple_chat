import 'package:flutter/material.dart';
import 'package:simple_chat/client/loader.dart';
import 'package:simple_chat/model/todo.dart';
import 'package:simple_chat/widgets/todo_item.dart';

class TodoList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TodoListState();
  }
}

class _TodoListState extends State<TodoList> with AutomaticKeepAliveClientMixin {
  List<Todo> _todos;

  @override
  void initState() {
    super.initState();
    _loadTodos();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Stack(
      children: [
        if (_todos != null)
          ListView.builder(
            itemBuilder: _userBuilder,
            itemCount: _todos.length,
          ),
        if (_todos == null) const Center(child: CircularProgressIndicator())
      ],
    );
  }

  Widget _userBuilder(BuildContext context, int index) => TodoItem(_todos[index]);

  Future<void> _loadTodos() async {
    final result = await Loader.getTodos();
    if (result != null) {
      setState(() {
        _todos = result;
      });
    }
  }

  @override
  bool get wantKeepAlive => true;
}
