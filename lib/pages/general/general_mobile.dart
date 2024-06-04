import 'package:flutter/material.dart';
import 'package:portal_maqueta/models/clients.dart';
import 'package:portal_maqueta/models/doc_portal.dart';
import 'package:portal_maqueta/providers/menu_providers.dart';
import 'package:portal_maqueta/services/portal_services.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class VistaGeneralMobile extends StatefulWidget {
  const VistaGeneralMobile({super.key});

  @override
  State<VistaGeneralMobile> createState() => _VistaGeneralMobileState();
}

class _VistaGeneralMobileState extends State<VistaGeneralMobile> {
  late List<DocPortal>? documentos = [];
  late String categ = '';
  late String tituloPage = '';
  ScrollController _scrollController = ScrollController();
  late ClientePortal? cliente = context.watch<MenuProvider>().client;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    final codCliente = '0';
    categ = context.read<MenuProvider>().menu;
    tituloPage = context.read<MenuProvider>().menuName;
    documentos = (await PortalServices().getDocumentos(codCliente, categ, '0'));
    if (categ == '' || codCliente == '') {
      Navigator.pushNamed(context, '/');
    } else {
      setState(() {});
    }
  }

  listaPDF2() {
    return documentos == null
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Expanded(
            child: Scrollbar(
              controller: _scrollController,
              child: ListView.separated(
                controller: _scrollController,
                itemCount: documentos!.length,
                itemBuilder: (context, i) {
                  return ListTile(
                    leading: Icon(
                      Icons.article,
                      color: Color.fromARGB(255, 52, 120, 62),
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
                          color: Color.fromARGB(255, 52, 120, 62),
                        ),
                        onPressed: () async {
                          final url = Uri.parse(documentos![i].url);
                          if (await canLaunchUrl(url)) {
                            await launchUrl(url);
                          }
                        }),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    thickness: 3,
                    color: Colors.green,
                  );
                },
              ),
            ),
          );
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
                    'Número de teléfono: \n23623375 / +598 98 409 523                \nCorreo Electrónico: sedel@sedel.com.uy',
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
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    tituloPage,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              listaPDF2()
            ],
          ),
        ),
        floatingActionButton: CircleAvatar(
          radius: 30,
          backgroundColor: Color.fromARGB(255, 52, 120, 62),
          child: IconButton(
              onPressed: () {
                Navigator.popUntil(
                    context, ModalRoute.withName('panelClientes'));
              },
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              )),
        ),
      ),
    );
  }
}
