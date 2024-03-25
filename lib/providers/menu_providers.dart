import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:portal_maqueta/models/clients.dart';

class MenuProvider with ChangeNotifier {
  List<dynamic> opciones = [];
  List<dynamic> opcionesGenerales = [];

  MenuProvider() {
    cargarData();
  }

  Future<List<dynamic>> cargarData() async {
    final resp = await rootBundle.loadString('data/menu_opts.json');

    Map dataMap = json.decode(resp);
    opciones = dataMap['rutas'];

    return opciones;
  }

  Future<List<dynamic>> cargarDataGeneral() async {
    final resp = await rootBundle.loadString('data/menu_general.json');

    Map dataMap = json.decode(resp);
    opcionesGenerales = dataMap['rutas'];

    return opcionesGenerales;
  }

  String _menu = '';
  String get menu => _menu;

  void setPage(String codPages) {
    _menu = codPages;
    notifyListeners();
  }

  String _menuName = '';
  String get menuName => _menuName;

  void setPageName(String codPagesName) {
    _menuName = codPagesName;
    notifyListeners();
  }

  ClientePortal _client = ClientePortal.empty();
  ClientePortal get client => _client;

  void setClient(ClientePortal cliente) {
    _client = cliente;
    notifyListeners();
  }

  String _token = '';
  String get token => _token;

  void setToken(String tok) {
    _token = tok;
    notifyListeners();
  }

  String _uid = '';
  String get uid => _uid;

  void setUId(String id) {
    _uid = id;
    notifyListeners();
  }
}

final menuProvider = new MenuProvider();
