import 'package:flutter/material.dart';
import 'package:hello_human/src/screens/Calendario.dart';
import 'package:hello_human/src/screens/Home.dart';
import 'package:hello_human/src/screens/Recomendacion.dart';
import 'package:hello_human/src/screens/Sugerencia.dart';
import 'package:hello_human/src/screens/metodo.dart';
import 'package:hello_human/src/screens/welcome.dart';

class AppRouter {
  static const initialRoute = 'Welcome';

  static Map<String, Widget Function(BuildContext)> routes = {
    'Welcome': (BuildContext context) => Welcome(),
    'Home': (BuildContext context) => HomeScreen(),
    'Calendario': (BuildContext context) => const Calendario(),
    'Recomendacion': (BuildContext context) => const Recomendaciones(),
    'Sugerencia': (BuildContext context) => const Sugerencias(),
    'Metodos': (BuildContext context) => const Metodos(),
  };
}
