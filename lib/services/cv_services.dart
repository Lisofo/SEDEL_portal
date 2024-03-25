import 'package:dio/dio.dart';
import 'package:portal_maqueta/config/config.dart';
import 'package:portal_maqueta/models/clients.dart';
import 'package:portal_maqueta/models/constanciasVisita.dart';
import 'package:portal_maqueta/models/servicios_contratados.dart';

class PortalServices {
  final _dio = Dio();

  String apiUrl = Config.APIURL;
  String apiFsUrl = Config.APIFSURL;

  late String apiLink = apiUrl;
  late String apiFsLink = apiFsUrl;

  Future<List<DocPortal>> getDocumentos(
      String codCliente, String categ, String orden) async {
    String link = apiFsLink;

    try {
      print(codCliente);
      print(categ);
      var resp = await _dio.request(
          link += 'clientes/$codCliente/$categ?orden=$orden',
          options: Options(method: 'GET'));

      final List<dynamic> docList = resp.data;
      return docList.map((obj) => DocPortal.fromJson(obj)).toList();
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<ClientePortal>> getClientes(String uId, String token) async {
    String link = apiLink;

    try {
      print(uId);
      var headers = {'Authorization': token};
      var resp = await _dio.request(
        link += 'api/v1/usuarios/$uId/clientes',
        options: Options(
          method: 'GET',
          headers: headers,
        ),
      );
      final List<dynamic> clientList = resp.data;
      return clientList.map((obj) => ClientePortal.fromJson(obj)).toList();
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<ServiciosContratados>> getServicios(
      String clienteId, String token) async {
    String link = apiLink;

    try {
      print(clienteId);
      var headers = {'Authorization': token};
      var resp = await _dio.request(
        link += 'api/v1/clientes/$clienteId/servicios',
        options: Options(
          method: 'GET',
          headers: headers,
        ),
      );
      final List<dynamic> serviceList = resp.data;
      return serviceList
          .map((obj) => ServiciosContratados.fromJson(obj))
          .toList();
    } catch (e) {
      print(e);
      return [];
    }
  }
}
