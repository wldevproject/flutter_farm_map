// To parse this JSON data, do
//
//     final lokasiUtamaRequestModel = lokasiUtamaRequestModelFromJson(jsonString);

import 'dart:convert';

LokasiUtamaRequestModel lokasiUtamaRequestModelFromJson(String str) =>
    LokasiUtamaRequestModel.fromJson(json.decode(str));

String lokasiUtamaRequestModelToJson(LokasiUtamaRequestModel data) =>
    json.encode(data.toJson());

class LokasiUtamaRequestModel {
  final int? status;
  final String? message;
  final Result? result;

  LokasiUtamaRequestModel({
    this.status,
    this.message,
    this.result,
  });

  factory LokasiUtamaRequestModel.fromJson(Map<String, dynamic> json) =>
      LokasiUtamaRequestModel(
        status: json["status"],
        message: json["message"],
        result: json["result"] == null ? null : Result.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "result": result?.toJson(),
      };
}

class Result {
  final int? idTitik;
  final String? longitude;
  final String? latitude;
  final String? batas;

  Result({
    this.idTitik,
    this.longitude,
    this.latitude,
    this.batas,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        idTitik: json["idTitik"],
        longitude: json["longitude"],
        latitude: json["latitude"],
        batas: json["batas"],
      );

  Map<String, dynamic> toJson() => {
        "idTitik": idTitik,
        "longitude": longitude,
        "latitude": latitude,
        "batas": batas,
      };
}
