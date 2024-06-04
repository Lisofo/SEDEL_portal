import 'package:flutter/material.dart';
import 'package:portal_maqueta/models/clients.dart';
import 'package:portal_maqueta/providers/menu_providers.dart';
import 'package:portal_maqueta/widgets/icon_string.dart';
import 'package:provider/provider.dart';

import '../../models/servicios_contratados.dart';
import '../../services/portal_services.dart';

class PanelClientesMobile extends StatefulWidget {
  const PanelClientesMobile({super.key});

  @override
  State<PanelClientesMobile> createState() => _PanelClientesMobileState();
}

class _PanelClientesMobileState extends State<PanelClientesMobile> {
  late ClientePortal? cliente;
  late List<ServiciosContratados>? servicios;

  @override
  void initState() {
    super.initState();
    cliente = context.read<MenuProvider>().client;
    servicios = [];
    obtenerServicios();
  }

  void obtenerServicios() async {
    late String clienteId = cliente!.clienteId.toString();
    late String token = context.read<MenuProvider>().token;
    servicios = (await PortalServices().getServicios(clienteId, token));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 52, 120, 62),
        title: Image.asset('images/logoPortal.png'),
        automaticallyImplyLeading: false,
      ),
      endDrawer: Drawer(
        backgroundColor: Color.fromARGB(255, 52, 120, 62),
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            CircleAvatar(
              backgroundColor: Color.fromARGB(255, 52, 120, 62),
              radius: 70,
              backgroundImage: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_kSSoomJ9hiFXmiF2RdZlwx72Y23XsT6iwQ&usqp=CAU'),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Codigo:',
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              cliente!.codCliente,
              style: TextStyle(
                fontSize: 17,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Nombre:',
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              cliente!.cliente,
              style: TextStyle(
                fontSize: 17,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Direccion:',
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              cliente!.direccion,
              style: TextStyle(
                fontSize: 17,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Telefono:',
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              cliente!.telefono1,
              style: TextStyle(
                fontSize: 17,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Correo Electrónico:',
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              cliente!.email,
              style: TextStyle(
                fontSize: 17,
                color: Colors.white,
              ),
            ),
            Spacer(),
            Container(
              width: MediaQuery.of(context).size.width,
              color: Color.fromARGB(255, 52, 120, 62),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 10, bottom: 5),
                child: Text(
                  'Número de teléfono: 23623375 \nInt. 206 y 207 / celular: +598 98 409 523               Correo Electrónico: daiana@sedel.com.uy',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
      backgroundColor: Color.fromARGB(255, 52, 120, 62),
      body: Container(
        color: Colors.white,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Text(
                  'Servicios contratados',
                  style: TextStyle(fontSize: 30, color: Colors.green.shade800),
                ),
              ),
              for (var i = 0; i < servicios!.length; i++) ...[
                Text(
                  servicios![i].servicio,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.green),
                )
              ],
              SizedBox(
                height: 20,
              ),
              _botones(),
              SizedBox(
                height: 20,
              ),
              _botonesGenerales()
            ],
          ),
        ),
      ),
      floatingActionButton: CircleAvatar(
        radius: 30,
        backgroundColor: Colors.white,
        child: CircleAvatar(
          backgroundColor: Color.fromARGB(255, 52, 120, 62),
          radius: 28,
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              )),
        ),
      ),
    );
  }

  Widget _botones() {
    return FutureBuilder(
        future: menuProvider.cargarData(),
        initialData: [],
        builder: (context, snapshot) {
          return Wrap(
            direction: Axis.vertical,
            alignment: WrapAlignment.center,
            spacing: 15,
            runSpacing: 40.0,
            children: _filaBotones(snapshot.data, context),
          );
        });
  }

  List<Widget> _filaBotones(data, context) {
    final List<Widget> opciones = [];
    data.forEach((opt) {
      final widgetTemp = Container(
        height: 70,
        width: 350,
        child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                  WidgetStatePropertyAll(Color.fromARGB(255, 52, 120, 62)),
            ),
            onPressed: () {
              Provider.of<MenuProvider>(context, listen: false)
                  .setPageName(opt['texto']);

              Provider.of<MenuProvider>(context, listen: false)
                  .setPage(opt['categ']);
              Navigator.pushNamed(context, opt['ruta']);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                getIcon(opt['icon']),
                SizedBox(
                  width: 20,
                ),
                Text(
                  opt['texto'],
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ],
            )),
      );
      opciones.add(widgetTemp);
    });
    return opciones;
  }

  Widget _botonesGenerales() {
    return FutureBuilder(
        future: menuProvider.cargarDataGeneral(),
        initialData: [],
        builder: (context, snapshot) {
          return Wrap(
            direction: Axis.vertical,
            alignment: WrapAlignment.center,
            spacing: 15,
            runSpacing: 40.0,
            children: _filaBotonesGenerales(snapshot.data, context),
          );
        });
  }

  List<Widget> _filaBotonesGenerales(data, context) {
    final List<Widget> opcionesGenerales = [];
    data.forEach((opt) {
      final widgetTemp = Container(
        height: 70,
        width: 350,
        child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                  WidgetStatePropertyAll(Color.fromARGB(255, 52, 120, 62)),
            ),
            onPressed: () {
              Provider.of<MenuProvider>(context, listen: false)
                  .setPageName(opt['texto']);

              Provider.of<MenuProvider>(context, listen: false)
                  .setPage(opt['categ']);

              Navigator.pushNamed(context, opt['ruta']);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                getIcon(opt['icon']),
                SizedBox(
                  width: 20,
                ),
                Text(
                  opt['texto'],
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              ],
            )),
      );
      opcionesGenerales.add(widgetTemp);
    });
    return opcionesGenerales;
  }
}
