// To parse this JSON data, do
//
//     final reporteMensual = reporteMensualFromJson(jsonString);

import 'dart:convert';

List<ReporteMensual> reporteMensualFromJson(String str) => List<ReporteMensual>.from(json.decode(str).map((x) => ReporteMensual.fromJson(x)));

String reporteMensualToJson(List<ReporteMensual> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ReporteMensual {
  late String filename;
  late String filepath;
  late dynamic notificado;
  late DateTime fecha;

  ReporteMensual({
    required this.filename,
    required this.filepath,
    required this.notificado,
    required this.fecha,
  });

  factory ReporteMensual.fromJson(Map<String, dynamic> json) => ReporteMensual(
    filename: json["filename"] as String? ?? '',
    filepath: json["filepath"] as String? ?? '',
    notificado: json["notificado"],
    fecha: DateTime.parse(json["fecha"]),
  );

  Map<String, dynamic> toJson() => {
    "filename": filename,
    "filepath": filepath,
    "notificado": notificado,
    "fecha": fecha.toIso8601String(),
  };

  ReporteMensual.empty() {
    filename = '';
    filepath = '';
    notificado = null;
    fecha = DateTime.now();
  }
}
