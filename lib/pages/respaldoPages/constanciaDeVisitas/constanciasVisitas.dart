import 'package:flutter/material.dart';
import 'package:portal_maqueta/pages/respaldoPages/constanciaDeVisitas/constancia_desktop.dart';
import 'package:portal_maqueta/pages/respaldoPages/constanciaDeVisitas/constancia_mobile.dart';

class ConstanciaVisitas extends StatefulWidget {
  const ConstanciaVisitas({super.key});

  @override
  State<ConstanciaVisitas> createState() => _ConstanciaVisitasState();
}

class _ConstanciaVisitasState extends State<ConstanciaVisitas> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 800) {
            return const ConstanciaVisitasMobile();
          } else if (constraints.maxWidth > 900) {
            return const ConstanciaVisitasDesktop();
          }
          return ConstanciaVisitasDesktop();
        },
      ),
    ));
  }
}
