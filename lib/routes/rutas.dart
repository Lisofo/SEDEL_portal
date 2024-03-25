import 'package:flutter/material.dart';
import 'package:portal_maqueta/pages/general/general.dart';
import 'package:portal_maqueta/pages/login/login.dart';
import 'package:portal_maqueta/pages/paginasClientes/paginas_clientes.dart';
import 'package:portal_maqueta/pages/panelClientes/panel_clientes.dart';
import 'package:portal_maqueta/pages/respaldoPages/PAP/pap.dart';
import 'package:portal_maqueta/pages/respaldoPages/constanciaDeVisitas/constanciasVisitas.dart';
import 'package:portal_maqueta/pages/respaldoPages/informes/informes.dart';
import 'package:portal_maqueta/pages/respaldoPages/planos/planos.dart';
import 'package:portal_maqueta/pages/respaldoPages/reportesMensuales/reportes_mensuales.dart';

import 'package:portal_maqueta/pages/seleccionCliente/seleccion_cliente.dart';

Map<String, WidgetBuilder> getAppRoute() {
  return <String, WidgetBuilder>{
    '/': (context) => Login(),
    'seleccionCliente': (context) => SeleccionCliente(),
    'panelClientes': (context) => PanelClientes(),
    "constanciaVisita": (context) => ConstanciaVisitas(),
    "reportesMensuales": (context) => ReportesMenusales(),
    "informes": (context) => Informes(),
    "planos": (context) => Planos(),
    "planAnualYProtocolo": (context) => PlanAnualYProtocolo(),
    "general": (context) => General(),
    "paginaCliente": (context) => PaginaCliente(),
  };
}
