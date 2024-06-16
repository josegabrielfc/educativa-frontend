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

class WhilePage extends StatefulWidget {
  static const name = 'while-page';
  const WhilePage({super.key});

  @override
  State<WhilePage> createState() => _WhilePageState();
}

class _WhilePageState extends State<WhilePage> {
  bool actividad = false;
  final TextEditingController _controllerPy1 = TextEditingController();
  final TextEditingController _controllerPy2 = TextEditingController();
  final TextEditingController _controllerJava = TextEditingController();
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
                provider.setSidebarItem(SidebarItem.ciclosDoWhile);
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
                    texto("Bucles While", fontExtraBold, bigSize + 24,
                        azulOscColor, TextAlign.center),
                    separadorVertical(context, 2),
                    SizedBox(
                      width: size.width * 0.5,
                      child: texto(
                          "Un ciclo while es una estructura de control en programación que permite ejecutar repetidamente un bloque de código mientras una condición especificada sea verdadera. A diferencia de otros tipos de bucles, como el for, el ciclo while se utiliza cuando no se sabe de antemano cuántas veces debe repetirse el bloque de código.",
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
                          "La sintaxis de un ciclo while es sencilla y consta de los siguientes elementos.",
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
                                          "Ejemplo en Python",
                                          fontExtraBold,
                                          bigSize + 2,
                                          negroColor,
                                          TextAlign.start),
                                      Image.asset(
                                        "images/bucles/py_while1.png",
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
                                        "images/bucles/java_while1.png",
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
                                        "images/bucles/java_while1.png",
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
                        "Condición: Es una expresión que se evalúa antes de cada iteración del bucle. Si la condición es verdadera, el bucle ejecuta el bloque de código; si es falsa, el bucle se detiene.\nBloque de Código: Es el conjunto de instrucciones que se ejecutarán repetidamente mientras la condición sea verdadera.",
                        fontMedium,
                        bigSize,
                        negroColor,
                        TextAlign.center),
                    separadorVertical(context, 5),
                    texto("Componentes del ciclo 'While'", fontExtraBold,
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
                                'Componentes de un\nWhile',
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
                              DataCell(texto('Inicialización', fontBold,
                                  bigSize, negroColor, TextAlign.start)),
                              DataCell(texto(
                                  'Es el punto donde se establece el valor inicial de las variables que controlan el bucle.\nEsto se realiza antes de que el bucle comience a ejecutarse.',
                                  fontApp,
                                  bigSize,
                                  negroColor,
                                  TextAlign.start)),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(texto('Condición', fontBold, bigSize,
                                  negroColor, TextAlign.start)),
                              DataCell(texto(
                                  'Es una expresión booleana que se evalúa antes de cada iteración del bucle.\nSi la condición es verdadera, el bloque de código dentro del bucle se ejecuta.\nSi es falsa, el bucle termina.',
                                  fontApp,
                                  bigSize,
                                  negroColor,
                                  TextAlign.start)),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(texto('Cuerpo del Bucle', fontBold,
                                  bigSize, negroColor, TextAlign.start)),
                              DataCell(texto(
                                  'Es el bloque de código que se ejecuta repetidamente mientras la condición sea verdadera.\nEste bloque puede contener cualquier cantidad de instrucciones y llamadas a funciones.',
                                  fontApp,
                                  bigSize,
                                  negroColor,
                                  TextAlign.start)),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(texto('Actualización', fontBold, bigSize,
                                  negroColor, TextAlign.start)),
                              DataCell(texto(
                                  'Es el punto donde se modifican las variables utilizadas en la condición para eventualmente hacer que la condición\nse vuelva falsa y el bucle termine.La actualización debe ser diseñada cuidadosamente para evitar bucles infinitos.',
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
                        "Un ejemplo clásico del uso de un ciclo 'while' es imprimir los números del 1 al 5.",
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
                                        "images/bucles/py_while2.png",
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
                                        "images/bucles/cpp_while2.png",
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
                                        "images/bucles/java_while2.png",
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
                    texto(
                        "El ciclo while es una herramienta poderosa y flexible que permite realizar repeticiones basadas en condiciones. Comprender cómo utilizar el ciclo while correctamente es esencial para desarrollar algoritmos eficientes y evitar errores comunes como los bucles infinitos.\n\nEn el siguiente tema, exploraremos en detalle otro tipo de bucle: el ciclo for, que es útil para iteraciones conocidas y estructuradas.",
                        fontMedium,
                        bigSize,
                        grisOscColor,
                        TextAlign.center),
                    separadorVertical(context, 3),
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
                                            "Completa el codigo para que el ciclo while sea funcional usando el lenguaje de programación Python",
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
                                                "numero = 1",
                                                fontApp,
                                                bigSize,
                                                negroColor,
                                                TextAlign.start),
                                            Row(children: [
                                              texto("while ", fontApp, bigSize,
                                                  negroColor, TextAlign.start),
                                              CustomTextFormField(
                                                controller: _controllerPy1,
                                                width: 90,
                                                height: 10,
                                                borderColor: azulClaColor,
                                                sizeMaxLength: 8,
                                                sizeMaxLines: 1,
                                              ),
                                              texto("<= 20:", fontApp, bigSize,
                                                  negroColor, TextAlign.start),
                                            ]),
                                            separadorVertical(context, 1),
                                            texto(
                                                "   if numero % 2 == 0:",
                                                fontApp,
                                                bigSize,
                                                negroColor,
                                                TextAlign.start),
                                            texto(
                                                "   print('Es par')",
                                                fontApp,
                                                bigSize,
                                                negroColor,
                                                TextAlign.start),
                                            separadorVertical(context, 1),
                                            texto("   else:", fontApp, bigSize,
                                                negroColor, TextAlign.start),
                                            Row(children: [
                                              texto(
                                                  "   print('Es ",
                                                  fontApp,
                                                  bigSize,
                                                  negroColor,
                                                  TextAlign.start),
                                              CustomTextFormField(
                                                controller: _controllerPy2,
                                                width: 90,
                                                height: 10,
                                                borderColor: azulClaColor,
                                                sizeMaxLength: 8,
                                                sizeMaxLines: 1,
                                              ),
                                              texto("')", fontApp, bigSize,
                                                  negroColor, TextAlign.start),
                                            ]),
                                            texto(
                                                "numero += 1",
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
                                            "Completa el codigo para que el ciclo while sea funcional usando el lenguaje de programación Java",
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
                                            texto("{", fontApp, bigSize,
                                                negroColor, TextAlign.start),
                                            texto(
                                                "   public static void main(String[] args) {",
                                                fontApp,
                                                bigSize,
                                                negroColor,
                                                TextAlign.start),
                                            texto(
                                                "   int contador = 1;",
                                                fontApp,
                                                bigSize,
                                                negroColor,
                                                TextAlign.start),
                                            Row(children: [
                                              texto(
                                                  "     while( ",
                                                  fontApp,
                                                  bigSize,
                                                  negroColor,
                                                  TextAlign.start),
                                              CustomTextFormField(
                                                controller: _controllerJava,
                                                width: 90,
                                                height: 10,
                                                borderColor: azulClaColor,
                                                sizeMaxLength: 8,
                                                sizeMaxLines: 1,
                                              ),
                                              texto(
                                                  " <= 15 ) {",
                                                  fontApp,
                                                  bigSize,
                                                  negroColor,
                                                  TextAlign.start),
                                            ]),
                                            separadorVertical(context, 1),
                                            texto(
                                                "      System.out.println(contador);",
                                                fontApp,
                                                bigSize,
                                                negroColor,
                                                TextAlign.start),
                                            texto(
                                                "      contador++;",
                                                fontApp,
                                                bigSize,
                                                negroColor,
                                                TextAlign.start),
                                            separadorVertical(context, 1),
                                            texto("     }", fontApp, bigSize,
                                                negroColor, TextAlign.start),
                                            texto("   }", fontApp, bigSize,
                                                negroColor, TextAlign.start),
                                            texto("}", fontApp, bigSize,
                                                negroColor, TextAlign.start),
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
                  ]),
                ),
              ))
        ]));
  }

  Future<void> registrarResultado() async {
    String respuestaCorrectaPy1 = "numero";
    String respuestaCorrectaPy2 = "impar";
    String respuestaCorrectaJava = "contador";
    double puntaje = 0;

    // Validación de las respuestas de Python
    if (_controllerPy1.text.trim() == respuestaCorrectaPy1) {
      puntaje += 16.66;
    }
    if (_controllerPy2.text.trim() == respuestaCorrectaPy2) {
      puntaje += 16.66;
    }

    // Validación de las respuestas de Java
    if (_controllerJava.text.trim() == respuestaCorrectaJava) {
      puntaje += 16.67;
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
            _controllerPy1.clear();
            _controllerPy2.clear();
            _controllerJava.clear();
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
