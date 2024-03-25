import 'package:flutter/material.dart';
import 'package:portal_maqueta/pages/general/general_desktop.dart';
import 'package:portal_maqueta/pages/general/general_mobile.dart';

class General extends StatefulWidget {
  const General({super.key});

  @override
  State<General> createState() => _GeneralState();
}

class _GeneralState extends State<General> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 800) {
            return const VistaGeneralMobile();
          } else if (constraints.maxWidth > 900) {
            return const VistaGeneralDesktop();
          }
          return VistaGeneralDesktop();
        },
      ),
    ));
  }
}
