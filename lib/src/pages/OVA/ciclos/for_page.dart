import 'package:educativa_frontend/src/widgets/sidebar_widget.dart';
import 'package:flutter/material.dart';

class ForPage extends StatefulWidget {
  static const name = 'for-page';
  const ForPage({super.key});

  @override
  State<ForPage> createState() => _ForPageState();
}

class _ForPageState extends State<ForPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: const SidebarWidget(),
        appBar: AppBar(
          title: const Text('For'),
          centerTitle: true,
          backgroundColor: Colors.brown,
        ),
      );
}