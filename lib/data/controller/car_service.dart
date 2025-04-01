import 'package:drive_mate/data/model/car.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CarService {
  final String tkn = "4297BE7D2A604F7890B7F31A70EE0693";

  Future<Map<String, dynamic>> carData(String name, String number) async {
    final uri = Uri.parse("http://api.db.pe.kr:51092/api/car-noupload");

    var request = http.MultipartRequest("POST", uri)
      ..headers.addAll({
        "Authorization": "Bearer $tkn",
        "Content-Type": "multipart/form-data",
      })
      ..fields['carNm'] = name
      ..fields['carNo'] = number;

    var response = await request.send();
    var responseBody = await response.stream.bytesToString();

    print("응답 상태 코드: ${response.statusCode}");
    print("응답 본문: $responseBody");

    if (response.statusCode == 200) {
      final data = jsonDecode(responseBody);
      return data;
    } else {
      throw Exception('차량 등록 실패: $responseBody');
    }
  }
}
