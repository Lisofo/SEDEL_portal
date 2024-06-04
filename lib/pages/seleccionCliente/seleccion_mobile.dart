import 'package:flutter/material.dart';
import 'package:portal_maqueta/models/clients.dart';
import 'package:portal_maqueta/providers/menu_providers.dart';
import 'package:provider/provider.dart';

import '../../services/portal_services.dart';

class SeleccionMobile extends StatefulWidget {
  const SeleccionMobile({super.key});

  @override
  State<SeleccionMobile> createState() => _SeleccionMobileState();
}

class _SeleccionMobileState extends State<SeleccionMobile> {
  late List<ClientePortal> clientes = [];

  @override
  void initState() {
    super.initState();
    getClient();
  }

  void getClient() async {
    late String uId = context.read<MenuProvider>().uid;
    late String token = context.read<MenuProvider>().token;
    clientes = (await PortalServices().getClientes(uId, token));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 52, 120, 62),
        title: Image.asset('images/logoPortal.png'),
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Color.fromARGB(255, 52, 120, 62),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Expanded(
                child: ListView.separated(
              itemCount: clientes.length,
              itemBuilder: (context, index) {
                final _clientes = clientes[index];
                return ListTile(
                  leading: Icon(Icons.person),
                  title: Text(
                    _clientes.cliente,
                    textAlign: TextAlign.center,
                  ),
                  subtitle: Text(
                    _clientes.codCliente,
                    textAlign: TextAlign.center,
                  ),
                  onTap: () {
                    context.read<MenuProvider>().setClient(_clientes);
                    Navigator.pushNamed(context, 'panelClientes');
                  },
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  thickness: 3,
                  color: Colors.green,
                );
              },
            ))
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          elevation: 0,
          child: IconButton.filledTonal(
              onPressed: () {
                logout();
              },
              icon: Icon(Icons.logout))),
    ));
  }

  void logout() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Cerrar sesion'),
          content: Text('Esta seguro de querer cerrar sesion?'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancelar')),
            TextButton(
                onPressed: () {
                  Provider.of<MenuProvider>(context, listen: false)
                      .setToken('');
                  Navigator.pushReplacementNamed(context, '/');
                },
                child: Text(
                  'Cerrar Sesion',
                  style: TextStyle(color: Colors.red),
                )),
          ],
        );
      },
    );
  }
}
