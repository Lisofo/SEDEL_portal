import 'package:flutter/material.dart';
import 'package:portal_maqueta/providers/menu_providers.dart';
import 'package:provider/provider.dart';

class FooterMobile extends StatelessWidget {
  const FooterMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color.fromARGB(255, 52, 120, 62),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            TextButton(
                style: ButtonStyle(
                    foregroundColor: MaterialStatePropertyAll(Colors.white)),
                onPressed: () {
                  Provider.of<MenuProvider>(context, listen: false)
                      .setPage('PT');
                  Provider.of<MenuProvider>(context, listen: false)
                      .setPageName('Personal Tecnico de Sedel');
                  Navigator.pushNamed(context, 'general');
                },
                child: Text('Personal Tecnico de Sedel')),
            TextButton(
                style: ButtonStyle(
                    foregroundColor: MaterialStatePropertyAll(Colors.white)),
                onPressed: () {
                  Provider.of<MenuProvider>(context, listen: false)
                      .setPage('PROD');

                  Provider.of<MenuProvider>(context, listen: false).setPageName(
                      'Productos Plaguicidas / Desinfectantes / etc.');
                  Navigator.pushNamed(context, 'general');
                },
                child: Text('Productos Plaguicidas / Desinfectantes / etc.')),
            TextButton(
                style: ButtonStyle(
                    foregroundColor: MaterialStatePropertyAll(Colors.white)),
                onPressed: () {
                  Provider.of<MenuProvider>(context, listen: false)
                      .setPage('HAB');
                  Provider.of<MenuProvider>(context, listen: false)
                      .setPageName('Habilitaciones de Sedel');
                  Navigator.pushNamed(context, 'general');
                },
                child: Text('Habilitaciones de Sedel')),
            TextButton(
                style: ButtonStyle(
                    foregroundColor: MaterialStatePropertyAll(Colors.white)),
                onPressed: () {
                  Provider.of<MenuProvider>(context, listen: false)
                      .setPage('NYC');
                  Provider.of<MenuProvider>(context, listen: false)
                      .setPageName('Notas / Comunicados');
                  Navigator.pushNamed(context, 'general');
                },
                child: Text('Notas / Comunicados')),
          ],
        ));
  }
}
