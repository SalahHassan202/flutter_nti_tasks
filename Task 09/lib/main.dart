import 'package:api_app/cubit/cubit_state.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ApiApp());
}

class ApiApp extends StatelessWidget {
  const ApiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Salah());
  }
}
