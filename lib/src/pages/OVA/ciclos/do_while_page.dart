import 'package:educativa_frontend/src/widgets/sidebar_widget.dart';
import 'package:flutter/material.dart';

class DoWhilePage extends StatefulWidget {
  static const name = 'do-while-page';
  const DoWhilePage({super.key});

  @override
  State<DoWhilePage> createState() => _DoWhilePageState();
}

class _DoWhilePageState extends State<DoWhilePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: const SidebarWidget(),
        appBar: AppBar(
          title: const Text('Do while'),
          centerTitle: true,
          backgroundColor: Colors.purple,
        ),
      );
}