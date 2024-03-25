// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:portal_maqueta/models/clients.dart';

class Header extends StatelessWidget {
  late ClientePortal? cliente;

  Header({required this.cliente});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset('images/logoPortal.png'),
        SizedBox(
          width: 30,
        ),
        Flexible(
          child: Column(
            children: [
              Text(
                'Codigo:',
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                cliente!.codCliente,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 30,
        ),
        Flexible(
          child: Column(
            children: [
              Text(
                'Nombre:',
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                cliente!.cliente,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 30,
        ),
        Flexible(
          child: Column(
            children: [
              Text(
                'Direccion:',
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                cliente!.direccion,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 30,
        ),
        Flexible(
          child: Column(
            children: [
              Text(
                'Telefono:',
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                cliente!.telefono1,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 30,
        ),
        Flexible(
          child: Column(
            children: [
              Text(
                'Correo Electrónico:',
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                cliente!.email,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
