import 'package:flutter/material.dart';
import 'package:portal_maqueta/models/clients.dart';
import 'package:portal_maqueta/models/servicios_contratados.dart';
import 'package:portal_maqueta/providers/menu_providers.dart';
import 'package:portal_maqueta/services/cv_services.dart';
import 'package:portal_maqueta/widgets/headers.dart';
import 'package:portal_maqueta/widgets/icon_string.dart';
import 'package:provider/provider.dart';

class PanelClientesDesktop extends StatefulWidget {
  const PanelClientesDesktop({super.key});

  @override
  State<PanelClientesDesktop> createState() => _PanelClientesDesktopState();
}

class _PanelClientesDesktopState extends State<PanelClientesDesktop> {
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
      floatingActionButton: CircleAvatar(
        radius: 32,
        backgroundColor: Colors.white,
        child: CircleAvatar(
          radius: 30,
          backgroundColor: Color.fromARGB(255, 52, 120, 62),
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
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  color: Color.fromARGB(255, 52, 120, 62),
                  child: Header(
                    cliente: cliente,
                  )),
              SizedBox(
                height: 25,
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'Servicios contratados',
                          style: TextStyle(
                              fontSize: 50, color: Colors.green.shade800),
                        ),
                      ),
                      for (var i = 0; i < servicios!.length; i++) ...[
                        Text(
                          servicios![i].servicio,
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: Colors.green),
                        )
                      ],
                      SizedBox(
                        height: 210,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _botones(),
                      SizedBox(
                        height: 50,
                      ),
                      _botonesGenerales()
                    ],
                  )
                ],
              ),              
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        color: Color.fromARGB(255, 52, 120, 62),
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 5),
          child: Text(
            'Número de teléfono: 23623375 Int. 206 y 207 / celular: +598 98 409 523               Correo Electrónico: daiana@sedel.com.uy',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
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
        height: 40,
        width: 400,
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
        height: 40,
        width: 400,
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
      opcionesGenerales.add(widgetTemp);
    });
    return opcionesGenerales;
  }
}
