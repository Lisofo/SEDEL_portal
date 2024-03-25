import 'package:flutter/material.dart';
import 'package:portal_maqueta/pages/login/login_mobile.dart';

import 'login_desktop.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 800) {
            return const LoginMobile();
          } else if (constraints.maxWidth > 900) {
            return const LoginDesktop();
          }
          return LoginDesktop();
        },
      )),
    );
  }
}