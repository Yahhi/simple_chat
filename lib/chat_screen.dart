import 'package:flutter/material.dart';
import 'package:simple_chat/model/user.dart';
import 'package:simple_chat/widgets/user_item.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen(
    this.users, {
    Key key,
  }) : super(key: key);

  final List<User> users;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat screen'),
      ),
      body: ListView.builder(
        itemBuilder: _userItem,
        itemCount: users.length,
      ),
    );
  }

  Widget _userItem(BuildContext context, int index) {
    return UserItem(user: users[index]);
  }
}
