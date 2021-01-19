import 'package:flutter/material.dart';
import 'package:simple_chat/chat_screen.dart';
import 'package:simple_chat/widgets/todo_list.dart';

import 'widgets/users_list.dart';

class TabsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('App demo'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Users'),
              Tab(text: 'Todo'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            UsersList(),
            TodoList(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _openChat(context),
          child: const Icon(Icons.message),
        ),
      ),
    );
  }

  void _openChat(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute<void>(builder: (BuildContext context) => ChatScreen()),
    );
  }
}
