import 'dart:convert';

SocketSolarPanelModel socketSolarPanelModelFromJson(String str) =>
    SocketSolarPanelModel.fromJson(json.decode(str));

String socketSolarPanelModelToJson(SocketSolarPanelModel data) =>
    json.encode(data.toJson());

class SocketSolarPanelModel {
  String? tegangan;
  String? arus;
  String? daya;
  String? kwh;
  String? suhu;

  SocketSolarPanelModel({
    this.tegangan,
    this.arus,
    this.daya,
    this.kwh,
    this.suhu,
  });

  factory SocketSolarPanelModel.fromJson(Map<String, dynamic> json) =>
      SocketSolarPanelModel(
        tegangan: json["tegangan"],
        arus: json["arus"],
        daya: json["daya"],
        kwh: json["kwh"],
        suhu: json["suhu"],
      );

  Map<String, dynamic> toJson() => {
        "tegangan": tegangan,
        "arus": arus,
        "daya": daya,
        "kwh": kwh,
        "suhu": suhu,
      };
}
