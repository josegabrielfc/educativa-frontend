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

class ForPage extends StatefulWidget {
  static const name = 'for-page';
  const ForPage({super.key});

  @override
  State<ForPage> createState() => _ForPageState();
}

class _ForPageState extends State<ForPage> {
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
    List<int> respuestasCorrectas = [3, 1, 0, 1];
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
    String temaId = usuarioProvider.buscarTemaPorNombre("Bucles for")!;
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
    List<String> respuestas1 = [ //D
      "A) 1 2 3 4",
      "B) 1 2 3 4 5",
      "C) 0 1 2 3 4 5",
      "D) 0 1 2 3 4"
    ];

    List<String> respuestas2 = [ //B
      "A) 1 2 3 4 5 6",
      "B) 1 2 2 4 3 6",
      "C) 2 4 6 8",
      "D) 1 4 9"
    ];
    List<String> respuestas3 = [ //A
      "A) 0 0 0 1 0 2",
      "B) 0 0 1 2 3 4",
      "C) 0 0 0 1 0 2 0 3",
      "D) 0 0 0 0 1 2"
    ];
    List<String> respuestas4 = ["A) 15", "B) 25", "C) 20", "D) 30"]; //B
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
                provider.setSidebarItem(SidebarItem.equivalenciaWhile);
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
                    texto("Bucles For", fontExtraBold, bigSize + 24,
                        azulOscColor, TextAlign.center),
                    separadorVertical(context, 2),
                    SizedBox(
                      width: size.width * 0.5,
                      child: texto(
                          "El ciclo for es una estructura de control en programación que permite ejecutar repetidamente un bloque de código un número específico de veces. Es especialmente útil cuando se conoce de antemano el número de iteraciones que se necesitan. A diferencia del ciclo while, el ciclo for combina la inicialización, la condición y la actualización de la variable de control en una sola línea.",
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
                      child: texto("La sintaxis de un ciclo for es:", fontApp,
                          bigSize, negroColor, TextAlign.justify),
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
                                          "Ejemplo en Python",
                                          fontExtraBold,
                                          bigSize + 2,
                                          negroColor,
                                          TextAlign.start),
                                      Image.asset(
                                        "images/bucles/py_for.png",
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
                                          "Ejemplo en C++",
                                          fontExtraBold,
                                          bigSize + 2,
                                          negroColor,
                                          TextAlign.start),
                                      Image.asset(
                                        "images/bucles/javacpp_for.png",
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
                                        "images/bucles/javacpp_for.png",
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
                    separadorVertical(context, 3),
                    texto(
                        "Python:\n\nvariable: Es la variable de control que toma el valor de cada elemento del iterable en cada iteración.\niterable: Es cualquier objeto de Python que puede ser iterado (como listas, cadenas, rangos, etc.).\nBloque de Código: Conjunto de instrucciones que se ejecutan en cada iteración.\n\nJava & C++ :\n\nInicialización: Es la parte donde se inicializa la variable de control del bucle.\nCondición: Es una expresión booleana que se evalúa antes de cada iteración. Si es verdadera, el bloque de código se ejecuta. Si es falsa, el bucle termina.\nActualización: Es la modificación de la variable de control, que ocurre al final de cada iteración.",
                        fontMedium,
                        bigSize,
                        negroColor,
                        TextAlign.center),
                    separadorVertical(context, 5),
                    texto("Características del ciclo 'For'", fontExtraBold,
                        extraBigSize, azulColor, TextAlign.start),
                    separadorVertical(context, 2),
                    SizedBox(
                      child: DataTable(
                        columnSpacing: 20,
                        border: TableBorder.all(
                            borderRadius: BorderRadius.circular(20),
                            color: azulColor),
                        columns: [
                          DataColumn(
                            label: texto(
                                'Características de\nun ciclo For',
                                fontExtraBold,
                                bigSize + 2,
                                azulOscColor,
                                TextAlign.center),
                          ),
                          DataColumn(
                            label: texto('Descripción', fontExtraBold,
                                bigSize + 2, azulOscColor, TextAlign.center),
                          ),
                        ],
                        rows: [
                          DataRow(
                            cells: [
                              DataCell(texto('Iteraciones Definidas', fontBold,
                                  bigSize, negroColor, TextAlign.start)),
                              DataCell(texto(
                                  'El ciclo for es ideal cuando se conoce el número exacto de iteraciones que se deben realizar.',
                                  fontApp,
                                  bigSize,
                                  negroColor,
                                  TextAlign.start)),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(texto('Control Compacto', fontBold,
                                  bigSize, negroColor, TextAlign.start)),
                              DataCell(texto(
                                  'Combina la inicialización, la condición y la actualización de la variable de control\nen una sola línea, lo que hace el código más compacto y fácil de leer.',
                                  fontApp,
                                  bigSize,
                                  negroColor,
                                  TextAlign.start)),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(texto(
                                  'Iteración a través de Colecciones',
                                  fontBold,
                                  bigSize,
                                  negroColor,
                                  TextAlign.start)),
                              DataCell(texto(
                                  'En Python, el ciclo for es especialmente útil para iterar a través\nde colecciones\ncomo listas, tuplas y diccionarios.',
                                  fontApp,
                                  bigSize,
                                  negroColor,
                                  TextAlign.start)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    separadorVertical(context, 5),
                    SizedBox(
                      width: size.width * 0.8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          texto("Consideraciones Importantes", fontExtraBold,
                              extraBigSize, azulColor, TextAlign.start),
                          separadorVertical(context, 2),
                          ListView(
                            shrinkWrap: true,
                            children: [
                              ListTile(
                                leading: texto(
                                    "1. Condición de Salida:",
                                    fontBold,
                                    bigSize,
                                    negroColor,
                                    TextAlign.center),
                                title: texto(
                                  "Es crucial asegurarse de que la condición del bucle se cumpla para evitar bucles infinitos.",
                                  fontApp,
                                  bigSize,
                                  negroColor,
                                  TextAlign.start,
                                ),
                              ),
                              ListTile(
                                leading: texto("2. Eficiencia:", fontBold,
                                    bigSize, negroColor, TextAlign.center),
                                title: texto(
                                  "Utilizar el ciclo for adecuadamente puede mejorar la eficiencia y legibilidad del código.",
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
                    separadorVertical(context, 4),
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
                        "Un ejemplo clásico del uso de un ciclo 'for' es imprimir los números del 1 al 5.",
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
                                      texto(
                                          "Python",
                                          fontExtraBold,
                                          bigSize + 2,
                                          negroColor,
                                          TextAlign.start),
                                      Image.asset(
                                        "images/bucles/py_for1.png",
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
                                      texto("C++", fontExtraBold, bigSize + 2,
                                          negroColor, TextAlign.start),
                                      Image.asset(
                                        "images/bucles/cpp_for.png",
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
                                        "images/bucles/java_for.png",
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
                          "El ciclo for es una herramienta poderosa y versátil en programación, adecuada para situaciones donde se necesita un número definido de iteraciones. Entender su sintaxis y características es esencial para escribir código limpio y eficiente.",
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
                                      "1. ¿Cuál es el resultado del siguiente código en Java?\nfor (int i = 0; i < 5; i++) {\n  System.out.print(i + \" \");\n}",
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
                                      "2. ¿Qué imprimirá el siguiente código en C++?\nfor (int i = 1; i <= 3; i++) {\n  for (int j = 1; j <= 2; j++) {\n    cout << i * j << \" \";\n  }\n}",
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
                                      "3. ¿Cuál es la salida del siguiente código en Python?\nfor i in range(3):\n  for j in range(2):\n    print(i * j, end=\" \")",
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
                                      "4. ¿Qué valor imprimirá el siguiente código en Java?\nint sum = 0;\nfor (int i = 0; i <= 10; i+=2) {\n  sum += i;\n}\nSystem.out.println(sum);",
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
