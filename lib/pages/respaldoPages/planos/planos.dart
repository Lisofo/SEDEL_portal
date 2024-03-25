import 'package:flutter/material.dart';
import 'package:portal_maqueta/pages/respaldoPages/planos/planos_desktop.dart';
import 'package:portal_maqueta/pages/respaldoPages/planos/planos_mobile.dart';

class Planos extends StatefulWidget {
  const Planos({super.key});

  @override
  State<Planos> createState() => _PlanosState();
}

class _PlanosState extends State<Planos> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 800) {
            return const PlanosMobile();
          } else if (constraints.maxWidth > 900) {
            return const PlanosDesktop();
          }
          return PlanosDesktop();
        },
      ),
    ));
  }
}