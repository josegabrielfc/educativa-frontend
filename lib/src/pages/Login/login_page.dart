import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:educativa_frontend/src/config/environment/environment.dart';
import 'package:educativa_frontend/src/models/login/login_model.dart';
import 'package:educativa_frontend/src/providers/service_provider.dart';
import 'package:educativa_frontend/src/providers/usuario_provider.dart';
import 'package:educativa_frontend/src/widgets/inputs.dart';
import 'package:educativa_frontend/src/widgets/widgets_general.dart';

class LoginPage extends StatefulWidget {
  static const name = 'login-page';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
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
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent.withOpacity(0.5),
          body: Center(
            child: Container(
              height: size.height * 0.65,
              width:
                  selectDevice(web: 0.35, cel: 0.875, sizeContext: size.width),
              decoration: BoxDecoration(
                  color: blancoColor, borderRadius: BorderRadius.circular(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  separadorVertical(context, 7.5),
                  texto('¡Bienvenido al Curso!', fontMedium, extraBigSize + 4,
                      negroColor, TextAlign.justify),
                  separadorVertical(context, 5.5),
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
                    ),
                  ),
                  separadorVertical(context, 7),
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
                  separadorVertical(context, 7.5),
                  CustomButton(
                      color: azulOscColor,
                      hoverColor: azulClaColor,
                      size: bigSize + 4,
                      textButton: 'Iniciar sesión',
                      heightButton: size.height * 0.065,
                      widthButton: selectDevice(
                          web: 0.22, cel: 0.64, sizeContext: size.width),
                      sizeBorderRadius: 15,
                      duration: 1000,
                      onTap: () async {
                        if (_controllerPassword.text.isEmpty ||
                            _controllerEmail.text.isEmpty) {
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
                        LoginModel loginRequest = LoginModel(
                            contrasena: _controllerPassword.text,
                            correo: _controllerEmail.text);

                        final response = await serviceProvider.loginService
                            .login(loginRequest);
                        if (response["type"] == 'success') {
                          // ignore: use_build_context_synchronously
                          final usuarioProvider = Provider.of<UsuarioProvider>(context,
                              listen: false);
                          usuarioProvider.setToken(response["msg"]["token"]);
                          usuarioProvider
                              .setUsuario(response["msg"]["usuarioid"]);
                          final temas = await serviceProvider.temaService.listarTemas(response["msg"]["token"]);
                          usuarioProvider.setTemas(temas);
                         
                          if(_controllerEmail.text == "admin@gmail.com") {
                            // ignore: use_build_context_synchronously
                            Navigator.pushNamed(context, "estudiantes-page");
                          } else {
                            // ignore: use_build_context_synchronously
                            Navigator.pushNamed(context, "home-page");
                          }
                          
                        } else {
                          // ignore: use_build_context_synchronously
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
                              mensaje: response["msg"],
                              dobleBoton: false,
                            ),
                          );
                        }
                      }),
                  separadorVertical(context, 2),
                  Center(
                    child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "signup-page");
                        },
                        child: texto("Registrarse", fontBold, mediumSize,
                            azulOscColor, TextAlign.center)),
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
