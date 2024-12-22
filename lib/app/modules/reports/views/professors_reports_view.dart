import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/appbar_widget.dart';
import '../controllers/reports_controller.dart';
import '../widgets/text_field_widget.dart';

class ProfessorsReportsView extends GetView<ReportsController> {
  const ProfessorsReportsView({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments;

    var sugerencias = [
      'No asiste a clases',
      'Llega tarde a clases',
      'El salon esta vacio',
      'Envio a un auxiliar',
    ];

    return Scaffold(
      backgroundColor: const Color.fromRGBO(35, 35, 35, 1),
      appBar: const AppBarWidget(title: 'Reporte a Profesor'),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Nombre del profesor:',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            Text(
              args['professor'].toString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 10,
              children: [
                for (var i = 0; i < sugerencias.length; i++)
                  ElevatedButton(
                    onPressed: () {
                      controller.setTextEditingController(sugerencias[i]);
                    },
                    child: Text(
                      sugerencias[i],
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  CustomTextField(controller: controller.textEditingController),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
