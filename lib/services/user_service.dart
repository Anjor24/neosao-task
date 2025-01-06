import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class UserService {
  static const String _baseUrl = 'https://dummyapi.io/data/v1/user';

  Future<List<User>> fetchUsers({required int page, required int limit}) async {
    final response = await http.get(
      Uri.parse('$_baseUrl?limit=$limit&page=$page'),
      headers: {'app-id': '666a92cbe42133bf4cdb3081'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['data'];
      return data.map((item) => User.fromJson(item)).toList();
    } else {
      throw Exception('Failed to fetch users');
    }
  }
}
