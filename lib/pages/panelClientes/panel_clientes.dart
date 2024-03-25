import 'package:flutter/material.dart';
import 'package:portal_maqueta/pages/panelClientes/panel_desktop.dart';

import 'panel_mobile.dart';

class PanelClientes extends StatefulWidget {
  const PanelClientes({super.key});

  @override
  State<PanelClientes> createState() => _PanelClientesState();
}

class _PanelClientesState extends State<PanelClientes> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 800) {
            return const PanelClientesMobile();
          } else if (constraints.maxWidth > 900) {
            return const PanelClientesDesktop();
          }
          return PanelClientesDesktop();
        },
      ),
    ));
  }
}
