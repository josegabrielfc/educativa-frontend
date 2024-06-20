import 'package:educativa_frontend/src/config/environment/environment.dart';
import 'package:educativa_frontend/src/models/usuario/usuario_model.dart';
import 'package:educativa_frontend/src/providers/service_provider.dart';
import 'package:educativa_frontend/src/providers/usuario_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/widgets_general.dart';

class EstudiantesPage extends StatefulWidget {
  static const name = "estudiantes-page";
  const EstudiantesPage({super.key});

  @override
  State<EstudiantesPage> createState() => _EstudiantesPageState();
}

class _EstudiantesPageState extends State<EstudiantesPage> {
  bool isLoading = true;
  TextEditingController textEditingController = TextEditingController();
  List<EstudianteModel> estudiantes = [];
  List<EstudianteModel> estudiantesFiltrados = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    final servicePorvider =
        Provider.of<ServicesProvider>(context, listen: false);
    final usuarioProvider =
        Provider.of<UsuarioProvider>(context, listen: false);
    final List<EstudianteModel> estudiantesLoad = await servicePorvider
        .usuarioService
        .listarEstudiantes(usuarioProvider.token!);

    setState(() {
      estudiantes = estudiantesLoad;
      estudiantesFiltrados = estudiantesLoad;
      isLoading = false;
    });
  }

  void filtroEstudiantes(String query) {
    setState(() {
      final cleanQuery = query.trim().toLowerCase();

      estudiantesFiltrados = estudiantes.where((estudiante) {
        final nombre = estudiante.nombre.toLowerCase();
        final correo = estudiante.correo.toLowerCase();

        return nombre.contains(cleanQuery) || correo.contains(cleanQuery);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: const Color.fromRGBO(142, 142, 142, 1),
          child: Column(
            children: [
              separadorVertical(context, 2),
              ListTile(
                leading: Icon(
                  Icons.logout_outlined,
                  size: 40,
                  color: blancoColor,
                ),
                title: texto("Cerrar sesión", fontBold, bigSize + 4,
                    blancoColor, TextAlign.center),
                onTap: () {
                  final usuarioProvider =
                      Provider.of<UsuarioProvider>(context, listen: false);
                  usuarioProvider.vaciarUsuarioProvider();
                  Navigator.pushReplacementNamed(context, 'login-page');
                },
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: azulColor,
        title: const Text('Listado de estudiantes'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          separadorVertical(context, 5),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 10),
            child: Container(
              width: 600,
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(color: grisClaColor),
                  borderRadius: const BorderRadius.all(Radius.circular(30))),
              child: TextField(
                style: TextStyle(color: negroColor),
                controller: textEditingController,
                onChanged: (value) {
                  filtroEstudiantes(value);
                },
                decoration: InputDecoration(
                  hintText: 'Buscar...',
                  hintStyle: TextStyle(
                    fontFamily: fontApp,
                    fontSize: 16,
                  ),
                  suffixIcon: Icon(Icons.search, color: negroColor),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
          separadorVertical(context, 5),
          if (isLoading)
            const Center(child: CircularProgressIndicator.adaptive())
          else
            estudiantesFiltrados.isNotEmpty
                ? Center(child: tablaEstudiantes(context, estudiantesFiltrados))
                : Column(
                    children: [
                      Image.asset("assets/images/no-data.png",
                          height: 200, color: azulOscColor),
                      texto("No se encontro información", fontApp, bigSize + 4,
                          azulOscColor, TextAlign.center)
                    ],
                  )
        ],
      ),
    );
  }
}

Widget tablaEstudiantes(
    BuildContext context, List<EstudianteModel> estudiantes) {
  var media = MediaQuery.of(context).size;

  media =
      (media.width <= 1280) ? Size(media.width * 0.95, media.height) : media;
  media =
      (media.height <= 750) ? Size(media.width, media.height * 0.925) : media;
  media = (media.height <= 580) ? Size(media.width, media.height) : media;
  return Column(
    children: [
      Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        columnWidths: {
          0: FixedColumnWidth(media.width * 25 / 100),
          1: FixedColumnWidth(media.width * 25 / 100),
          2: FixedColumnWidth(media.width * 14 / 100),
        },
        border:
            TableBorder.all(color: Colors.transparent, style: BorderStyle.none),
        children: [
          TableRow(
              decoration: BoxDecoration(
                color: azulClaColor,
              ),
              children: [
                Column(children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: texto(
                      "Nombre",
                      fontBold,
                      18,
                      blancoColor,
                      TextAlign.end,
                    ),
                  ),
                ]),
                Column(children: [
                  texto(
                    "Correo",
                    fontBold,
                    18,
                    blancoColor,
                    TextAlign.end,
                  ),
                ]),
                Column(children: [
                  texto(
                    "Ver resultados",
                    fontBold,
                    18,
                    blancoColor,
                    TextAlign.end,
                  ),
                ]),
              ]),
        ],
      ),
      SizedBox(
        height: media.height * 65 / 100,
        child: SingleChildScrollView(
          child: Table(
            columnWidths: {
              0: FixedColumnWidth(media.width * 25 / 100),
              1: FixedColumnWidth(media.width * 25 / 100),
              2: FixedColumnWidth(media.width * 14 / 100),
            },
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            border: TableBorder.all(
                color: Colors.transparent, style: BorderStyle.none),
            children: [
              for (int index = 0; index < estudiantes.length; index++)
                TableRow(
                    decoration: BoxDecoration(
                      color: index % 2 == 0
                          ? azulOscColor.withOpacity(0.2)
                          : blancoColor,
                    ),
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: texto(
                          estudiantes[index].nombre,
                          fontApp,
                          16,
                          negroColor,
                          TextAlign.center,
                        ),
                      ),
                      Column(children: [
                        texto(
                          estudiantes[index].correo,
                          fontApp,
                          16,
                          negroColor,
                          TextAlign.center,
                        ),
                      ]),
                      Column(children: [
                        InkWell(
                          onTap: () {
                            final usuarioProvider =
                                Provider.of<UsuarioProvider>(context,
                                    listen: false);
                            usuarioProvider
                                .setEstudiante(estudiantes[index].id);
                            Navigator.pushNamed(
                                context, "resultados-estudiantes-page");
                          },
                          child: const Icon(Icons.visibility),
                        )
                      ]),
                    ])
            ],
          ),
        ),
      ),
    ],
  );
}
