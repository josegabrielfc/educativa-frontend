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

class DoWhilePage extends StatefulWidget {
  static const name = 'do-while-page';
  const DoWhilePage({super.key});

  @override
  State<DoWhilePage> createState() => _DoWhilePageState();
}

class _DoWhilePageState extends State<DoWhilePage> {
  bool actividad = false;

  int? _selectedRespuesta1;
  int? _selectedRespuesta2;
  int? _selectedRespuesta3;
  int? _selectedRespuesta4;

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
    });
  }

  void _handleRespuesta(int index, Function(int) updateSelected) {
    setState(() {
      updateSelected(index);
    });
  }

  void _validarRespuestas() async {
    List<int> respuestasCorrectas = [0, 2, 1, 0];
    double puntaje = 0;

    if (_selectedRespuesta1 == respuestasCorrectas[0]) {
      puntaje += 25;
    }
    if (_selectedRespuesta2 == respuestasCorrectas[1]) {
      puntaje += 25;
    }
    if (_selectedRespuesta3 == respuestasCorrectas[2]) {
      puntaje += 25;
    }
    if (_selectedRespuesta4 == respuestasCorrectas[3]) {
      puntaje += 25;
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
    String temaId = usuarioProvider.buscarTemaPorNombre("Bucles do while")!;
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
    List<String> respuestas1 = [
      //A
      "A) do { ... } while (condición);",
      "B) while { ... } do (condición);",
      "C) do (condición) { ... } while;",
      "D) while (condición) { ... } do;"
    ];

    List<String> respuestas2 = [
      //C
      "A) do (i <= 5) { cout << i; i++; } while;",
      "B) while (i <= 5) { cout << i; i++; }",
      "C) do { cout << i; i++; } while (i <= 5);",
      "D) for (i = 1; i <= 5; i++) { cout << i; }"
    ];
    List<String> respuestas3 = ["A) Verdadero", "B) Falso"]; //B
    List<String> respuestas4 = [
      //A
      "A) while True: ... if not condición: break",
      "B) do: ... while condición",
      "C) while condición: ... do",
      "D) for i in range(condición): ..."
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
                provider.setSidebarItem(SidebarItem.ciclosFor);
              }),
        ),
        body: Stack(children: [
          Scaffold(
              backgroundColor: Colors.transparent.withOpacity(0.1),
              body: SizedBox(
                height: size.height,
                child: SingleChildScrollView(
                  child: Column(children: [
                    Image.asset(
                      'images/background.png',
                      width: size.width,
                      height: size.height * 0.3,
                      fit: BoxFit.cover,
                    ),
                    separadorVertical(context, 3),
                    texto("Bucles Do While", fontExtraBold, bigSize + 24,
                        azulOscColor, TextAlign.center),
                    separadorVertical(context, 2),
                    SizedBox(
                      width: size.width * 0.5,
                      child: texto(
                          "El ciclo do while es una estructura de control en programación que permite ejecutar un bloque de código al menos una vez y luego repetir la ejecución mientras una condición especificada sea verdadera. La principal diferencia con el ciclo while es que en el ciclo do while, el bloque de código se ejecuta antes de que la condición sea evaluada.",
                          fontApp,
                          bigSize,
                          negroColor,
                          TextAlign.justify),
                    ),
                    separadorVertical(context, 3),
                    Divider(
                      color: azulClaColor, // Color de la línea
                      thickness: 1, // Grosor de la línea
                      indent: 2, // Espaciado desde el borde izquierdo
                      endIndent: 2, // Espaciado desde el borde derecho
                    ),
                    separadorVertical(context, 2),
                    texto("Sintaxis Basica", fontExtraBold, bigSize + 8,
                        azulOscColor, TextAlign.center),
                    separadorVertical(context, 2),
                    SizedBox(
                      width: size.width * 0.7,
                      child: texto(
                          "La sintaxis de un ciclo do while es la siguiente:",
                          fontApp,
                          bigSize,
                          negroColor,
                          TextAlign.justify),
                    ),
                    separadorVertical(context, 3),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: size.width * 0.25,
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                      color: negroClaColor.withOpacity(0.6),
                                      spreadRadius: 2,
                                      blurRadius: 4,
                                      offset: const Offset(3, 4),
                                    )
                                  ],
                                  color: Colors.grey[350],
                                ),
                                width: size.width * 0.25,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      texto(
                                          "Ejemplo en C++",
                                          fontExtraBold,
                                          bigSize + 2,
                                          negroColor,
                                          TextAlign.start),
                                      Image.asset(
                                        "images/bucles/javacpp_dowhile.png",
                                        height: 200,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.25,
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                      color: negroClaColor.withOpacity(0.6),
                                      spreadRadius: 2,
                                      blurRadius: 4,
                                      offset: const Offset(3, 4),
                                    )
                                  ],
                                  color: Colors.grey[350],
                                ),
                                width: size.width * 0.25,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      texto(
                                          "Ejemplo en Java",
                                          fontExtraBold,
                                          bigSize + 2,
                                          negroColor,
                                          TextAlign.start),
                                      Image.asset(
                                        "images/bucles/javacpp_dowhile.png",
                                        height: 200,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    separadorVertical(context, 4),
                    texto(
                        "Como pueden ver no hay ejemplo de Python, es porque no existe una estructura de control do while como tal en este lenguaje. Sin embargo, se puede emular el comportamiento de un do while utilizando un bucle while con una condición que se verifica dentro del bucle.",
                        fontApp,
                        bigSize,
                        azulOscColor,
                        TextAlign.center),
                    separadorVertical(context, 3),
                    texto(
                        "Condición: Es una expresión que se evalúa antes de cada iteración del bucle. Si la condición es verdadera, el bucle ejecuta el bloque de código; si es falsa, el bucle se detiene.\nBloque de Código: Es el conjunto de instrucciones que se ejecutarán repetidamente mientras la condición sea verdadera.",
                        fontMedium,
                        bigSize,
                        negroColor,
                        TextAlign.center),
                    separadorVertical(context, 4),
                    Divider(
                      color: azulClaColor, // Color de la línea
                      thickness: 1, // Grosor de la línea
                      indent: 2, // Espaciado desde el borde izquierdo
                      endIndent: 2, // Espaciado desde el borde derecho
                    ),
                    separadorVertical(context, 3),
                    SizedBox(
                      width: size.width * 0.8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          texto(
                              "Caracteristicas del ciclo 'Do While'",
                              fontExtraBold,
                              extraBigSize,
                              azulColor,
                              TextAlign.start),
                          separadorVertical(context, 2),
                          ListView(
                            shrinkWrap: true,
                            children: [
                              ListTile(
                                leading: texto("1.", fontBold, bigSize,
                                    negroColor, TextAlign.center),
                                title: texto(
                                  "Ejecución Garantizada: El bloque de código dentro del ciclo do while se ejecuta al menos una vez, independientemente de si la condición es verdadera o falsa al inicio.",
                                  fontApp,
                                  bigSize,
                                  negroColor,
                                  TextAlign.start,
                                ),
                              ),
                              ListTile(
                                leading: texto("2.", fontBold, bigSize,
                                    negroColor, TextAlign.center),
                                title: texto(
                                  "Condición Evaluada al Final: La condición se evalúa después de ejecutar el bloque de código, lo que permite que el bucle se ejecute al menos una vez antes de verificar la condición.",
                                  fontApp,
                                  bigSize,
                                  negroColor,
                                  TextAlign.start,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                        width: size.width * 0.8,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            texto("Consideraciones Importantes", fontExtraBold,
                                extraBigSize, azulColor, TextAlign.start),
                            separadorVertical(context, 2),
                            texto("Bucles Infinitos:", fontBold, bigSize,
                                azulColor, TextAlign.start),
                            texto(
                                "Similar a otros tipos de bucles, es crucial asegurarse de que la condición de terminación sea alcanzable para evitar bucles infinitos.",
                                fontApp,
                                mediumSize,
                                negroColor,
                                TextAlign.start),
                            texto("Uso Adecuado:", fontBold, bigSize, azulColor,
                                TextAlign.start),
                            texto(
                                "El ciclo do while es particularmente útil cuando se desea que el bloque de código se ejecute al menos una vez antes de evaluar la condición.",
                                fontApp,
                                mediumSize,
                                negroColor,
                                TextAlign.start),
                          ],
                        )),
                    separadorVertical(context, 5),
                    Divider(
                      color: azulClaColor, // Color de la línea
                      thickness: 1, // Grosor de la línea
                      indent: 2, // Espaciado desde el borde izquierdo
                      endIndent: 2, // Espaciado desde el borde derecho
                    ),
                    separadorVertical(context, 3),
                    texto("Ejemplo Básico", fontExtraBold, extraBigSize,
                        azulColor, TextAlign.start),
                    separadorVertical(context, 2),
                    texto(
                        "Un ejemplo del uso de un ciclo 'Do while' es imprimir los números del 1 al 5.",
                        fontApp,
                        bigSize,
                        negroColor,
                        TextAlign.start),
                    separadorVertical(context, 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: size.width * 0.25,
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                      color: negroClaColor.withOpacity(0.6),
                                      spreadRadius: 2,
                                      blurRadius: 4,
                                      offset: const Offset(3, 4),
                                    )
                                  ],
                                  color: Colors.grey[350],
                                ),
                                width: size.width * 0.25,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      texto("C++", fontExtraBold, bigSize + 2,
                                          negroColor, TextAlign.start),
                                      Image.asset(
                                        "images/bucles/cpp_dowhile.png",
                                        height: 225,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.25,
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                      color: negroClaColor.withOpacity(0.6),
                                      spreadRadius: 2,
                                      blurRadius: 4,
                                      offset: const Offset(3, 4),
                                    )
                                  ],
                                  color: Colors.grey[350],
                                ),
                                width: size.width * 0.25,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      texto("Java", fontExtraBold, bigSize + 2,
                                          negroColor, TextAlign.start),
                                      Image.asset(
                                        "images/bucles/java_dowhile.png",
                                        height: 225,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    separadorVertical(context, 5),
                    texto("Conclusión", fontExtraBold, extraBigSize,
                        azulOscColor, TextAlign.start),
                    separadorVertical(context, 1),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 100),
                      child: texto(
                          "El ciclo do while es una herramienta útil en programación cuando se necesita garantizar que un bloque de código se ejecute al menos una vez. Comprender su sintaxis y características permite a los programadores elegir la estructura de control más adecuada para cada situación.",
                          fontMedium,
                          bigSize,
                          grisOscColor,
                          TextAlign.center),
                    ),
                    separadorVertical(context, 5),
                    Divider(
                      color: azulClaColor,
                      thickness: 2,
                      indent: 2,
                      endIndent: 2,
                    ),
                    separadorVertical(context, 3),
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
                              separadorVertical(context, 2.5),
                              texto("Preguntas de selección", fontBold, 20,
                                  azulColor, TextAlign.center),
                              separadorVertical(context, 2),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.225),
                                child: Pregunta(
                                  pregunta:
                                      "1. ¿Cuál es la estructura básica de un ciclo do-while en Java?\n",
                                  respuestas: respuestas1,
                                  colorActivo: azulOscColor,
                                  onRespuestaSeleccionada: (int index) {
                                    _handleRespuesta(index, (newValue) {
                                      _selectedRespuesta1 = newValue;
                                    });
                                  },
                                ),
                              ),
                              separadorVertical(context, 2),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.225),
                                child: Pregunta(
                                  pregunta:
                                      "2. ¿Cómo se usa un ciclo do-while en C++ para imprimir los números del 1 al 5?\n",
                                  respuestas: respuestas2,
                                  colorActivo: azulOscColor,
                                  onRespuestaSeleccionada: (int index) {
                                    _handleRespuesta(index, (newValue) {
                                      _selectedRespuesta2 = newValue;
                                    });
                                  },
                                ),
                              ),
                              separadorVertical(context, 2),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.225),
                                child: Pregunta(
                                  pregunta:
                                      "3. ¿Existe el ciclo do-while en Python?\n",
                                  respuestas: respuestas3,
                                  colorActivo: azulOscColor,
                                  onRespuestaSeleccionada: (int index) {
                                    _handleRespuesta(index, (newValue) {
                                      _selectedRespuesta3 = newValue;
                                    });
                                  },
                                ),
                              ),
                              separadorVertical(context, 2),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.225),
                                child: Pregunta(
                                  pregunta:
                                      "4. ¿Cómo se puede simular un ciclo do-while en Python, dado que no existe directamente en el lenguaje?\n",
                                  respuestas: respuestas4,
                                  colorActivo: azulOscColor,
                                  onRespuestaSeleccionada: (int index) {
                                    _handleRespuesta(index, (newValue) {
                                      _selectedRespuesta4 = newValue;
                                    });
                                  },
                                ),
                              ),
                              separadorVertical(context, 2),
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
                  ]),
                ),
              ))
        ]));
  }
}
