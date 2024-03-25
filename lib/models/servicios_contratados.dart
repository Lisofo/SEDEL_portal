class ServiciosContratados {
  late int codServicioId;
  late String servicio;

  ServiciosContratados({
    required this.codServicioId,
    required this.servicio,
  });

  factory ServiciosContratados.fromJson(Map<String, dynamic> json) =>
      ServiciosContratados(
          codServicioId: json['codServicioId'] as int? ?? 0,
          servicio: json['servicio']);

  ServiciosContratados.empty() {
    codServicioId = 0;
    servicio = '';
  }
}
