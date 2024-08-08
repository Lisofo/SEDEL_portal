import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:portal_maqueta/models/constancia_visita.dart';

import '../config/config.dart';

class ConstanciaVisitaServices {
  final _dio = Dio();

  String apiUrl = Config.APIURL;
  String apiFsUrl = Config.APIFSURL;

  late String apiLink = '${apiUrl}api/v1/clientes/';
  late String apiFsLink = apiFsUrl;

  static void showErrorDialog(BuildContext context, String errorMessage) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Mensaje'),
          content: Text(errorMessage),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }

  Future getCVs(BuildContext context, int clienteId, String fechaDesde, String fechaHasta, String categ, String token) async {
    bool yaTieneFiltro = false;
    String link = '$apiLink$clienteId/informes/$categ';
    if (fechaDesde != '') {
      link += '?fechaDesde=$fechaDesde';
      yaTieneFiltro = true;
    }
    if (fechaHasta != '') {
      yaTieneFiltro ? link += '&' : link += '?';
      link += 'fechaHasta=$fechaHasta';
      yaTieneFiltro = true;
    }

    print(link);
    try {
      var headers = {'Authorization': token};
      var resp = await _dio.request(
        link,
        options: Options(
          method: 'GET',
          headers: headers,
        ),
      );

      final List<dynamic> cvList = resp.data;
      var retorno = cvList.map((obj) => ConstanciaVisita.fromJson(obj)).toList();
      print(retorno.length);
      return retorno;
    } catch (e) {
      if (e is DioException) {
        if (e.response != null) {
          final responseData = e.response!.data;
          if (responseData != null) {
            if(e.response!.statusCode == 403){
              showErrorDialog(context, 'Error: ${e.response!.data['message']}');
            }else{
              final errors = responseData['errors'] as List<dynamic>;
              final errorMessages = errors.map((error) {
              return "Error: ${error['message']}";
            }).toList();
            showErrorDialog(context, errorMessages.join('\n'));
          }
          } else {
            showErrorDialog(context, 'Error: ${e.response!.data}');
          }
        } else {
          showErrorDialog(context, 'Error: ${e.message}');
        }
      }
    }

  }
}