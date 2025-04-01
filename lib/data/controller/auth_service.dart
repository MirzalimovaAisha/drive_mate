import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  final String baseUrl = 'http://api.db.pe.kr:51092/api';

  Future<Map<String, dynamic>> login(String username, String password) async {
    final url = Uri.parse('$baseUrl/authenticate/signin');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded'
      },
      body: {
        'mberId': username,
        'mberPassword': password,
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print('로그인 응답: $data');
      return data;
    } else {
      print('로그인 실패');
      // 실패 시 에러 메시지 포함한 Map 반환
      return {
        "success": false,
        "STATUS_MSG": "HTTP error: ${response.statusCode}"
      };
    }
  }
}
