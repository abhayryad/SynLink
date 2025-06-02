import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:synlink_app/features/auth/data/models/user_model.dart';

class AuthRemoteDataSource {
  final String baseUrl = 'http://10.0.2.2:7000/auth';


  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body)['user']);
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<UserModel> register({
    required String username,
    required String email,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register'),
      body: jsonEncode({
        'username': username,
        'email': email,
        'password': password,
      }),
      headers: {'Content-Type': 'application/json'} 
    );

    print(response.body);

    return UserModel.fromJson(jsonDecode(response.body)['user']);
  }
}
