import 'package:http/http.dart' as http;
import './Users.dart';
import '../models/usersJason.dart';

class Services {
  static const String url = "https://jsonplaceholder.typicode.com/users";

  static Future<List<User>> getUserFromJson() async {
    final List<User> users = userFromJson(usersJson);
    return users;
  }

  static Future<List<User>> getUser() async {
    try {
      final response = await http.get(url);
      // print(response);
      if (200 == response.statusCode) {
        print("response.body"); // ${response.body}
        final List<User> users = userFromJson(response.body);
        return users;
      } else {
        print("response.statusCode: ${response.statusCode}");
        return List<User>();
      }
    } catch (e) {
      print(e);
      return List<User>();
    }
  }
}
