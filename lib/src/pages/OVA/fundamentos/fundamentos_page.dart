import 'package:educativa_frontend/src/widgets/sidebar_widget.dart';
import 'package:flutter/material.dart';

class FundamentosPage extends StatefulWidget {
  static const name = 'fundamentos-page';
  const FundamentosPage({super.key});

  @override
  State<FundamentosPage> createState() => _FundamentosPageState();
}

class _FundamentosPageState extends State<FundamentosPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: const SidebarWidget(),
        appBar: AppBar(
          title: const Text('Fundamentos'),
          centerTitle: true,
          backgroundColor: Colors.amber,
        ),
      );
}
