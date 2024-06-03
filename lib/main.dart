import 'package:flutter/material.dart';
import 'package:portal_maqueta/providers/menu_providers.dart';
import 'package:portal_maqueta/routes/rutas.dart';
import 'package:provider/provider.dart';

import 'config/theme/theme.dart';

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
    final appTheme = AppTheme(selectedColor: 0);
    return MaterialApp(
      theme: appTheme.getTheme(),
      debugShowCheckedModeBanner: false,
      title: 'Portal SEDEL',
      initialRoute: '/',
      routes: getAppRoute(),
    );
  }
}
 