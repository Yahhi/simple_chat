import 'package:flutter/material.dart';
import 'package:simple_chat/model/user.dart';

class UserItem extends StatelessWidget {
  const UserItem({Key key, @required this.user, this.onSelect, this.isSelected = false}) : super(key: key);

  final User user;
  final bool isSelected;
  final VoidCallback onSelect;

  Widget get _avatar => Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.red[500],
            ),
            borderRadius: const BorderRadius.all(Radius.circular(25))),
        child: Center(
          child: Text(
            user.initialLetters,
            maxLines: 1,
            overflow: TextOverflow.fade,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(user.username, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      subtitle: Text(user.name),
      leading: _avatar,
      selected: isSelected,
      onTap: onSelect,
    );
  }
}
