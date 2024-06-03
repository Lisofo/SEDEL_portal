import 'package:flutter/material.dart';
import 'package:portal_maqueta/providers/menu_providers.dart';
import 'package:provider/provider.dart';

class FooterDesktop extends StatelessWidget {
  const FooterDesktop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Flexible(
              child: TextButton(
                  style: ButtonStyle(
                      foregroundColor: WidgetStatePropertyAll(Colors.black)),
                  onPressed: () {
                    Provider.of<MenuProvider>(context, listen: false)
                        .setPage('PT');
                    Provider.of<MenuProvider>(context, listen: false)
                        .setPageName('Personal Tecnico de Sedel');
                    Navigator.pushNamed(context, 'general');
                  },
                  child: Text('Personal Tecnico de Sedel')),
            ),
            Text(
              ' | ',
              style: TextStyle(color: Colors.white),
            ),
            Flexible(
              child: TextButton(
                  style: ButtonStyle(
                      foregroundColor: WidgetStatePropertyAll(Colors.black)),
                  onPressed: () {
                    Provider.of<MenuProvider>(context, listen: false)
                        .setPage('PROD');
                    Provider.of<MenuProvider>(context, listen: false)
                        .setPageName(
                            'Productos Plaguicidas / Desinfectantes / etc.');
                    Navigator.pushNamed(context, 'general');
                  },
                  child: Text('Productos Plaguicidas / Desinfectantes / etc.')),
            ),
            Text(
              ' | ',
              style: TextStyle(color: Colors.white),
            ),
            Flexible(
              child: TextButton(
                  style: ButtonStyle(
                      foregroundColor: WidgetStatePropertyAll(Colors.black)),
                  onPressed: () {
                    Provider.of<MenuProvider>(context, listen: false)
                        .setPage('HAB');
                    Provider.of<MenuProvider>(context, listen: false)
                        .setPageName('Habilitaciones de Sedel');
                    Navigator.pushNamed(context, 'general');
                  },
                  child: Text('Habilitaciones de Sedel')),
            ),
            Text(
              ' | ',
              style: TextStyle(color: Colors.white),
            ),
            Flexible(
              child: TextButton(
                  style: ButtonStyle(
                      foregroundColor: WidgetStatePropertyAll(Colors.black)),
                  onPressed: () {
                    Provider.of<MenuProvider>(context, listen: false)
                        .setPage('NYC');
                    Provider.of<MenuProvider>(context, listen: false)
                        .setPageName('Notas / Comunicados');
                    Navigator.pushNamed(context, 'general');
                  },
                  child: Text('Notas / Comunicados')),
            ),
          ],
        ));
  }
}
