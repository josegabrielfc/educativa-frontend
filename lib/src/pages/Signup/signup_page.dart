import 'package:educativa_frontend/src/models/usuario/usuario_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:educativa_frontend/src/config/environment/environment.dart';
import 'package:educativa_frontend/src/providers/service_provider.dart';
import 'package:educativa_frontend/src/widgets/inputs.dart';
import 'package:educativa_frontend/src/widgets/widgets_general.dart';

class SignupPage extends StatefulWidget {
  static const name = 'signup-page';
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _controllerNombre = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerRepetirPassword =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final serviceProvider =
        Provider.of<ServicesProvider>(context, listen: false);

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent.withOpacity(0.5),
          body: Center(
            child: Container(
              height: size.height * 0.82,
              width:
                  selectDevice(web: 0.35, cel: 0.875, sizeContext: size.width),
              decoration: BoxDecoration(
                  color: blancoColor, borderRadius: BorderRadius.circular(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  separadorVertical(context, 6),
                  texto('¡Registrate!', fontMedium, extraBigSize + 4,
                      negroColor, TextAlign.justify),
                  separadorVertical(context, 4.5),
                  Form(
                    child: CustomTextFormField(
                      sizeBorderRadius: 10,
                      hintColor: grisOscColor,
                      borderColor: negroClaColor,
                      width: selectDevice(
                          web: 0.24, cel: 0.7, sizeContext: size.width),
                      height: size.height * 0.06,
                      hint: "Nombre *",
                      controller: _controllerNombre,
                      sizeMaxLength: 50,
                    ),
                  ),
                  separadorVertical(context, 4.5),
                  Form(
                    child: CustomTextFormField(
                      sizeBorderRadius: 10,
                      hintColor: grisOscColor,
                      borderColor: negroClaColor,
                      width: selectDevice(
                          web: 0.24, cel: 0.7, sizeContext: size.width),
                      height: size.height * 0.06,
                      hint: "Email *",
                      controller: _controllerEmail,
                      sizeMaxLength: 50,
                    ),
                  ),
                  separadorVertical(context, 6),
                  Form(
                    child: CustomPassword(
                      sizeBorderRadius: 10,
                      hintColor: grisOscColor,
                      borderColor: negroClaColor,
                      width: selectDevice(
                          web: 0.24, cel: 0.7, sizeContext: size.width),
                      height: size.height * 0.06,
                      hint: "Contraseña *",
                      controller: _controllerPassword,
                    ),
                  ),
                  separadorVertical(context, 6),
                  Form(
                    child: CustomPassword(
                      sizeBorderRadius: 10,
                      hintColor: grisOscColor,
                      borderColor: negroClaColor,
                      width: selectDevice(
                          web: 0.24, cel: 0.7, sizeContext: size.width),
                      height: size.height * 0.06,
                      hint: "Repetir Contraseña *",
                      controller: _controllerRepetirPassword,
                    ),
                  ),
                  separadorVertical(context, 7.5),
                  CustomButton(
                      color: azulOscColor,
                      hoverColor: azulClaColor,
                      size: bigSize + 4,
                      textButton: 'Registrarse',
                      heightButton: size.height * 0.065,
                      widthButton: selectDevice(
                          web: 0.22, cel: 0.64, sizeContext: size.width),
                      sizeBorderRadius: 15,
                      duration: 1000,
                      onTap: () async {
                        String nombre = _controllerNombre.text;
                        String correo = _controllerEmail.text;
                        String contrasena = _controllerPassword.text;
                        String contrasenaConfirm =
                            _controllerRepetirPassword.text;
                        if (nombre.isEmpty ||
                            correo.isEmpty ||
                            contrasena.isEmpty ||
                            contrasenaConfirm.isEmpty) {
                          showDialog(
                            // ignore: use_build_context_synchronously
                            context: context,
                            builder: (context) => AlertaVolver(
                              width: 200,
                              height: 200,
                              function: () {
                                Navigator.of(context).pop();
                              },
                              widthButton: 10,
                              textoBoton: 'Volver',
                              image: Image.asset('assets/images/warning.jpg',
                                  height: 80),
                              mensaje: "Todos los campos son obligatorios",
                              dobleBoton: false,
                            ),
                          );
                          return;
                        }

                        if (contrasena != contrasenaConfirm) {
                          showDialog(
                            // ignore: use_build_context_synchronously
                            context: context,
                            builder: (context) => AlertaVolver(
                              width: 200,
                              height: 200,
                              function: () {
                                Navigator.of(context).pop();
                              },
                              widthButton: 10,
                              textoBoton: 'Volver',
                              image: Image.asset('assets/images/warning.jpg',
                                  height: 80),
                              mensaje: "Las contraseñas no son iguales",
                              dobleBoton: false,
                            ),
                          );
                          return;
                        }

                        UsuarioRegistro usuario = UsuarioRegistro(
                            nombre: nombre,
                            correo: correo,
                            contrasena: contrasena);
                        final response = await serviceProvider.usuarioService
                            .registrar(usuario);

                        if (response.type == "success") {
                          showDialog(
                            // ignore: use_build_context_synchronously
                            context: context,
                            builder: (context) => AlertaVolver(
                              width: 200,
                              height: 200,
                              function: () {
                                setState(() {
                                  _controllerNombre.clear();
                                  _controllerEmail.clear();
                                  _controllerPassword.clear();
                                  _controllerRepetirPassword.clear();
                                });
                                Navigator.of(context).pop();
                              },
                              widthButton: 10,
                              textoBoton: 'Volver',
                              image: Image.asset('assets/images/success.png',
                                  height: 80),
                              mensaje: response.msg,
                              dobleBoton: false,
                            ),
                          );
                        } else {
                          showDialog(
                            // ignore: use_build_context_synchronously
                            context: context,
                            builder: (context) => AlertaVolver(
                              width: 200,
                              height: 200,
                              function: () {
                                Navigator.of(context).pop();
                              },
                              widthButton: 10,
                              textoBoton: 'Volver',
                              image: Image.asset('assets/images/warning.jpg',
                                  height: 80),
                              mensaje: response.msg,
                              dobleBoton: false,
                            ),
                          );
                        }
                      }),
                  separadorVertical(context, 2),
                  Center(
                    child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "login-page");
                        },
                        child: texto(
                            "¿Ya estas registrado? Inicia sesión.",
                            fontBold,
                            mediumSize,
                            azulOscColor,
                            TextAlign.center)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
