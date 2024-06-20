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

class TiposIfPage extends StatefulWidget {
  static const name = 'tipos-if-page';
  const TiposIfPage({super.key});

  @override
  State<TiposIfPage> createState() => _TiposIfPageState();
}

class _TiposIfPageState extends State<TiposIfPage> {
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
    if (_selectedRespuesta2 != null && _selectedRespuesta2 == 2) {
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
        "Tipos de if")!; // Asegúrate de tener el ID correcto del tema

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
      "A) Permite evaluar una sola condición y ejecutar un bloque de código si la condición es verdadera.",
      "B) Permite evaluar múltiples condiciones secuencialmente y ejecutar diferentes bloques de código según la condición.",
      "C) Se usa para bucles y repite el bloque de código varias veces.",
      "D) Siempre omite el bloque de código dentro de él."
    ];

    List<String> respuestas2 = [
      "A) El bloque if solo se ejecuta si la condición es verdadera, mientras que else se ejecuta si la condición es falsa.",
      "B) if se usa para bucles, mientras que else se usa para condicionales.",
      "C) if-else if-else permite evaluar múltiples condiciones secuencialmente, mientras que else solo se ejecuta si todas las condiciones anteriores son falsas.",
      "D) No hay diferencia entre ellos; ambos se usan de la misma manera."
    ];

    List<String> respuestas3 = [
      "A) if-else anidados permiten evaluar condiciones dentro de otras condiciones.",
      "B) if-else anidados permiten evaluar múltiples condiciones secuencialmente.",
      "C) if-else anidados se usan para bucles, mientras que if-else if-else se usa para decisiones.",
      "D) No hay diferencia entre ellos; ambos se usan de la misma manera."
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
                provider.setSidebarItem(SidebarItem.variables);
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
                      texto("Tipos de Sentencias if", fontExtraBold,
                          bigSize + 8, azulOscColor, TextAlign.center),
                      separadorVertical(context, 2),
                      SizedBox(
                          width: size.width * 0.9,
                          child: Column(
                            children: [
                              texto(
                                  "Las sentencias if son fundamentales en la programación, ya que permiten tomar decisiones basadas en condiciones específicas. A continuación, se presentan los diferentes tipos de sentencias if que puedes encontrar en varios lenguajes de programación.",
                                  fontApp,
                                  bigSize,
                                  negroColor,
                                  TextAlign.justify),
                              separadorVertical(context, 2),
                              texto("if Simple", fontBold, bigSize,
                                  azulOscColor, TextAlign.center),
                              separadorVertical(context, 2),
                              texto(
                                  "Si la condición especificada es verdadera, se ejecutan ciertas actividades. Sin embargo, si la condición es falsa, no se llevan a cabo actividades en ese camino alternativo.",
                                  fontApp,
                                  bigSize,
                                  negroColor,
                                  TextAlign.justify),
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
                              texto("if-else if-else", fontBold, bigSize,
                                  azulOscColor, TextAlign.start),
                              texto(
                                  "Esta estructura permite evaluar múltiples condiciones secuencialmente. Si una condición se evalúa como verdadera, se ejecuta el bloque de código correspondiente y se omiten las siguientes condiciones.",
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
                              texto("if anidados", fontBold, bigSize,
                                  azulOscColor, TextAlign.start),
                              texto(
                                  "Esta estructura permite evaluar una condición dentro de otra condición. Se utiliza para tomar decisiones más complejas.",
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
                                            "        System.out.println('a es mayor que b pero no que c');\n"
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
                                            "      cout << 'a es mayor que b pero no que c' << endl;\n"
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
                                            "        print('a es mayor que b pero no que c')\n"
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
                                              "1. ¿Cuál es la función principal de una sentencia if en la programación?",
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
                                              "2. ¿Cuál es la diferencia entre if-else y if-else if-else?",
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
                                              "3. ¿Qué son las sentencias if anidadas?",
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
