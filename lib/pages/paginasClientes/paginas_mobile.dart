import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:portal_maqueta/models/clients.dart';
import 'package:portal_maqueta/models/constancia_visita.dart';
import 'package:portal_maqueta/models/doc_portal.dart';
import 'package:portal_maqueta/providers/menu_providers.dart';
import 'package:portal_maqueta/services/cv_services.dart';
import 'package:portal_maqueta/services/portal_services.dart';
import 'package:portal_maqueta/widgets/button_widget.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class PaginasClientesMobile extends StatefulWidget {
  const PaginasClientesMobile({super.key});

  @override
  State<PaginasClientesMobile> createState() => _PaginasClientesMobileState();
}

//bbrianocal@gmail.com
class _PaginasClientesMobileState extends State<PaginasClientesMobile> {
  late List<DocPortal>? documentos = [];
  late bool yaCargo = false;
  late String categ = '';
  late String tituloPage = '';
  ScrollController _scrollController = ScrollController();
  int groupValue = 0;
  late List<ConstanciaVisita>? constancias = [];
  late DateTimeRange selectedDate = DateTimeRange(start: DateTime.now(), end: DateTime.now());
  late String token = '';
  late ClientePortal cliente = ClientePortal.empty();

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    cliente = context.read<MenuProvider>().client;
    final codCliente = context.read<MenuProvider>().client.codCliente;
    categ = context.read<MenuProvider>().menu;
    tituloPage = context.read<MenuProvider>().menuName;
    yaCargo = false;
    documentos = (await PortalServices().getDocumentos(codCliente, categ, '1'));
    token = context.read<MenuProvider>().token;
    yaCargo = true;
    if (categ == '' || codCliente == '') {
      Navigator.pushNamed(context, '/');
    } else {
      setState(() {});
    }
  }

  listaAnteriores() {
    final colors = Theme.of(context).colorScheme;
    return !yaCargo
      ? const Center(child: CircularProgressIndicator(),)
      : Expanded(
          child: documentos!.isEmpty
            ? const Center(
                child: Text(
                  'Sin datos',
                  style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.w200,
                      color: Colors.grey),
                ),
              )
            : Scrollbar(
                controller: _scrollController,
                thumbVisibility: true,
                trackVisibility: true,
                child: ListView.separated(
                  controller: _scrollController,
                  itemCount: documentos!.length,
                  itemBuilder: (context, i) {
                    return ListTile(
                      leading: Icon(
                        Icons.article,
                        color: colors.primary,
                      ),
                      title: Text(documentos![i].nombre),
                      onTap: () async {
                        final url = Uri.parse(documentos![i].url);
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        }
                      },
                      trailing: IconButton(
                        icon: Icon(
                          Icons.picture_as_pdf,
                          color: colors.primary,
                        ),
                        onPressed: () async {
                          final url = Uri.parse(documentos![i].url);
                          if (await canLaunchUrl(url)) {
                            await launchUrl(url);
                          }
                        }
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(
                      thickness: 3,
                      color: colors.secondary,
                    );
                  },
                ),
              ),
        );
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 52, 120, 62),
          title: Image.asset('images/logoPortal.png'),
          automaticallyImplyLeading: false,
        ),
        endDrawer: Drawer(
          backgroundColor: Color.fromARGB(255, 52, 120, 62),
          child: Column(
            children: [
              SizedBox(height: 40,),
              CircleAvatar(
                backgroundColor: Color.fromARGB(255, 52, 120, 62),
                radius: 70,
                backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_kSSoomJ9hiFXmiF2RdZlwx72Y23XsT6iwQ&usqp=CAU'),
              ),
              SizedBox(height: 20,),
              Text(
                'Codigo:',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                  fontWeight: FontWeight.w600
                ),
              ),
              Text(
                cliente.codCliente,
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20,),
              Text(
                'Nombre:',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                  fontWeight: FontWeight.w600
                ),
              ),
              Text(
                cliente.cliente,
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20,),
              Text(
                'Direccion:',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                  fontWeight: FontWeight.w600
                ),
              ),
              Text(
                cliente.direccion,
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20,),
              Text(
                'Telefono:',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                  fontWeight: FontWeight.w600
                ),
              ),
              Text(
                cliente.telefono1,
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20,),
              Text(
                'Correo Electrónico:',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                  fontWeight: FontWeight.w600
                ),
              ),
              Text(
                cliente.email,
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
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 5),
                  child: Text(
                    'Número de teléfono: 23623375 \nInt. 206 y 207 / celular: +598 98 409 523               Correo Electrónico: daiana@sedel.com.uy',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
        backgroundColor: Color.fromARGB(255, 52, 120, 62),
        body: Container(
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 52, 120, 62),
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: Text(
                    tituloPage,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              CupertinoSegmentedControl<int>(
              padding: const EdgeInsets.all(10),
              groupValue: groupValue,
              borderColor: Colors.black,
              selectedColor: colors.primary,
              unselectedColor: Colors.white,
              children: {
                0: buildSegment('Anteriores'),
                1: buildSegment('Actuales'),
              },
              onValueChanged: (newValue) {
                groupValue = newValue;
                setState(() {});
              },
            ),
            SizedBox(height: 50,),
            if(groupValue == 0)...[
              listaAnteriores(),
            ]else if(groupValue == 1)...[
              listaActuales(context)
            ],
            SizedBox(height: 100,),

            ],
          ),
        ),
        floatingActionButton: CircleAvatar(
          radius: 30,
          backgroundColor: Color.fromARGB(255, 52, 120, 62),
          child: IconButton(
            onPressed: () {
              Navigator.popUntil(context, ModalRoute.withName('panelClientes'));
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            )
          ),
        ),
      ),
    );
  }

  Column listaActuales(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(width: 20,),
        Container(
          height: 160,
          width: 300,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Seleccione periodo: '),
                    const SizedBox(width: 10,),
                    IconButton(
                      color: colors.secondary,
                      onPressed: () async{
                        final pickedDate = await showDateRangePicker(
                          context: context,
                          firstDate: DateTime(2023),
                          lastDate: DateTime(2025)
                        );
                        if (pickedDate != null && pickedDate != selectedDate) {
                          setState(() {
                            selectedDate = pickedDate;
                            print(selectedDate);
                          });
                        }
                      },
                      icon: const Icon(Icons.calendar_month)
                    ),
                  ],
                ),
                Divider(
                  color: colors.secondary,
                  height: 24,
                ),
                RichText(
                  text: TextSpan(
                    style: const TextStyle(color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                        text: DateFormat('dd/MM/yyyy', 'es').format(selectedDate.start)
                      ),
                      const TextSpan(text: ' - '),
                      TextSpan(
                        text: DateFormat('dd/MM/yyyy', 'es').format(selectedDate.end)
                      ),
                    ]
                  )
                ),
                Divider(
                  color: colors.secondary,
                  height: 24,
                ),
                ButtonWidget(
                  text: 'Buscar', 
                  onClicked: () async {
                    await buscar(token);
                  }
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 10,),
        Container(
          height: MediaQuery.of(context).size.height * 0.41,
          width: MediaQuery.of(context).size.width,
          child: Scrollbar(
            controller: _scrollController,
            thumbVisibility: true,
            trackVisibility: true,
            child: ListView.separated(
              controller: _scrollController,
              itemCount: constancias!.length,
              itemBuilder: (context, i) {
                var constancia = constancias![i];
                return ListTile(
                  leading: Icon(
                    Icons.article,
                    color: colors.primary,
                  ),
                  title: Text(constancia.filename),
                  onTap: () async {
                    await abrirPDF(constancia.filepath, token);
                  },
                  trailing: IconButton(
                    icon: Icon(
                      Icons.picture_as_pdf,
                      color: colors.primary,
                    ),
                    onPressed: () async {
                      await abrirPDF(constancia.filepath, token);
                    }
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  thickness: 3,
                  color: colors.secondary,
                );
              },
            ),
          ), 
        )
      ],
    );
  }

  Widget buildSegment(String text) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Text(
        text,
        style: const TextStyle(fontSize: 15),
      ),
    );
  }

  Future<void> buscar(String token) async {
    final clienteSeleccionado = context.read<MenuProvider>().client;
    print(clienteSeleccionado.clienteId.toString());
    print(categ);
    String fechaDesde = DateFormat('yyyy-MM-dd', 'es').format(selectedDate.start);
    String fechaHasta = DateFormat('yyyy-MM-dd', 'es').format(selectedDate.end);

    List<ConstanciaVisita> results = await ConstanciaVisitaServices().getCVs(
      context, 
      clienteSeleccionado.clienteId, 
      fechaDesde, 
      fechaHasta,
      categ,
      token
    );

    setState(() {
      constancias = results;
    });
  }

  abrirPDF(String url, String token) async {
    Dio dio = Dio();
    String link = url += '?authorization=$token';
    print(link);
    try {
      // Realizar la solicitud HTTP con el encabezado de autorización
      Response response = await dio.get(
        link,
        options: Options(
          headers: {
            'Authorization': 'headers $token',
          },
        ),
      );
      // Verificar si la solicitud fue exitosa (código de estado 200)
      if (response.statusCode == 200) {
        // Si la respuesta fue exitosa, abrir la URL en el navegador
        Uri uri = Uri.parse(url);
        await launchUrl(uri);
      } else {
        // Si la solicitud no fue exitosa, mostrar un mensaje de error
        print('Error al cargar la URL: ${response.statusCode}');
      }
    } catch (e) {
      // Manejar errores de solicitud
      print('Error al realizar la solicitud: $e');
    }
  }
}
