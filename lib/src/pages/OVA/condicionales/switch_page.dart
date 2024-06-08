import 'package:educativa_frontend/src/config/environment/environment.dart';
import 'package:educativa_frontend/src/widgets/sidebar_widget.dart';
import 'package:educativa_frontend/src/widgets/widgets_general.dart';
import 'package:flutter/material.dart';

class SwitchPage extends StatefulWidget {
  static const name = 'switch-page';
  const SwitchPage({super.key});

  @override
  State<SwitchPage> createState() => _SwitchPageState();
}

class _SwitchPageState extends State<SwitchPage> {
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
    List<int> respuestasCorrectas = [0, 1, 0];
    double puntaje = 0;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    List<String> respuestas1 = [
      "A) switch evalúa una sola expresión contra múltiples casos y ejecuta el bloque de código correspondiente al caso coincidente.",
      "B) switch se utiliza exclusivamente para bucles.",
      "C) switch evalúa múltiples expresiones al mismo tiempo.",
      "D) switch se utiliza para definir variables."
    ];

    List<String> respuestas2 = [
      "A) case y break se utilizan para definir bloques de código dentro de switch.",
      "B) case define una condición y break termina la ejecución del switch.",
      "C) case se utiliza para bucles y break para condicionales.",
      "D) case y break se utilizan de la misma manera en todos los contextos."
    ];

    List<String> respuestas3 = [
      "A) default se ejecuta si ninguna de las condiciones especificadas en los case coincide.",
      "B) default se utiliza para definir variables.",
      "C) default siempre se ejecuta al inicio.",
      "D) default se utiliza para definir expresiones."
    ];

    return Scaffold(
      drawer: const SidebarWidget(),
      appBar: AppBar(
        title: const Text('Switch'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Stack(
        children: [
          Scaffold(
            backgroundColor: Colors.transparent.withOpacity(0.11),
            body: SizedBox(
              height: size.height,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset(
                      'images/background.png',
                      width: size.width,
                      height: size.height * 0.3,
                      fit: BoxFit.cover,
                    ),
                    separadorVertical(context, 2),
                    _buildTitle("Sentencias Switch", size),
                    separadorVertical(context, 2),
                    _buildParagraph(
                        "La sentencia switch es una estructura de control que permite evaluar una expresión "
                        "y ejecutar diferentes bloques de código basándose en el valor de la expresión. Es una "
                        "alternativa más clara y organizada a múltiples sentencias if-else cuando se necesita "
                        "evaluar una sola variable o expresión contra múltiples valores posibles.",
                        size),
                    separadorVertical(context, 2),
                    _buildSubTitle("Ejemplo en Java", size),
                    _buildCodeBlock(
                        "public class Main {\n"
                        "  public static void main(String[] args) {\n"
                        "    int day = 3;\n"
                        "    switch (day) {\n"
                        "      case 1:\n"
                        "        System.out.println('Lunes');\n"
                        "        break;\n"
                        "      case 2:\n"
                        "        System.out.println('Martes');\n"
                        "        break;\n"
                        "      case 3:\n"
                        "        System.out.println('Miércoles');\n"
                        "        break;\n"
                        "      default:\n"
                        "        System.out.println('Día no válido');\n"
                        "    }\n"
                        "  }\n"
                        "}",
                        size),
                    SizedBox(height: 20),
                    _buildSubTitle("Ejemplo en C++", size),
                    _buildCodeBlock(
                        "#include <iostream>\n"
                        "using namespace std;\n"
                        "int main() {\n"
                        "  int day = 3;\n"
                        "  switch (day) {\n"
                        "    case 1:\n"
                        "      cout << 'Lunes' << endl;\n"
                        "      break;\n"
                        "    case 2:\n"
                        "      cout << 'Martes' << endl;\n"
                        "      break;\n"
                        "    case 3:\n"
                        "      cout << 'Miércoles' << endl;\n"
                        "      break;\n"
                        "    default:\n"
                        "      cout << 'Día no válido' << endl;\n"
                        "  }\n"
                        "  return 0;\n"
                        "}",
                        size),
                    SizedBox(height: 20),
                    _buildSubTitle("Ejemplo en Python", size),
                    _buildCodeBlock(
                        "def switch_demo(day):\n"
                        "  switcher = {\n"
                        "    1: 'Lunes',\n"
                        "    2: 'Martes',\n"
                        "    3: 'Miércoles'\n"
                        "  }\n"
                        "  return switcher.get(day, 'Día no válido')\n"
                        "print(switch_demo(3))",
                        size),
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
                                pregunta: "1. ¿Qué hace la sentencia switch?",
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
                                    "2. ¿Para qué se utilizan las cláusulas case y break?",
                                respuestas: respuestas2,
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
                                    "3. ¿Qué función cumple la cláusula default en un switch?",
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
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle(String text, Size size) {
    return Text(
      text,
      style: TextStyle(
        fontSize: bigSize,
        fontWeight: FontWeight.bold,
        color: Colors.blueGrey.shade900,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildSubTitle(String text, Size size) {
    return Text(
      text,
      style: TextStyle(
        fontSize: mediumSize,
        fontWeight: FontWeight.bold,
        color: Colors.blueGrey.shade900,
      ),
      textAlign: TextAlign.left,
    );
  }

  Widget _buildParagraph(String text, Size size) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: mediumSize,
          color: Colors.black87,
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }

  Widget _buildCodeBlock(String code, Size size) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.grey[200],
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      width: size.width * 0.9,
      child: Text(
        code,
        style: const TextStyle(
          fontSize: 12,
          fontFamily: 'Courier',
          color: Colors.black87,
        ),
        textAlign: TextAlign.start,
      ),
    );
  }

  Widget _buildQuestionSection(BuildContext context, String question,
      List<String> answers, int? selectedAnswer, Function(int) onSelectAnswer) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSubTitle(question, MediaQuery.of(context).size),
          SizedBox(height: 10),
          ...answers.asMap().entries.map(
                (entry) => RadioListTile(
                  title: Text(entry.value),
                  value: entry.key,
                  groupValue: selectedAnswer,
                  onChanged: (int? value) {
                    if (value != null) {
                      onSelectAnswer(value);
                    }
                  },
                ),
              ),
        ],
      ),
    );
  }
}
