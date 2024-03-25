class DocPortal {
  late int Id;
  late String nombre;
  late String url;

  DocPortal({
    required this.Id,
    required this.nombre,
    required this.url,
  });

  static DocPortal fromJson(Map json) => DocPortal(
        Id: 0,
        nombre: json['name'] as String? ?? '',
        url: json['url'] as String? ?? '',
      );

  @override
  String toString() {
    return 'Instance of Constancia: $nombre';
  }
}
