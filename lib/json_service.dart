import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

import 'user_model.dart';

class JsonService {
  static Future<File> _getFile() async {
    final dir = await getApplicationDocumentsDirectory();
    return File("${dir.path}/users.json");
  }

  static Future<void> saveUser(User user) async {
    final file = await _getFile();

    List<dynamic> users = [];

    if (await file.exists()) {
      String content = await file.readAsString();

      if (content.isNotEmpty) {
        users = jsonDecode(content);
      }
    }

    users.add(user.toJson());

    await file.writeAsString(jsonEncode(users));
  }

  static Future<List<User>> getUsers() async {
    final file = await _getFile();

    if (!await file.exists()) {
      return [];
    }

    String content = await file.readAsString();

    if (content.isEmpty) {
      return [];
    }

    List<dynamic> data = jsonDecode(content);

    return data.map((e) => User.fromJson(e)).toList();
  }
}