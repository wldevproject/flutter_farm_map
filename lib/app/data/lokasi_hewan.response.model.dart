// To parse this JSON data, do
//
//     final lokasiHewanResponseModel = lokasiHewanResponseModelFromJson(jsonString);

import 'dart:convert';

LokasiHewanResponseModel lokasiHewanResponseModelFromJson(String str) => LokasiHewanResponseModel.fromJson(json.decode(str));

String lokasiHewanResponseModelToJson(LokasiHewanResponseModel data) => json.encode(data.toJson());

class LokasiHewanResponseModel {
  final List<DataTitik>? dataTitik;
  final DataKandang? dataKandang;

  LokasiHewanResponseModel({
    this.dataTitik,
    this.dataKandang,
  });

  factory LokasiHewanResponseModel.fromJson(Map<String, dynamic> json) => LokasiHewanResponseModel(
    dataTitik: json["dataTitik"] == null ? [] : List<DataTitik>.from(json["dataTitik"]!.map((x) => DataTitik.fromJson(x))),
    dataKandang: json["dataKandang"] == null ? null : DataKandang.fromJson(json["dataKandang"]),
  );

  Map<String, dynamic> toJson() => {
    "dataTitik": dataTitik == null ? [] : List<dynamic>.from(dataTitik!.map((x) => x.toJson())),
    "dataKandang": dataKandang?.toJson(),
  };
}

class DataKandang {
  final String? suhu;
  final String? humidity;
  final String? pulseHeart;
  final String? mq135;

  DataKandang({
    this.suhu,
    this.humidity,
    this.pulseHeart,
    this.mq135,
  });

  factory DataKandang.fromJson(Map<String, dynamic> json) => DataKandang(
    suhu: json["suhu"],
    humidity: json["humidity"],
    pulseHeart: json["pulseHeart"],
    mq135: json["mq135"],
  );

  Map<String, dynamic> toJson() => {
    "suhu": suhu,
    "humidity": humidity,
    "pulseHeart": pulseHeart,
    "mq135": mq135,
  };
}

class DataTitik {
  final int? idSensor;
  final String? suhu;
  final String? humidity;
  final String? longitude;
  final String? latitude;
  final double? jarak;
  final bool? alert;
  final String? message;

  DataTitik({
    this.idSensor,
    this.suhu,
    this.humidity,
    this.longitude,
    this.latitude,
    this.jarak,
    this.alert,
    this.message,
  });

  factory DataTitik.fromJson(Map<String, dynamic> json) => DataTitik(
    idSensor: json["idSensor"],
    suhu: json["suhu"],
    humidity: json["humidity"],
    longitude: json["longitude"],
    latitude: json["latitude"],
    jarak: json["jarak"]?.toDouble(),
    alert: json["alert"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "idSensor": idSensor,
    "suhu": suhu,
    "humidity": humidity,
    "longitude": longitude,
    "latitude": latitude,
    "jarak": jarak,
    "alert": alert,
    "message": message,
  };
}
