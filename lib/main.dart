import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:project_tpm/model/UserModel.dart';
import 'package:project_tpm/screens/Home/HomeScreen.dart';
import 'package:project_tpm/screens/Login/LoginScreen.dart';
import 'package:project_tpm/screens/Register/RegisterScreen.dart';


late Box dataBox;

void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  dataBox = await Hive.openBox('dataBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hotel App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/' : (context) => const HomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
      },
    );
  }
}
