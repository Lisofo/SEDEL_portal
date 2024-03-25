import 'package:flutter/material.dart';

import 'reportes_desktop.dart';
import 'reportes_mobile.dart';

class ReportesMenusales extends StatefulWidget {
  const ReportesMenusales({super.key});

  @override
  State<ReportesMenusales> createState() => _ReportesMenusalesState();
}

class _ReportesMenusalesState extends State<ReportesMenusales> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 800) {
            return const ReportesMobile();
          } else if (constraints.maxWidth > 900) {
            return const ReportesDesktop();
          }
          return ReportesDesktop();
        },
      )),
    );
  }
}
