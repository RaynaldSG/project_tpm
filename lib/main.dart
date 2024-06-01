import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:project_tpm/model/HistoryModel.dart';
import 'package:project_tpm/model/UserModel.dart';
import 'package:project_tpm/screens/Home/HomeScreen.dart';
import 'package:project_tpm/screens/Login/LoginScreen.dart';
import 'package:project_tpm/screens/Register/RegisterScreen.dart';
import 'package:project_tpm/screens/Splash/SplashScreen.dart';
import 'package:project_tpm/utils/notification/NotificationService.dart';
import 'package:project_tpm/utils/security/Encryption.dart';


late Box dataBox;


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();

  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  Hive.registerAdapter(HistoryModelAdapter());
  dataBox = await Hive.openBox('dataBox');
  Encryption();

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
        '/' : (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}
