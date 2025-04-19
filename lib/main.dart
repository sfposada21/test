import 'package:flutter/material.dart';

import 'src/routers/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hello Human',
      initialRoute: AppRouter.initialRoute,
      routes: AppRouter.routes,
    );
  }
}
