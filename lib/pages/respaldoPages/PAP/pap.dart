import 'package:flutter/material.dart';
import 'package:portal_maqueta/pages/respaldoPages/PAP/pap_desktop.dart';
import 'package:portal_maqueta/pages/respaldoPages/PAP/pap_mobile.dart';


class PlanAnualYProtocolo extends StatefulWidget {
  const PlanAnualYProtocolo({super.key});

  @override
  State<PlanAnualYProtocolo> createState() => _PlanAnualYProtocoloState();
}

class _PlanAnualYProtocoloState extends State<PlanAnualYProtocolo> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 800) {
            return const PapMobile();
          } else if (constraints.maxWidth > 900) {
            return const PapDesktop();
          }
          return PapDesktop();
        },
      ),
    ));
  }
}
