import 'package:busca_placa_tdd/core/mainBindings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Buscar Placa',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Routes.BUSCA_PLACA,
      getPages: AppPages.routes,
    );
  }
}
