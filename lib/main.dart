import 'package:flutter/material.dart';
import 'package:user_suitmedia_test/di/app_module.dart';
import 'package:user_suitmedia_test/features/profiles/presentation/screens/first_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  AppModule.inject();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Test App",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        errorColor: Colors.red,
      ),
      home: const FirstScreen(),
    );
  }
}
