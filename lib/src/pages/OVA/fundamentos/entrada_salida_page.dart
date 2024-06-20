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

class EntradaSalidaPage extends StatefulWidget {
  static const name = 'entradaSalida-page';
  const EntradaSalidaPage({super.key});

  @override
  State<EntradaSalidaPage> createState() => _EntradaSalidaPageState();
}

class _EntradaSalidaPageState extends State<EntradaSalidaPage> {
  bool actividad = false;

  int? _selectedRespuesta1;
  int? _selectedRespuesta2;
  int? _selectedRespuesta3;

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
    });
  }

  void _handleRespuesta(int index, Function(int) updateSelected) {
    setState(() {
      updateSelected(index);
    });
  }

  void _validarRespuestas() async {
    List<int> respuestasCorrectas = [2, 0, 0];
    double puntaje = 0;

    if (_selectedRespuesta1 == respuestasCorrectas[0]) {
      puntaje += 33.3;
    }
    if (_selectedRespuesta2 == respuestasCorrectas[1]) {
      puntaje += 33.3;
    }
    if (_selectedRespuesta3 == respuestasCorrectas[2]) {
      puntaje += 33.4;
    }

    String mensaje;

    if (puntaje <= 100 && puntaje > 75) {
      mensaje = "¡Todas las respuestas son correctas! Puntaje: $puntaje";
    } else if (puntaje <= 75 && puntaje > 50) {
      mensaje =
          "Muy bien, casi todas las respuestas son correctas. Puntaje: $puntaje";
    } else {
      mensaje = "Puntaje bajo. Inténtalo de nuevo. Puntaje: $puntaje";
    }

    final usuarioProvider =
        // ignore: use_build_context_synchronously
        Provider.of<UsuarioProvider>(context, listen: false);

    String token = usuarioProvider.token!;
    String usuarioId = usuarioProvider.usuario!;
    String temaId =
        usuarioProvider.buscarTemaPorNombre("Instrucciones de entrada/salida")!;
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
          loadData();
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

    List<String> respuestas1 = ["A) print()", "B) cout", "C) cin", "D) scanf"];

    List<String> respuestas2 = [
      "A) System.out.print()",
      "B) Console.read()",
      "C) Input.read()",
      "D) System.in.read()"
    ];

    List<String> respuestas3 = [
      "A) input()",
      "B) read()",
      "C) scanf()",
      "D) cin"
    ];

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
              provider.setSidebarItem(SidebarItem.operadoresAsignacion);
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
                      "Instrucciones de entrada/salida por consola estándar (Teclado y Pantalla)",
                      fontExtraBold,
                      bigSize + 8,
                      azulColor,
                      TextAlign.center),
                  separadorVertical(context, 2),
                  SizedBox(
                      width: size.width * 0.9,
                      child: Column(children: [
                        texto(
                            "Las instrucciones de entrada/salida son comandos que permiten al programa recibir datos del usuario (entrada) y mostrar información al usuario (salida).",
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
                        Row(
                          children: [
                            SizedBox(
                              width: size.width * 0.45,
                              child: Column(
                                children: [
                                  texto("Entrada de datos en Python.", fontApp,
                                      bigSize, negroColor, TextAlign.center),
                                  Image.asset(
                                    "assets/images/fundamentos/entrada-python.png",
                                    width: 300,
                                  ),
                                  separadorVertical(context, 2),
                                  Image.asset(
                                    "assets/images/fundamentos/entrada-consola-python.png",
                                    width: 300,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.45,
                              child: Column(
                                children: [
                                  texto("Salida de datos en Python.", fontApp,
                                      bigSize, negroColor, TextAlign.center),
                                  Image.asset(
                                    "assets/images/fundamentos/salida-python.png",
                                    width: 300,
                                  ),
                                  separadorVertical(context, 2),
                                  Image.asset(
                                    "assets/images/fundamentos/salida-consola-python.png",
                                    width: 200,
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
                        Row(
                          children: [
                            SizedBox(
                              width: size.width * 0.45,
                              child: Column(
                                children: [
                                  texto("Entrada de datos en C++.", fontApp,
                                      bigSize, negroColor, TextAlign.center),
                                  Image.asset(
                                    "assets/images/fundamentos/entrada-c.png",
                                    width: 300,
                                  ),
                                  separadorVertical(context, 2),
                                  Image.asset(
                                    "assets/images/fundamentos/entrada-consola-c.png",
                                    width: 300,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.45,
                              child: Column(
                                children: [
                                  texto("Salida de datos en C++.", fontApp,
                                      bigSize, negroColor, TextAlign.center),
                                  Image.asset(
                                    "assets/images/fundamentos/salida-c.png",
                                    width: 400,
                                  ),
                                  separadorVertical(context, 2),
                                  Image.asset(
                                    "assets/images/fundamentos/salida-consola-c.png",
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
                        Row(
                          children: [
                            SizedBox(
                              width: size.width * 0.45,
                              child: Column(
                                children: [
                                  texto("Entrada de datos en Java.", fontApp,
                                      bigSize, negroColor, TextAlign.center),
                                  Image.asset(
                                    "assets/images/fundamentos/entrada-java.png",
                                    width: 300,
                                  ),
                                  separadorVertical(context, 2),
                                  Image.asset(
                                    "assets/images/fundamentos/entrada-consola-java.png",
                                    width: 300,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.45,
                              child: Column(
                                children: [
                                  texto("Salida de datos en Java.", fontApp,
                                      bigSize, negroColor, TextAlign.center),
                                  Image.asset(
                                    "assets/images/fundamentos/salida-java.png",
                                    width: 400,
                                  ),
                                  separadorVertical(context, 2),
                                  Image.asset(
                                    "assets/images/fundamentos/salida-consola-java.png",
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
                                web: 0.22, cel: 0.64, sizeContext: size.width),
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
                                  texto("Preguntas de selección", fontBold, 20,
                                      negroColor, TextAlign.center),
                                  separadorVertical(context, 1),
                                  Pregunta(
                                    pregunta:
                                        "1. ¿Cuál es la instrucción en C++ para leer una entrada desde el teclado?",
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
                                        "2. ¿Qué función se utiliza en Java para mostrar una salida en la consola?",
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
                                        "3. ¿Cómo se lee una entrada del usuario en Python?",
                                    respuestas: respuestas3,
                                    colorActivo: azulOscColor,
                                    onRespuestaSeleccionada: (int index) {
                                      _handleRespuesta(index, (newValue) {
                                        _selectedRespuesta3 = newValue;
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
                                            _selectedRespuesta3 == -1) {
                                          showDialog(
                                            context: context,
                                            builder: (context) => AlertaVolver(
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
      ]),
    );
  }
}
