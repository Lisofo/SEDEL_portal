import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portal_maqueta/services/login_services.dart';
import 'package:package_info_plus/package_info_plus.dart';

class LoginDesktop extends StatefulWidget {
  const LoginDesktop({super.key});

  @override
  State<LoginDesktop> createState() => _LoginDesktopState();
}

class _LoginDesktopState extends State<LoginDesktop> {
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
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.962,
                width: MediaQuery.of(context).size.width / 2,
                child: Image.asset(
                  'images/logo.png',
                ),
              ),
              Expanded(
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 18),
                  padding: const EdgeInsets.symmetric(horizontal: 45),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Bienvenido',
                        style: GoogleFonts.inter(
                            fontSize: 28,
                            color: Colors.grey.shade700,
                            fontWeight: FontWeight.w900),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Inicia Sesion en tu cuenta',
                        style: GoogleFonts.inter(
                            fontSize: 17,
                            color: Color.fromARGB(255, 52, 120, 62),
                            fontWeight: FontWeight.w700),
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
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    fillColor: Colors.white,
                                    filled: true,
                                    prefixIcon: Icon(Icons.person),
                                    prefixIconColor:
                                        Color.fromARGB(255, 41, 146, 41),
                                    hintText: 'Ingrese su usuario'),
                                validator: (value) {
                                  if (value!.isEmpty ||
                                      value.trim().isEmpty) {
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
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    fillColor: Colors.white,
                                    filled: true,
                                    prefixIcon: Icon(Icons.lock),
                                    prefixIconColor:
                                        Color.fromARGB(255, 41, 146, 41),
                                    suffixIcon: IconButton(
                                      padding: EdgeInsetsDirectional.only(
                                          end: 12.0),
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
                                  if (value!.isEmpty ||
                                      value.trim().isEmpty) {
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
                                backgroundColor: WidgetStatePropertyAll(Colors.white),
                                elevation: WidgetStatePropertyAll(10),
                                shape: WidgetStatePropertyAll(
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
                            const SizedBox(height: 30,),
                            Center(
                              child: FutureBuilder(
                                future: PackageInfo.fromPlatform(),
                                builder: (BuildContext context, AsyncSnapshot<PackageInfo> snapshot) {
                                  if (snapshot.hasData) {
                                    return Text(
                                      'Versión ${snapshot.data!.version} (Build ${snapshot.data!.buildNumber})',
                                      style: const TextStyle(color: Colors.black),
                                    );
                                  } else {
                                    return const Text('Cargando la web...');
                                  }
                                }
                              ),
                            )
                          ],
                        )
                      ),
                    ]
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            color: Color.fromARGB(255, 52, 120, 62),
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 5),
              child: Text(
                'Número de teléfono: 23623375 / +598 98 409 523                Correo Electrónico: sedel@sedel.com.uy',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          )
        ],
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
