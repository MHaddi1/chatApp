import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'my_app_state.dart';
import 'my_home_screen.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => MyAppState())],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomeScreen(),
    );
  }
}
