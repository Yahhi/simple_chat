import 'package:flutter/material.dart';
import 'package:simple_chat/client/loader.dart';
import 'package:simple_chat/model/user.dart';
import 'package:simple_chat/widgets/user_item.dart';

class UsersList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _UsersListState();
  }
}

class _UsersListState extends State<UsersList> with AutomaticKeepAliveClientMixin {
  List<User> _users;
  List<bool> _selected;

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Stack(
      children: [
        if (_users != null)
          ListView.builder(
            itemBuilder: _userBuilder,
            itemCount: _users.length,
          ),
        if (_users == null) const Center(child: CircularProgressIndicator())
      ],
    );
  }

  Widget _userBuilder(BuildContext context, int index) => UserItem(
        user: _users[index],
        onSelect: () => _changeSelection(index),
        isSelected: _selected[index],
      );

  Future<void> _loadUsers() async {
    final result = await Loader.getUsers();
    if (result != null) {
      setState(() {
        _users = result;
        _selected = List.filled(result.length, false);
      });
    }
  }

  @override
  bool get wantKeepAlive => true;

  void _changeSelection(int index) {
    setState(() {
      _selected[index] = !_selected[index];
    });
  }
}
