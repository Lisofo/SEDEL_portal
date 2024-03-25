import 'package:flutter/material.dart';
import 'package:portal_maqueta/pages/paginasClientes/paginas_desktop.dart';
import 'package:portal_maqueta/pages/paginasClientes/paginas_mobile.dart';

class PaginaCliente extends StatefulWidget {
  const PaginaCliente({super.key});

  @override
  State<PaginaCliente> createState() => _PaginaClienteState();
}

class _PaginaClienteState extends State<PaginaCliente> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 800) {
            return const PaginasClientesMobile();
          } else if (constraints.maxWidth > 900) {
            return const PaginasClientesDesktop();
          }
          return PaginasClientesDesktop();
        },
      ),
    ));
  }
}
