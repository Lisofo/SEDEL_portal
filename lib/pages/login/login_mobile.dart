import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portal_maqueta/services/login_services.dart';

class LoginMobile extends StatefulWidget {
  const LoginMobile({super.key});

  @override
  State<LoginMobile> createState() => _LoginMobileState();
}

class _LoginMobileState extends State<LoginMobile> {
  var isObscured;
  final _formKey = GlobalKey<FormState>();
  final passwordFocusNode = FocusNode();
  final userFocusNode = FocusNode();
  String user = '';
  String pass = '';
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _loginServices = LoginServices();

  @override
  void initState() {
    super.initState();
    isObscured = true;
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  'images/logo.png',
                  fit: BoxFit.cover,
                  height: 300,
                ),
                const SizedBox(height: 8),
                Text(
                  'Bienvenido',
                  style: GoogleFonts.inter(
                      fontSize: 28,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  'Inicia Sesion en tu cuenta',
                  style: GoogleFonts.inter(
                    fontSize: 17,
                    color: Color.fromARGB(255, 52, 120, 62),
                  ),
                ),
                const SizedBox(height: 35),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                            controller: usernameController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(),
                                    borderRadius: BorderRadius.circular(20)),
                                fillColor: Colors.white,
                                filled: true,
                                prefixIcon: Icon(Icons.person),
                                prefixIconColor:
                                    Color.fromARGB(255, 41, 146, 41),
                                hintText: 'Ingrese su usuario'),
                            validator: (value) {
                              if (value!.isEmpty || value.trim().isEmpty) {
                                return 'Ingrese un usuario valido';
                              }
                              return null;
                            },
                            onSaved: (newValue) => user = newValue!),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                            controller: passwordController,
                            obscureText: isObscured,
                            focusNode: passwordFocusNode,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(),
                                    borderRadius: BorderRadius.circular(20)),
                                fillColor: Colors.white,
                                filled: true,
                                prefixIcon: Icon(Icons.lock),
                                prefixIconColor:
                                    Color.fromARGB(255, 41, 146, 41),
                                suffixIcon: IconButton(
                                  padding:
                                      EdgeInsetsDirectional.only(end: 12.0),
                                  icon: isObscured
                                      ? Icon(
                                          Icons.visibility_off,
                                          color: Colors.black,
                                        )
                                      : Icon(Icons.visibility,
                                          color: Colors.black),
                                  onPressed: () {
                                    setState(() {
                                      isObscured = !isObscured;
                                    });
                                  },
                                ),
                                hintText: 'Ingrese su contraseña'),
                            validator: (value) {
                              if (value!.isEmpty || value.trim().isEmpty) {
                                return 'Ingrese su contraseña';
                              }
                              if (value.length < 6) {
                                return 'Contraseña invalida';
                              }
                              return null;
                            },
                            onFieldSubmitted: (value) async {
                              await login(context);
                            },
                            onSaved: (newValue) => pass = newValue!),
                        SizedBox(
                          height: 40,
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.white),
                            elevation: MaterialStatePropertyAll(10),
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(50),
                                  right: Radius.circular(50),
                                ),
                              ),
                            ),
                          ),
                          onPressed: () async {
                            await login(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.5),
                            child: Text(
                              'Iniciar Sesión',
                              style: TextStyle(
                                color: Color.fromARGB(255, 52, 120, 62),
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> login(BuildContext context) async {
    await _loginServices.login(
      usernameController.text,
      passwordController.text,
      context,
    );

    if (_formKey.currentState?.validate() == true) {
      var statusCode = await _loginServices.getStatusCode();

      if (statusCode == 200) {
        Navigator.pushNamedAndRemoveUntil(
            context, 'seleccionCliente', (route) => false);
      } else if (statusCode == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Credenciales inválidas. Intente nuevamente.'),
            backgroundColor: Colors.red,
          ),
        );
        print('Credenciales inválidas. Intente nuevamente.');
      }
    }
  }
}
