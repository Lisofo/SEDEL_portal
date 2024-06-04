import 'package:flutter/material.dart';
import 'package:portal_maqueta/models/clients.dart';
import 'package:portal_maqueta/providers/menu_providers.dart';
import 'package:portal_maqueta/services/portal_services.dart';
import 'package:provider/provider.dart';

class SeleccionDesktop extends StatefulWidget {
  const SeleccionDesktop({super.key});

  @override
  State<SeleccionDesktop> createState() => _SeleccionDesktopState();
}

class _SeleccionDesktopState extends State<SeleccionDesktop> {
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
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('images/logoPortal.png'),
        backgroundColor: Color.fromARGB(255, 52, 120, 62),
        automaticallyImplyLeading: false,
        actions: [
          TextButton.icon(
            onPressed: (){ logout(); }, 
            icon: const Icon(Icons.logout,color: Colors.white,), 
            label: const Text('Cerrar Sesión', style: TextStyle(color: Colors.white),)
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.separated(
            itemCount: clientes.length,
            itemBuilder: (context, index) {
              final _clientes = clientes;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 300),
                child: ListTile(
                  title: Text(
                    _clientes[index].cliente,
                    textAlign: TextAlign.center,
                  ),
                  subtitle: Text(
                    _clientes[index].codCliente,
                    textAlign: TextAlign.center,
                  ),
                  onTap: () {
                    context.read<MenuProvider>().setClient(_clientes[index]);
                    Navigator.pushNamed(context, 'panelClientes');
                  },
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 300),
                child: Divider(
                  thickness: 3,
                  color: Colors.green,
                ),
              );
            },
          ))
        ],
      ),
    );
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
