import 'package:educativa_frontend/src/config/environment/environment.dart';
import 'package:educativa_frontend/src/models/resultado/resultado_models.dart';
import 'package:educativa_frontend/src/models/sidebar_item.dart';
import 'package:educativa_frontend/src/providers/service_provider.dart';
import 'package:educativa_frontend/src/providers/sidebar_provider.dart';
import 'package:educativa_frontend/src/providers/usuario_provider.dart';
import 'package:educativa_frontend/src/widgets/inputs.dart';
import 'package:educativa_frontend/src/widgets/sidebar_widget.dart';
import 'package:educativa_frontend/src/widgets/widgets_general.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VariablesPage extends StatefulWidget {
  static const name = 'variables-page';
  const VariablesPage({super.key});

  @override
  State<VariablesPage> createState() => _VariablesPageState();
}

class _VariablesPageState extends State<VariablesPage> {
  bool actividad = false;
  final TextEditingController _controllerIntC = TextEditingController();
  final TextEditingController _controllerFloatC = TextEditingController();
  final TextEditingController _controllerCharC = TextEditingController();
  final TextEditingController _controllerIntJava = TextEditingController();
  final TextEditingController _controllerFloatJava = TextEditingController();
  final TextEditingController _controllerStringJava = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        drawer: const SidebarWidget(),
        appBar: AppBar(backgroundColor: const Color(0xFFC2F8FA)),
        floatingActionButton: Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 80, top: 20),
          child: CustomButton(
              color: azulOscColor,
              hoverColor: azulClaColor,
              size: bigSize + 4,
              textButton: 'Siguiente',
              heightButton: 45,
              widthButton:
                  selectDevice(web: 0.22, cel: 0.64, sizeContext: size.width),
              sizeBorderRadius: 15,
              duration: 1000,
              onTap: () async {
                final provider =
                    Provider.of<SidebarProvider>(context, listen: false);
                provider.setSidebarItem(SidebarItem.entradaSalida);
              }),
        ),
        body: Stack(children: [
          Scaffold(
              backgroundColor: Colors.transparent.withOpacity(0.11),
              body: SizedBox(
                  height: size.height,
                  child: SingleChildScrollView(
                      child: Column(children: [
                    Image.asset(
                      'assets/images/background.png',
                      width: size.width,
                      height: size.height * 0.3,
                      fit: BoxFit.cover,
                    ),
                    separadorVertical(context, 2),
                    texto(
                        "Variables – Identificador y Tipo de Dato",
                        fontExtraBold,
                        bigSize + 8,
                        azulColor,
                        TextAlign.center),
                    separadorVertical(context, 2),
                    SizedBox(
                      width: size.width * 0.9,
                      child: Column(
                        children: [
                          texto(
                              "Una variable es un espacio en memoria que se utiliza para almacenar datos que pueden cambiar durante la ejecución del programa. Un identificador es el nombre que se le da a una variable, y el tipo de dato define el tipo de información que se puede almacenar en esa variable.",
                              fontApp,
                              bigSize,
                              negroColor,
                              TextAlign.justify),
                          separadorVertical(context, 2),
                          Divider(
                            color: azulClaColor, // Color de la línea
                            thickness: 1, // Grosor de la línea
                            indent: 2, // Espaciado desde el borde izquierdo
                            endIndent: 2, // Espaciado desde el borde derecho
                          ),
                          separadorVertical(context, 2),
                          texto("Variables", fontApp, bigSize, azulColor,
                              TextAlign.start),
                          separadorVertical(context, 1),
                          RichText(
                            textAlign: TextAlign.justify,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text:
                                      "Según el lenguaje de programación, declarar una variable generalmente implica tres componentes principales: el tipo de dato, el identificador y el valor asignado a la variable.",
                                  style: TextStyle(
                                    fontFamily: fontBold,
                                    fontSize: bigSize,
                                    color: negroColor,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      " En Python, la declaración de variables es más sencilla y dinámica. No se especifica el tipo de dato explícitamente; el tipo se infiere del valor asignado.",
                                  style: TextStyle(
                                    fontFamily: fontApp,
                                    fontSize: bigSize,
                                    color: negroColor,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      " En cambio, en C++ y Java, declarar una variable incluye especificar el tipo de dato, el identificador y opcionalmente el valor inicial.",
                                  style: TextStyle(
                                    fontFamily: fontApp,
                                    fontSize: bigSize,
                                    color: negroColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          separadorVertical(context, 1),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: size.width * 0.25,
                                child: Column(
                                  children: [
                                    texto("Ejemplo en Python", fontApp, bigSize,
                                        negroColor, TextAlign.center),
                                    Image.asset(
                                      "assets/images/fundamentos/declaracion2.png",
                                      height: 200,
                                    )
                                  ],
                                ),
                              ),
                              separadorHorizontal(context, 2),
                              SizedBox(
                                width: size.width * 0.25,
                                child: Column(
                                  children: [
                                    texto("Ejemplo en C++", fontApp, bigSize,
                                        negroColor, TextAlign.center),
                                    Image.asset(
                                      "assets/images/fundamentos/declaracion1.png",
                                      height: 200,
                                    )
                                  ],
                                ),
                              ),
                              separadorHorizontal(context, 2),
                              SizedBox(
                                width: size.width * 0.25,
                                child: Column(
                                  children: [
                                    texto("Ejemplo en Java", fontApp, bigSize,
                                        negroColor, TextAlign.center),
                                    Image.asset(
                                      "assets/images/fundamentos/declaracion1.png",
                                      height: 200,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          separadorVertical(context, 2),
                          Divider(
                            color: azulClaColor, // Color de la línea
                            thickness: 1, // Grosor de la línea
                            indent: 2, // Espaciado desde el borde izquierdo
                            endIndent: 2, // Espaciado desde el borde derecho
                          ),
                          separadorVertical(context, 2),
                          texto("Identificadores", fontApp, bigSize, azulColor,
                              TextAlign.start),
                          separadorVertical(context, 1),
                          texto(
                              "Los identificadores deben empezar con una letra (a-z, A-Z) o un guion bajo (_), seguido de letras, números (0-9) o guiones bajos.",
                              fontApp,
                              bigSize,
                              negroColor,
                              TextAlign.center),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              separadorVertical(context, 1),
                              SizedBox(
                                width: size.width * 0.35,
                                child: Column(
                                  children: [
                                    texto("Ejemplos validos", fontApp, bigSize,
                                        negroColor, TextAlign.center),
                                    Image.asset(
                                      "assets/images/fundamentos/identificador1.png",
                                      width: 300,
                                    ),
                                  ],
                                ),
                              ),
                              separadorHorizontal(context, 2),
                              SizedBox(
                                width: size.width * 0.35,
                                child: Column(
                                  children: [
                                    texto("Ejemplos invalidos", fontApp,
                                        bigSize, negroColor, TextAlign.center),
                                    Image.asset(
                                      "assets/images/fundamentos/identificador2.png",
                                      width: 300,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          separadorVertical(context, 2),
                          Divider(
                            color: azulClaColor, // Color de la línea
                            thickness: 1, // Grosor de la línea
                            indent: 2, // Espaciado desde el borde izquierdo
                            endIndent: 2, // Espaciado desde el borde derecho
                          ),
                          separadorVertical(context, 2),
                          texto("Tipos de Datos", fontApp, bigSize, azulColor,
                              TextAlign.start),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              separadorVertical(context, 1),
                              SizedBox(
                                width: size.width * 0.35,
                                child: Column(
                                  children: [
                                    texto(
                                        "Enteros (int): Números sin decimales.",
                                        fontApp,
                                        bigSize,
                                        negroColor,
                                        TextAlign.center),
                                    Image.asset(
                                      "assets/images/fundamentos/tipo-dato1.png",
                                      width: 300,
                                    ),
                                  ],
                                ),
                              ),
                              separadorHorizontal(context, 2),
                              SizedBox(
                                width: size.width * 0.35,
                                child: Column(
                                  children: [
                                    texto(
                                        "Flotantes (float, double): Números con decimales.",
                                        fontApp,
                                        bigSize,
                                        negroColor,
                                        TextAlign.center),
                                    Image.asset(
                                      "assets/images/fundamentos/tipo-dato2.png",
                                      width: 300,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          separadorVertical(context, 2),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              separadorVertical(context, 1),
                              SizedBox(
                                width: size.width * 0.35,
                                child: Column(
                                  children: [
                                    texto(
                                        "Cadenas de texto (str, string): Secuencias de caracteres.",
                                        fontApp,
                                        bigSize,
                                        negroColor,
                                        TextAlign.center),
                                    Image.asset(
                                      "assets/images/fundamentos/tipo-dato3.png",
                                      width: 300,
                                    ),
                                  ],
                                ),
                              ),
                              separadorHorizontal(context, 2),
                              SizedBox(
                                width: size.width * 0.35,
                                child: Column(
                                  children: [
                                    texto(
                                        "Booleanos (bool): Valores de verdadero o falso.",
                                        fontApp,
                                        bigSize,
                                        negroColor,
                                        TextAlign.center),
                                    Image.asset(
                                      "assets/images/fundamentos/tipo-dato4.png",
                                      width: 300,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          separadorVertical(context, 2),
                          Divider(
                            color: azulClaColor, // Color de la línea
                            thickness: 1, // Grosor de la línea
                            indent: 2, // Espaciado desde el borde izquierdo
                            endIndent: 2, // Espaciado desde el borde derecho
                          ),
                          separadorVertical(context, 2),
                          CustomButton(
                              color: azulOscColor,
                              hoverColor: azulClaColor,
                              size: bigSize + 4,
                              textButton: 'Realizar actividad',
                              heightButton: 45,
                              widthButton: selectDevice(
                                  web: 0.22,
                                  cel: 0.64,
                                  sizeContext: size.width),
                              sizeBorderRadius: 15,
                              duration: 1000,
                              onTap: () {
                                setState(() {
                                  actividad = !actividad;
                                });
                              }),
                          actividad
                              ? Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        separadorVertical(context, 1),
                                        SizedBox(
                                          width: size.width * 0.35,
                                          child: Column(
                                            children: [
                                              texto(
                                                  "Completa la declaración de las siguientes variables usando el lenguaje de programación C++",
                                                  fontApp,
                                                  bigSize,
                                                  negroColor,
                                                  TextAlign.center),
                                              separadorVertical(context, 1),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  texto(
                                                      "int main()",
                                                      fontApp,
                                                      bigSize,
                                                      negroColor,
                                                      TextAlign.start),
                                                  texto(
                                                      "{",
                                                      fontApp,
                                                      bigSize,
                                                      negroColor,
                                                      TextAlign.start),
                                                  Row(children: [
                                                    texto(
                                                        "   int edad = ",
                                                        fontApp,
                                                        bigSize,
                                                        negroColor,
                                                        TextAlign.start),
                                                    CustomTextFormField(
                                                      controller:
                                                          _controllerIntC,
                                                      width: 90,
                                                      height: 10,
                                                      borderColor: azulClaColor,
                                                      sizeMaxLength: 8,
                                                      sizeMaxLines: 1,
                                                    ),
                                                    texto(
                                                        ";",
                                                        fontApp,
                                                        bigSize,
                                                        negroColor,
                                                        TextAlign.start),
                                                  ]),
                                                  separadorVertical(context, 1),
                                                  Row(children: [
                                                    texto(
                                                        "   float altura = ",
                                                        fontApp,
                                                        bigSize,
                                                        negroColor,
                                                        TextAlign.start),
                                                    CustomTextFormField(
                                                      controller:
                                                          _controllerFloatC,
                                                      width: 90,
                                                      height: 10,
                                                      borderColor: azulClaColor,
                                                      sizeMaxLength: 8,
                                                      sizeMaxLines: 1,
                                                    ),
                                                    texto(
                                                        ";",
                                                        fontApp,
                                                        bigSize,
                                                        negroColor,
                                                        TextAlign.start),
                                                  ]),
                                                  separadorVertical(context, 1),
                                                  Row(children: [
                                                    texto(
                                                        "   char caracter = '",
                                                        fontApp,
                                                        bigSize,
                                                        negroColor,
                                                        TextAlign.start),
                                                    CustomTextFormField(
                                                      controller:
                                                          _controllerCharC,
                                                      width: 90,
                                                      height: 10,
                                                      borderColor: azulClaColor,
                                                      sizeMaxLength: 8,
                                                      sizeMaxLines: 1,
                                                    ),
                                                    texto(
                                                        "';",
                                                        fontApp,
                                                        bigSize,
                                                        negroColor,
                                                        TextAlign.start),
                                                  ]),
                                                  texto(
                                                      "}",
                                                      fontApp,
                                                      bigSize,
                                                      negroColor,
                                                      TextAlign.start),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        separadorHorizontal(context, 2),
                                        SizedBox(
                                          width: size.width * 0.35,
                                          child: Column(
                                            children: [
                                              texto(
                                                  "Completa el tipo de dato de las siguientes variables usando el lenguaje de programación Java",
                                                  fontApp,
                                                  bigSize,
                                                  negroColor,
                                                  TextAlign.center),
                                              separadorVertical(context, 1),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  texto(
                                                      "public class Main",
                                                      fontApp,
                                                      bigSize,
                                                      negroColor,
                                                      TextAlign.start),
                                                  texto(
                                                      "{",
                                                      fontApp,
                                                      bigSize,
                                                      negroColor,
                                                      TextAlign.start),
                                                  texto(
                                                      "   public static void main(String[] args) {",
                                                      fontApp,
                                                      bigSize,
                                                      negroColor,
                                                      TextAlign.start),
                                                  Row(children: [
                                                    texto(
                                                        "       ",
                                                        fontApp,
                                                        bigSize,
                                                        negroColor,
                                                        TextAlign.start),
                                                    CustomTextFormField(
                                                      controller:
                                                          _controllerIntJava,
                                                      width: 90,
                                                      height: 10,
                                                      borderColor: azulClaColor,
                                                      sizeMaxLength: 8,
                                                      sizeMaxLines: 1,
                                                    ),
                                                    texto(
                                                        " edad = 25;",
                                                        fontApp,
                                                        bigSize,
                                                        negroColor,
                                                        TextAlign.start),
                                                  ]),
                                                  separadorVertical(context, 1),
                                                  Row(children: [
                                                    texto(
                                                        "       ",
                                                        fontApp,
                                                        bigSize,
                                                        negroColor,
                                                        TextAlign.start),
                                                    CustomTextFormField(
                                                      controller:
                                                          _controllerFloatJava,
                                                      width: 90,
                                                      height: 10,
                                                      borderColor: azulClaColor,
                                                      sizeMaxLength: 8,
                                                      sizeMaxLines: 1,
                                                    ),
                                                    texto(
                                                        " altura = 1.90;",
                                                        fontApp,
                                                        bigSize,
                                                        negroColor,
                                                        TextAlign.start),
                                                  ]),
                                                  separadorVertical(context, 1),
                                                  Row(children: [
                                                    texto(
                                                        "       ",
                                                        fontApp,
                                                        bigSize,
                                                        negroColor,
                                                        TextAlign.start),
                                                    CustomTextFormField(
                                                      controller:
                                                          _controllerStringJava,
                                                      width: 90,
                                                      height: 10,
                                                      borderColor: azulClaColor,
                                                      sizeMaxLength: 8,
                                                      sizeMaxLines: 1,
                                                    ),
                                                    texto(
                                                        ' nombre ="Juan Carlos";',
                                                        fontApp,
                                                        bigSize,
                                                        negroColor,
                                                        TextAlign.start),
                                                  ]),
                                                  texto(
                                                      "   }",
                                                      fontApp,
                                                      bigSize,
                                                      negroColor,
                                                      TextAlign.start),
                                                  texto(
                                                      "}",
                                                      fontApp,
                                                      bigSize,
                                                      negroColor,
                                                      TextAlign.start),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    separadorVertical(context, 1),
                                    CustomButton(
                                        color: azulOscColor,
                                        hoverColor: azulClaColor,
                                        size: bigSize + 4,
                                        textButton: 'Enviar',
                                        heightButton: 45,
                                        widthButton: selectDevice(
                                            web: 0.22,
                                            cel: 0.64,
                                            sizeContext: size.width),
                                        sizeBorderRadius: 15,
                                        duration: 1000,
                                        onTap: () async {
                                          await registrarResultado();
                                        }),
                                  ],
                                )
                              : Container(),
                          separadorVertical(context, 2),
                          Divider(
                            color: azulClaColor, // Color de la línea
                            thickness: 1, // Grosor de la línea
                            indent: 2, // Espaciado desde el borde izquierdo
                            endIndent: 2, // Espaciado desde el borde derecho
                          ),
                          separadorVertical(context, 2),
                        ],
                      ),
                    )
                  ]))))
        ]));
  }

  Future<void> registrarResultado() async {
    String respuestaCorrectaIntJava = "int";
    String respuestaCorrectaFloatJava = "float";
    String respuestaCorrectaStringJava = "String";
    double puntaje = 0;

    // Validación de las respuestas de C++
    if (_controllerIntC.text.isNotEmpty &&
        int.tryParse(_controllerIntC.text) != null) {
      puntaje += 16.66;
    }
    if (_controllerFloatC.text.isNotEmpty &&
        double.tryParse(_controllerFloatC.text) != null) {
      puntaje += 16.66;
    }
    if (_controllerCharC.text.isNotEmpty && _controllerCharC.text.length == 1) {
      puntaje += 16.66;
    }

    // Validación de las respuestas de Java
    if (_controllerIntJava.text.trim() == respuestaCorrectaIntJava) {
      puntaje += 16.66;
    }
    if (_controllerFloatJava.text.trim() == respuestaCorrectaFloatJava) {
      puntaje += 16.66;
    }
    if (_controllerStringJava.text.trim() == respuestaCorrectaStringJava) {
      puntaje += 16.7;
    }
    String mensaje;
    if (puntaje == 100) {
      mensaje = "¡Todas las respuestas son correctas! Puntaje: $puntaje";
    } else if (puntaje >= 60 && puntaje <= 99) {
      mensaje =
          "Muy bien, casi todas las respuestas son correctas. Puntaje: $puntaje";
    } else {
      mensaje = "Puntaje bajo. Inténtalo de nuevo. Puntaje: $puntaje";
    }
    final usuarioProvider =
        Provider.of<UsuarioProvider>(context, listen: false);

    String token = usuarioProvider.token!;
    String usuarioId = usuarioProvider.usuario!;
    String temaId = usuarioProvider.buscarTemaPorNombre("Variables")!;
    ResultadoForm resultado =
        ResultadoForm(puntaje: puntaje, temaId: temaId, usuarioId: usuarioId);

    final serviceProvider =
        Provider.of<ServicesProvider>(context, listen: false);
    final response = await serviceProvider.resultadoService
        .registrarResultado(resultado, token);

    showDialog(
      barrierDismissible: false,
      // ignore: use_build_context_synchronously
      context: context,
      builder: (context) => AlertaVolver(
        width: 200,
        height: 210,
        function: () {
          Navigator.of(context).pop();
          setState(() {
            _controllerIntC.clear();
            _controllerFloatC.clear();
            _controllerCharC.clear();
            _controllerIntJava.clear();
            _controllerFloatJava.clear();
            _controllerStringJava.clear();
          });
        },
        widthButton: 10,
        textoBoton: 'Volver',
        image: response.type == "success"
            ? Image.asset("assets/images/success.png", height: 80)
            : Image.asset("assets/images/warning.jpg", height: 80),
        mensaje: response.type == "success" ? mensaje : response.msg,
        dobleBoton: false,
      ),
    );
  }
}
