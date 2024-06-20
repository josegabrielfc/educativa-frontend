import 'package:educativa_frontend/src/config/environment/environment.dart';
import 'package:educativa_frontend/src/models/resultado/resultado_models.dart';
import 'package:educativa_frontend/src/models/sidebar_item.dart';
import 'package:educativa_frontend/src/providers/service_provider.dart';
import 'package:educativa_frontend/src/providers/sidebar_provider.dart';
import 'package:educativa_frontend/src/providers/usuario_provider.dart';
import 'package:educativa_frontend/src/widgets/sidebar_widget.dart';
import 'package:educativa_frontend/src/widgets/widgets_general.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OperadoresAsignacionPage extends StatefulWidget {
  static const name = 'operadores-asignacion-page';
  const OperadoresAsignacionPage({super.key});

  @override
  State<OperadoresAsignacionPage> createState() =>
      _OperadoresAsignacionPageState();
}

class _OperadoresAsignacionPageState extends State<OperadoresAsignacionPage> {
  bool actividad = false;

  int? _selectedRespuesta1;
  int? _selectedRespuesta2;
  int? _selectedRespuesta3;
  int? _selectedRespuesta4;
  int? _selectedRespuesta5;
  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() {
    setState(() {
      _selectedRespuesta1 = -1;
      _selectedRespuesta2 = -1;
      _selectedRespuesta3 = -1;
      _selectedRespuesta4 = -1;
      _selectedRespuesta5 = -1;
    });
  }

  void _handleRespuesta(int index, Function(int) updateSelected) {
    setState(() {
      updateSelected(index);
    });
  }

  void _validarRespuestas() async {
    List<int> respuestasCorrectas = [2, 1, 0, 3, 0];
    double puntaje = 0;

    if (_selectedRespuesta1 == respuestasCorrectas[0]) {
      puntaje += 20;
    }
    if (_selectedRespuesta2 == respuestasCorrectas[1]) {
      puntaje += 20;
    }
    if (_selectedRespuesta3 == respuestasCorrectas[2]) {
      puntaje += 20;
    }
    if (_selectedRespuesta4 == respuestasCorrectas[3]) {
      puntaje += 20;
    }
    if (_selectedRespuesta5 == respuestasCorrectas[4]) {
      puntaje += 20;
    }

    String mensaje;

    if (puntaje == 100) {
      mensaje = "¡Todas las respuestas son correctas! Puntaje: $puntaje";
    } else if (puntaje <= 80 && puntaje >= 60) {
      mensaje =
          "Muy bien, casi todas las respuestas son correctas. Puntaje: $puntaje";
    } else if (puntaje == 60) {
      mensaje =
          "Bien hecho, la mayoría de las respuestas son correctas. Puntaje: $puntaje";
    } else {
      mensaje = "Puntaje bajo. Inténtalo de nuevo. Puntaje: $puntaje";
    }

    final usuarioProvider =
        // ignore: use_build_context_synchronously
        Provider.of<UsuarioProvider>(context, listen: false);

    String token = usuarioProvider.token!;
    String usuarioId = usuarioProvider.usuario!;
    String temaId = usuarioProvider
        .buscarTemaPorNombre("Operadores de Asignación y Aritméticos")!;
    ResultadoForm resultado =
        ResultadoForm(puntaje: puntaje, temaId: temaId, usuarioId: usuarioId);

    final servicePorvider =
        Provider.of<ServicesProvider>(context, listen: false);
    final response = await servicePorvider.resultadoService
        .registrarResultado(resultado, token);
    // ignore: use_build_context_synchronously
    showDialog(
      barrierDismissible: false,
      // ignore: use_build_context_synchronously
      context: context,
      builder: (context) => AlertaVolver(
        width: 200,
        height: 210,
        function: () {
          Navigator.of(context).pop();
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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    List<String> respuestas1 = ["A) +", "B) -", "C) =", "D) =="];

    List<String> respuestas2 = ["A) 20", "B) 15", "C) 10", "D) 5"];

    List<String> respuestas3 = ["A) 1", "B) 2", "C) 3", "D) 4"];

    List<String> respuestas4 = ["A) +", "B) +=", "C) --", "D) ++"];

    List<String> respuestas5 = ["A) 3", "B) 3.75", "C) 4", "D) 4.5"];

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
                provider.setSidebarItem(SidebarItem.operadoresRelacionales);
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
                        "Operadores de Asignación y  Aritméticos",
                        fontExtraBold,
                        bigSize + 8,
                        azulColor,
                        TextAlign.center),
                    SizedBox(
                        width: size.width * 0.9,
                        child: Column(children: [
                          texto(
                              "Los operadores de asignación se utilizan para asignar valores a las variables, mientras que los operadores aritméticos se utilizan para realizar operaciones matemáticas.",
                              fontApp,
                              bigSize,
                              negroColor,
                              TextAlign.center),
                          separadorVertical(context, 2),
                          Divider(
                            color: azulClaColor, // Color de la línea
                            thickness: 1, // Grosor de la línea
                            indent: 2, // Espaciado desde el borde izquierdo
                            endIndent: 2, // Espaciado desde el borde derecho
                          ),
                          separadorVertical(context, 2),
                          texto("Operadores de Asignación", fontApp, bigSize,
                              azulColor, TextAlign.center),
                          separadorVertical(context, 1),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: size.width * 0.25,
                                child: Column(
                                  children: [
                                    texto(
                                        "= : Asigna un valor a una variable (Se debe considerar el tipo de dato).",
                                        fontApp,
                                        bigSize,
                                        negroColor,
                                        TextAlign.center),
                                    Image.asset(
                                      "assets/images/fundamentos/asignar-variable.png",
                                      height: 300,
                                    ),
                                  ],
                                ),
                              ),
                              separadorHorizontal(context, 2),
                              SizedBox(
                                width: size.width * 0.25,
                                child: Column(
                                  children: [
                                    texto(
                                        "+= : Suma el valor de la derecha al valor de la variable y asigna el resultado a la variable.",
                                        fontApp,
                                        bigSize,
                                        negroColor,
                                        TextAlign.center),
                                    texto(
                                        "NOTA: En algunos lenguajes para incrementar en 1 se puede hacer +=1 o ++.",
                                        fontApp,
                                        bigSize,
                                        negroColor,
                                        TextAlign.center),
                                    Image.asset(
                                      "assets/images/fundamentos/incrementar-variable.png",
                                      height: 300,
                                    ),
                                  ],
                                ),
                              ),
                              separadorHorizontal(context, 2),
                              SizedBox(
                                width: size.width * 0.25,
                                child: Column(
                                  children: [
                                    texto(
                                        "-= : Resta el valor de la derecha al valor de la variable y asigna el resultado a la variable.",
                                        fontApp,
                                        bigSize,
                                        negroColor,
                                        TextAlign.center),
                                    Image.asset(
                                      "assets/images/fundamentos/decrementar-variable.png",
                                      height: 300,
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
                              SizedBox(
                                width: size.width * 0.4,
                                child: Column(
                                  children: [
                                    texto(
                                        "*= : Multiplica el valor de la derecha al valor de la variable y asigna el resultado a la variable.",
                                        fontApp,
                                        bigSize,
                                        negroColor,
                                        TextAlign.center),
                                    Image.asset(
                                      "assets/images/fundamentos/incre-multi-variable.png",
                                      height: 300,
                                    ),
                                  ],
                                ),
                              ),
                              separadorHorizontal(context, 2),
                              SizedBox(
                                width: size.width * 0.4,
                                child: Column(
                                  children: [
                                    texto(
                                        "/= : Divide el valor de la derecha al valor de la variable y asigna el resultado a la variable.",
                                        fontApp,
                                        bigSize,
                                        negroColor,
                                        TextAlign.center),
                                    Image.asset(
                                      "assets/images/fundamentos/decre-divi-variable.png",
                                      height: 300,
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
                          texto("Operadores de Aritméticos", fontApp, bigSize,
                              azulColor, TextAlign.center),
                          separadorVertical(context, 1),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: size.width * 0.25,
                                child: Column(
                                  children: [
                                    texto("+ : Suma.", fontApp, bigSize,
                                        negroColor, TextAlign.center),
                                    Image.asset(
                                      "assets/images/fundamentos/suma.png",
                                      height: 300,
                                    ),
                                  ],
                                ),
                              ),
                              separadorHorizontal(context, 2),
                              SizedBox(
                                width: size.width * 0.25,
                                child: Column(
                                  children: [
                                    texto("- : Resta.", fontApp, bigSize,
                                        negroColor, TextAlign.center),
                                    Image.asset(
                                      "assets/images/fundamentos/resta.png",
                                      height: 300,
                                    ),
                                  ],
                                ),
                              ),
                              separadorHorizontal(context, 2),
                              SizedBox(
                                width: size.width * 0.25,
                                child: Column(
                                  children: [
                                    texto("* : Multiplicación.", fontApp,
                                        bigSize, negroColor, TextAlign.center),
                                    Image.asset(
                                      "assets/images/fundamentos/multiplicacion.png",
                                      height: 300,
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
                              SizedBox(
                                width: size.width * 0.4,
                                child: Column(
                                  children: [
                                    texto("/ : División.", fontApp, bigSize,
                                        negroColor, TextAlign.center),
                                    Image.asset(
                                      "assets/images/fundamentos/division.png",
                                      height: 300,
                                    ),
                                  ],
                                ),
                              ),
                              separadorHorizontal(context, 2),
                              SizedBox(
                                width: size.width * 0.4,
                                child: Column(
                                  children: [
                                    texto(
                                        "% : Módulo (resto de la división).",
                                        fontApp,
                                        bigSize,
                                        negroColor,
                                        TextAlign.center),
                                    Image.asset(
                                      "assets/images/fundamentos/modulo.png",
                                      height: 300,
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
                          texto("Precedencia de Operadores", fontApp, bigSize,
                              azulColor, TextAlign.center),
                          separadorVertical(context, 1),
                          RichText(
                            textAlign: TextAlign.justify,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Orden de operaciones: ",
                                  style: TextStyle(
                                    fontFamily: fontExtraBold,
                                    fontSize: bigSize,
                                    color: negroColor,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      "En matemáticas y en programación, el orden de operaciones es fundamental.",
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
                          Column(
                            children: [
                              texto(
                                  "Primero se realizan las operaciones entre paréntesis.",
                                  fontApp,
                                  bigSize,
                                  negroColor,
                                  TextAlign.center),
                              separadorVertical(context, 1),
                              texto(
                                  "Luego multiplicaciones y divisiones.",
                                  fontApp,
                                  bigSize,
                                  negroColor,
                                  TextAlign.center),
                              separadorVertical(context, 1),
                              texto(
                                  "Luego multiplicaciones y divisiones.",
                                  fontApp,
                                  bigSize,
                                  negroColor,
                                  TextAlign.center),
                              separadorVertical(context, 1),
                              texto("Ejemplo: resultado = (a + b) * c", fontApp,
                                  bigSize, negroColor, TextAlign.center),
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
                                    texto("Preguntas de selección", fontBold,
                                        20, negroColor, TextAlign.center),
                                    separadorVertical(context, 1),
                                    Pregunta(
                                      pregunta:
                                          "1. ¿Cuál es el operador de asignación en C++, Java y Python?",
                                      respuestas: respuestas1,
                                      colorActivo: azulOscColor,
                                      onRespuestaSeleccionada: (int index) {
                                        _handleRespuesta(index, (newValue) {
                                          _selectedRespuesta1 = newValue;
                                        });
                                      },
                                    ),
                                    separadorVertical(context, 1),
                                    Pregunta(
                                      pregunta:
                                          "¿Qué valor tendrá la variable x después de ejecutar la siguiente operación en C++, Java o Python? \n int x = 10; \n x += 5;",
                                      respuestas: respuestas2,
                                      colorActivo: azulOscColor,
                                      onRespuestaSeleccionada: (int index) {
                                        _handleRespuesta(index, (newValue) {
                                          _selectedRespuesta2 = newValue;
                                        });
                                      },
                                    ),
                                    separadorVertical(context, 1),
                                    Pregunta(
                                      pregunta:
                                          "3. ¿Cuál es el resultado de la operación aritmética 7 % 3 en C++, Java o Python?",
                                      respuestas: respuestas3,
                                      colorActivo: azulOscColor,
                                      onRespuestaSeleccionada: (int index) {
                                        _handleRespuesta(index, (newValue) {
                                          _selectedRespuesta3 = newValue;
                                        });
                                      },
                                    ),
                                    separadorVertical(context, 1),
                                    Pregunta(
                                      pregunta:
                                          "4. ¿Qué operador se utiliza para incrementar una variable en 1 en C++ y Java?",
                                      respuestas: respuestas4,
                                      colorActivo: azulOscColor,
                                      onRespuestaSeleccionada: (int index) {
                                        _handleRespuesta(index, (newValue) {
                                          _selectedRespuesta4 = newValue;
                                        });
                                      },
                                    ),
                                    separadorVertical(context, 1),
                                    Pregunta(
                                      pregunta:
                                          "5. En Java, ¿cuál es el resultado de la operación 15 / 4 si ambas variables son enteras?",
                                      respuestas: respuestas5,
                                      colorActivo: azulOscColor,
                                      onRespuestaSeleccionada: (int index) {
                                        _handleRespuesta(index, (newValue) {
                                          _selectedRespuesta5 = newValue;
                                        });
                                      },
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
                                        onTap: () {
                                          if (_selectedRespuesta1 == -1 ||
                                              _selectedRespuesta2 == -1 ||
                                              _selectedRespuesta3 == -1 ||
                                              _selectedRespuesta4 == -1 ||
                                              _selectedRespuesta5 == -1) {
                                            showDialog(
                                              context: context,
                                              builder: (context) =>
                                                  AlertaVolver(
                                                width: 250,
                                                height: 200,
                                                function: () {
                                                  Navigator.of(context).pop();
                                                },
                                                widthButton: 10,
                                                textoBoton: 'Volver',
                                                image: Image.asset(
                                                    'assets/images/warning.jpg',
                                                    height: 80),
                                                mensaje:
                                                    "Debes responder todas las preguntas",
                                                dobleBoton: false,
                                              ),
                                            );
                                            return;
                                          }
                                          _validarRespuestas();
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
                        ]))
                  ]))))
        ]));
  }
}
