import 'package:dio/dio.dart';
import 'package:simple_chat/model/todo.dart';
import 'package:simple_chat/model/user.dart';

class Loader {
  static const _todoAddress = 'https://jsonplaceholder.typicode.com/todos/';
  static const _userAddress = 'https://jsonplaceholder.typicode.com/users/';

  final client = Dio();

  static Future<List<Todo>> getTodos() async {
    try {
      final response = await Dio().get<List<dynamic>>(_todoAddress);
      print(response);
      return response.data.map((dynamic e) => Todo.fromJson(e)).toList(growable: false);
    } catch (e) {
      print(e);
      return <Todo>[];
    }
  }

  static Future<List<User>> getUsers() async {
    try {
      final response = await Dio().get<List<dynamic>>(_userAddress);
      print(response);
      return response.data.map((dynamic e) => User.fromJson(e)).toList(growable: false);
    } catch (e) {
      print(e);
      return <User>[];
    }
  }
}
