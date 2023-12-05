import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:two_d_app/language.dart';
import 'package:two_d_app/two_d/c_two_d_controller.dart';
import 'package:two_d_app/two_d/v_home.dart';

void main() {
  Get.put(TwoDMethodController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Language(),
      title: 'Two D',
      locale: const Locale('en', 'Us'),
      fallbackLocale: const Locale('mm', 'Mm'),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
