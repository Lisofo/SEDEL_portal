import 'package:flutter/material.dart';
import 'package:portal_maqueta/pages/respaldoPages/informes/informes_desktop.dart';
import 'package:portal_maqueta/pages/respaldoPages/informes/informes_mobile.dart';


class Informes extends StatefulWidget {
  const Informes({super.key});

  @override
  State<Informes> createState() => _InformesState();
}

class _InformesState extends State<Informes> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 800) {
            return const InformesMobile();
          } else if (constraints.maxWidth > 900) {
            return const InformesDesktop();
          }
          return InformesDesktop();
        },
      ),
    ));
  }
}
