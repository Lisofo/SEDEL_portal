import 'package:flutter/material.dart';
import 'package:portal_maqueta/models/constanciasVisita.dart';
import 'package:portal_maqueta/providers/menu_providers.dart';
import 'package:portal_maqueta/services/cv_services.dart';
import 'package:portal_maqueta/widgets/headers.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class VistaGeneralDesktop extends StatefulWidget {
  const VistaGeneralDesktop({super.key});

  @override
  State<VistaGeneralDesktop> createState() => _VistaGeneralDesktopState();
}

class _VistaGeneralDesktopState extends State<VistaGeneralDesktop> {
  late List<DocPortal>? documentos = [];
  late String categ = '';
  late String tituloPage = '';
  ScrollController _scrollController = ScrollController();

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
              thumbVisibility: true,
              trackVisibility: true,
              child: ListView.separated(
                controller: _scrollController,
                itemCount: documentos!.length,
                itemBuilder: (context, i) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 150),
                    child: ListTile(
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
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 150),
                    child: Divider(
                      thickness: 3,
                      color: Colors.green,
                    ),
                  );
                },
              ),
            ),
          );
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
                Navigator.popUntil(
                    context, ModalRoute.withName('panelClientes'));
              },
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              )),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
                color: Color.fromARGB(255, 52, 120, 62),
                child: Header(cliente: context.watch<MenuProvider>().client)),
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 52, 120, 62),
                  borderRadius: BorderRadius.circular(5)),
              child: Text(
                tituloPage,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            listaPDF2(),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
      persistentFooterButtons: [
        Container(
          width: MediaQuery.of(context).size.width,
          color: Color.fromARGB(255, 52, 120, 62),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 5),
            child: Text(
              'Número de teléfono: 23623375 / +598 98 409 523                Correo Electrónico: sedel@sedel.com.uy',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        )
      ],
      backgroundColor: Color.fromARGB(255, 52, 120, 62),
    );
  }
}
