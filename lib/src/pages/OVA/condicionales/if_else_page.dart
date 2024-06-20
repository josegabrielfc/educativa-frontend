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

class IfElsePage extends StatefulWidget {
  static const name = 'if-else-page';
  const IfElsePage({super.key});

  @override
  State<IfElsePage> createState() => _IfElsePageState();
}

class _IfElsePageState extends State<IfElsePage> {
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

  Future<void> registrarResultado() async {

    double puntaje = 0;

    // Validación de las respuestas seleccionadas
    if (_selectedRespuesta1 != null && _selectedRespuesta1 == 0) {
      puntaje += 33.33;
    }
    if (_selectedRespuesta2 != null && _selectedRespuesta2 == 0) {
      puntaje += 33.33;
    }
    if (_selectedRespuesta3 != null && _selectedRespuesta3 == 0) {
      puntaje += 33.34;
    }

    // Aquí se puede calcular el puntaje total y construir el mensaje de acuerdo al puntaje obtenido
    String mensaje;
    if (puntaje == 3.0) {
      mensaje = "¡Todas las respuestas son correctas! Puntaje: $puntaje";
    } else if (puntaje >= 1.0 && puntaje < 3.0) {
      mensaje =
          "Muy bien, casi todas las respuestas son correctas. Puntaje: $puntaje";
    } else {
      mensaje = "Puntaje bajo. Inténtalo de nuevo. Puntaje: $puntaje";
    }

    // Aquí debes ajustar según tus necesidades para obtener el token y otros datos del usuario
    final usuarioProvider =
        Provider.of<UsuarioProvider>(context, listen: false);
    String token = usuarioProvider.token!;
    String usuarioId = usuarioProvider.usuario!;
    String temaId = usuarioProvider.buscarTemaPorNombre(
        "Bloque condicional if/else")!; // Asegúrate de tener el ID correcto del tema

    // Construyes el objeto ResultadoForm o similar según tu implementación
    ResultadoForm resultado = ResultadoForm(
      puntaje: puntaje,
      temaId: temaId,
      usuarioId: usuarioId,
    );

    // Aquí ajustas para hacer la llamada a tu servicio para registrar el resultado
    final serviceProvider =
        Provider.of<ServicesProvider>(context, listen: false);
    final response = await serviceProvider.resultadoService
        .registrarResultado(resultado, token);

    // Muestra un diálogo según la respuesta obtenida del servicio
    showDialog(
      barrierDismissible: false,
      // ignore: use_build_context_synchronously
      context: context,
      builder: (context) => AlertaVolver(
        width: 200,
        height: 210,
        function: () {
          Navigator.of(context).pop();
          setState(() {});
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
      "A) Evalúa una condición y, si es verdadera, ejecuta el bloque de código dentro de él.",
      "B) Ejecuta el bloque de código dentro de él sin evaluar ninguna condición.",
      "C) Siempre omite el bloque de código dentro de él.",
      "D) Repite el bloque de código dentro de él un número fijo de veces."
    ];

    List<String> respuestas2 = [
      "A) if-else if-else permite evaluar múltiples condiciones secuencialmente, mientras que if anidados evalúan condiciones dentro de otras condiciones.",
      "B) if-else if-else solo se puede usar en Python, mientras que if anidados solo se puede usar en C++.",
      "C) if-else if-else se usa para bucles, mientras que if anidados se usa para decisiones.",
      "D) No hay diferencia entre ellos; ambos se usan de la misma manera."
    ];

    List<String> respuestas3 = [
      "A) public class Main {\n  public static void main(String[] args) {\n    int a = 5;\n    int b = 3;\n    if (a > b) {\n      System.out.println('a es mayor que b');\n    } else {\n      System.out.println('a no es mayor que b');\n    }\n  }\n}",
      "B) public class Main {\n  public static void main(String[] args) {\n    int a = 5;\n    int b = 3;\n    if (a > b) {\nprint('a es mayor que b');\n    } else {\nprint('a no es mayor que b');\n    }\n  }\n}",
      "C) public class Main {\n  public static void main(String[] args) {\n    int a = 5;\n    int b = 3;\n    if (a > b)\n    print('a es mayor que b');\n    else\n    print('a no es mayor que b');\n  }\n}",
      "D) public class Main {\n  public static void main(String[] args) {\n    int a = 5;\n    int b = 3;\n    if (a > b):\n      System.out.println('a es mayor que b');\n    else:\n      System.out.println('a no es mayor que b');\n    }\n  }\n}"
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
                provider.setSidebarItem(SidebarItem.tiposIf);
              }),
        ),
        body: Stack(
          children: [
            Scaffold(
                backgroundColor: Colors.transparent.withOpacity(0.11),
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
                      separadorVertical(context, 2),
                      texto("Bloque Condicional if/else", fontExtraBold,
                          bigSize + 8, azulOscColor, TextAlign.center),
                      separadorVertical(context, 2),
                      SizedBox(
                          width: size.width * 0.9,
                          child: Column(
                            children: [
                              texto(
                                  "La sentencia if también se conoce como una sentencia de toma de decisiones, ya que toma una decisión sobre la base de una condición o expresión dada. El bloque de código dentro de la instrucción if que se ejecuta es la condición evaluada como true. Sin embargo, el código dentro de las llaves se omite si la condición es evaluada como false, y el código después de la sentencia if es ejecutado.",
                                  fontApp,
                                  bigSize,
                                  negroColor,
                                  TextAlign.justify),
                              separadorVertical(context, 2),
                              texto("Ejemplos de Código", fontBold, bigSize,
                                  azulOscColor, TextAlign.start),
                              separadorVertical(context, 1),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(16),
                                    color: Colors.grey[200],
                                    width: size.width * 0.3,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        texto("Java", fontBold, bigSize,
                                            azulOscColor, TextAlign.start),
                                        texto(
                                            "public class Main {\n"
                                            "  public static void main(String[] args) {\n"
                                            "    int a = 5;\n"
                                            "    int b = 3;\n"
                                            "    if (a > b) {\n"
                                            "      System.out.println('a es mayor que b');\n"
                                            "    } else {\n"
                                            "      System.out.println('a no es mayor que b');\n"
                                            "    }\n"
                                            "  }\n"
                                            "}",
                                            fontApp,
                                            bigSize - 2,
                                            Colors.black87,
                                            TextAlign.start),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(16),
                                    color: Colors.grey[200],
                                    width: size.width * 0.3,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        texto("C++", fontBold, bigSize,
                                            azulOscColor, TextAlign.start),
                                        texto(
                                            "#include <iostream>\n"
                                            "using namespace std;\n"
                                            "int main() {\n"
                                            "  int a = 5;\n"
                                            "  int b = 3;\n"
                                            "  if (a > b) {\n"
                                            "    cout << 'a es mayor que b' << endl;\n"
                                            "  } else {\n"
                                            "    cout << 'a no es mayor que b' << endl;\n"
                                            "  }\n"
                                            "  return 0;\n"
                                            "}",
                                            fontApp,
                                            bigSize - 2,
                                            Colors.black87,
                                            TextAlign.start),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(16),
                                    color: Colors.grey[200],
                                    width: size.width * 0.2,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        texto("Python", fontBold, bigSize,
                                            azulOscColor, TextAlign.start),
                                        texto(
                                            "a = 5\n"
                                            "b = 3\n"
                                            "if a > b:\n"
                                            "    print('a es mayor que b')\n"
                                            "else:\n"
                                            "    print('a no es mayor que b')",
                                            fontApp,
                                            bigSize - 2,
                                            Colors.black87,
                                            TextAlign.start),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              separadorVertical(context, 2),
                              texto("Explicación del Código", fontBold, bigSize,
                                  azulOscColor, TextAlign.start),
                              texto(
                                  "En los ejemplos anteriores, tenemos dos variables enteras, a y b. Usamos un bloque condicional if-else para verificar si a es mayor que b. Si la condición es verdadera, se imprime 'a es mayor que b'. De lo contrario, se imprime 'a no es mayor que b'.",
                                  fontApp,
                                  bigSize,
                                  negroColor,
                                  TextAlign.justify),
                              separadorVertical(context, 2),
                              texto("Variaciones de if/else", fontBold, bigSize,
                                  azulOscColor, TextAlign.start),
                              separadorVertical(context, 1),
                              texto(
                                  "1. if-else if-else: Esta estructura permite evaluar múltiples condiciones secuencialmente. Si una condición se evalúa como verdadera, se ejecuta el bloque de código correspondiente y se omiten las siguientes condiciones.",
                                  fontApp,
                                  bigSize,
                                  negroColor,
                                  TextAlign.justify),
                              separadorVertical(context, 1),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(16),
                                    color: Colors.grey[200],
                                    width: size.width * 0.3,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        texto("Java", fontBold, bigSize,
                                            azulOscColor, TextAlign.start),
                                        texto(
                                            "public class Main {\n"
                                            "  public static void main(String[] args) {\n"
                                            "    int a = 5;\n"
                                            "    int b = 3;\n"
                                            "    int c = 4;\n"
                                            "    if (a > b) {\n"
                                            "      System.out.println('a es mayor que b');\n"
                                            "    } else if (a > c) {\n"
                                            "      System.out.println('a es mayor que c');\n"
                                            "    } else {\n"
                                            "      System.out.println('a no es mayor que b ni c');\n"
                                            "    }\n"
                                            "  }\n"
                                            "}",
                                            fontApp,
                                            bigSize - 2,
                                            Colors.black87,
                                            TextAlign.start),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(16),
                                    color: Colors.grey[200],
                                    width: size.width * 0.3,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        texto("C++", fontBold, bigSize,
                                            azulOscColor, TextAlign.start),
                                        texto(
                                            "#include <iostream>\n"
                                            "using namespace std;\n"
                                            "int main() {\n"
                                            "  int a = 5;\n"
                                            "  int b = 3;\n"
                                            "  int c = 4;\n"
                                            "  if (a > b) {\n"
                                            "    cout << 'a es mayor que b' << endl;\n"
                                            "  } else if (a > c) {\n"
                                            "    cout << 'a es mayor que c' << endl;\n"
                                            "  } else {\n"
                                            "    cout << 'a no es mayor que b ni c' << endl;\n"
                                            "  }\n"
                                            "  return 0;\n"
                                            "}",
                                            fontApp,
                                            bigSize - 2,
                                            Colors.black87,
                                            TextAlign.start),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(16),
                                    color: Colors.grey[200],
                                    width: size.width * 0.2,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        texto("Python", fontBold, bigSize,
                                            azulOscColor, TextAlign.start),
                                        texto(
                                            "a = 5\n"
                                            "b = 3\n"
                                            "c = 4\n"
                                            "if a > b:\n"
                                            "    print('a es mayor que b')\n"
                                            "elif a > c:\n"
                                            "    print('a es mayor que c')\n"
                                            "else:\n"
                                            "    print('a no es mayor que b ni c')",
                                            fontApp,
                                            bigSize - 2,
                                            Colors.black87,
                                            TextAlign.start),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              separadorVertical(context, 2),
                              texto(
                                  "2. if anidados: Puedes anidar sentencias if dentro de otras sentencias if para evaluar condiciones más complejas.",
                                  fontApp,
                                  bigSize,
                                  negroColor,
                                  TextAlign.justify),
                              separadorVertical(context, 1),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(16),
                                    color: Colors.grey[200],
                                    width: size.width * 0.3,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        texto("Java", fontBold, bigSize,
                                            azulOscColor, TextAlign.start),
                                        texto(
                                            "public class Main {\n"
                                            "  public static void main(String[] args) {\n"
                                            "    int a = 5;\n"
                                            "    int b = 3;\n"
                                            "    int c = 4;\n"
                                            "    if (a > b) {\n"
                                            "      if (a > c) {\n"
                                            "        System.out.println('a es mayor que b y c');\n"
                                            "      } else {\n"
                                            "        System.out.println('a es mayor que b pero no mayor que c');\n"
                                            "      }\n"
                                            "    } else {\n"
                                            "      System.out.println('a no es mayor que b');\n"
                                            "    }\n"
                                            "  }\n"
                                            "}",
                                            fontApp,
                                            bigSize - 2,
                                            Colors.black87,
                                            TextAlign.start),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(16),
                                    color: Colors.grey[200],
                                    width: size.width * 0.3,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        texto("C++", fontBold, bigSize,
                                            azulOscColor, TextAlign.start),
                                        texto(
                                            "#include <iostream>\n"
                                            "using namespace std;\n"
                                            "int main() {\n"
                                            "  int a = 5;\n"
                                            "  int b = 3;\n"
                                            "  int c = 4;\n"
                                            "  if (a > b) {\n"
                                            "    if (a > c) {\n"
                                            "      cout << 'a es mayor que b y c' << endl;\n"
                                            "    } else {\n"
                                            "      cout << 'a es mayor que b pero no mayor que c' << endl;\n"
                                            "    }\n"
                                            "  } else {\n"
                                            "    cout << 'a no es mayor que b' << endl;\n"
                                            "  }\n"
                                            "  return 0;\n"
                                            "}",
                                            fontApp,
                                            bigSize - 2,
                                            Colors.black87,
                                            TextAlign.start),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(16),
                                    color: Colors.grey[200],
                                    width: size.width * 0.2,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        texto("Python", fontBold, bigSize,
                                            azulOscColor, TextAlign.start),
                                        texto(
                                            "a = 5\n"
                                            "b = 3\n"
                                            "c = 4\n"
                                            "if a > b:\n"
                                            "    if a > c:\n"
                                            "        print('a es mayor que b y c')\n"
                                            "    else:\n"
                                            "        print('a es mayor que b pero no mayor que c')\n"
                                            "else:\n"
                                            "    print('a no es mayor que b')",
                                            fontApp,
                                            bigSize - 2,
                                            Colors.black87,
                                            TextAlign.start),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              separadorVertical(context, 2),
                              texto(
                                  "Conclusión: Los bloques condicionales if/else son fundamentales en la programación, ya que permiten ejecutar diferentes bloques de código según las condiciones especificadas. Es esencial entender cómo y cuándo usarlos para escribir programas eficientes y claros.",
                                  fontApp,
                                  bigSize,
                                  negroColor,
                                  TextAlign.justify),
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
                                        texto(
                                            "Preguntas de selección",
                                            fontBold,
                                            20,
                                            negroColor,
                                            TextAlign.center),
                                        separadorVertical(context, 1),
                                        Pregunta(
                                          pregunta:
                                              "1. ¿Qué hace un bloque condicional if en un programa?",
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
                                              "2. ¿Cuál es la diferencia principal entre if-else if-else e if anidados?",
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
                                              "3. ¿Cuál de los siguientes es un ejemplo correcto de un bloque if/else en Python?",
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
                                                  builder: (context) =>
                                                      AlertaVolver(
                                                    width: 250,
                                                    height: 200,
                                                    function: () {
                                                      Navigator.of(context)
                                                          .pop();
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
                                              registrarResultado();
                                            }),
                                      ],
                                    )
                                  : Container(),
                              separadorVertical(context, 2),
                              Divider(
                                color: azulClaColor, // Color de la línea
                                thickness: 1, // Grosor de la línea
                                indent: 2, // Espaciado desde el borde izquierdo
                                endIndent:
                                    2, // Espaciado desde el borde derecho
                              ),
                              separadorVertical(context, 2),
                            ],
                          )),
                    ]))))
          ],
        ));
  }
}
