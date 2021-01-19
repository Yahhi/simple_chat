import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(nullable: true)
class User {
  User(this.id, this.name, this.username, this.email);

  final int id;
  final String name;
  final String username;
  final String email;

  String get initialLetters => name.split(' ').fold('', (previousValue, element) => previousValue + element[0]);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
