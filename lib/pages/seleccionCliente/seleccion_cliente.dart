import 'package:flutter/material.dart';

import 'seleccion_desktop.dart';
import 'seleccion_mobile.dart';

class SeleccionCliente extends StatefulWidget {
  const SeleccionCliente({super.key});

  @override
  State<SeleccionCliente> createState() => _SeleccionClienteState();
}

class _SeleccionClienteState extends State<SeleccionCliente> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 800) {
            return const SeleccionMobile();
          } else if (constraints.maxWidth > 900) {
            return const SeleccionDesktop();
          }
          return SeleccionDesktop();
        },
      )),
    );
  }
}
