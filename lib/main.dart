import 'package:flutter/material.dart';
import 'package:portal_maqueta/providers/menu_providers.dart';
import 'package:portal_maqueta/routes/rutas.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(ChangeNotifierProvider(
    create: (_) => MenuProvider(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portal SEDEL',
      initialRoute: '/',
      routes: getAppRoute(),
    );
  }
}
 