// To parse this JSON data, do
//
//     final clientePortal = clientePortalFromJson(jsonString);

import 'dart:convert';

ClientePortal clientePortalFromJson(String str) =>
    ClientePortal.fromJson(json.decode(str));

String clientePortalToJson(ClientePortal data) => json.encode(data.toJson());

class ClientePortal {
  late int usuarioId;
  late String login;
  late String usuario;
  late int clienteId;
  late String codCliente;
  late String cliente;
  late String direccion;
  late String telefono1;
  late dynamic email;

  ClientePortal({
    required this.usuarioId,
    required this.login,
    required this.usuario,
    required this.clienteId,
    required this.codCliente,
    required this.cliente,
    required this.direccion,
    required this.telefono1,
    required this.email,
  });

  factory ClientePortal.fromJson(Map<String, dynamic> json) => ClientePortal(
        usuarioId: json["usuarioId"],
        login: json["login"],
        usuario: json["usuario"],
        clienteId: json["clienteId"],
        codCliente: json["codCliente"],
        cliente: json["cliente"] as String? ?? '',
        direccion: json["direccion"] as String? ?? '',
        telefono1: json["telefono1"] as String? ?? '',
        email: json["email"] as String? ?? '',
      );

  Map<String, dynamic> toJson() => {
        "usuarioId": usuarioId,
        "login": login,
        "usuario": usuario,
        "clienteId": clienteId,
        "codCliente": codCliente,
        "cliente": cliente,
        "direccion": direccion,
        "telefono1": telefono1,
        "email": email,
      };

  ClientePortal.empty() {
    usuarioId = 0;
    login = '';
    usuario = '';
    clienteId = 0;
    codCliente = '';
    cliente = '';
    direccion = '';
    telefono1 = '';
    email = '';
  }

  @override
  String toString() {
    return 'Instance of Client: $usuario';
  }
}
