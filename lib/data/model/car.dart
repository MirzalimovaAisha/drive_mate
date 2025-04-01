import 'dart:convert';
import 'dart:io';

CarModel carModelFromJson(String str) {
  final jsonData = json.decode(str);
  return CarModel.fromJson(jsonData);
}

String carModelToJson(CarModel data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class CarModel {
  String carNo;
  String carNm;

  CarModel({
    required this.carNo,
    required this.carNm,
  });

  factory CarModel.fromJson(Map<String, dynamic> json) => new CarModel(
    carNo: json["carNo"],
    carNm: json["carNm"],
  );

  Map<String, dynamic> toJson() => {
    "carNo": carNo,
    "carNm": carNm,
  };
}
