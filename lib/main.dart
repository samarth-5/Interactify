import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:interactify/resources/auth_methods.dart';
import 'package:interactify/screens/home_screen.dart';
import 'package:interactify/screens/login_screen.dart';
import 'package:interactify/utils/colors.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Interactify',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor
      ),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
      },
      //stream builder used for persisting state
      //for real time
      home: StreamBuilder(
        stream: AuthMethods().authChanges,
        builder: (context, snapshot)  {
          if(snapshot.connectionState == ConnectionState.waiting)
          {
            return const Center(child: CircularProgressIndicator(),);
          }
          if(snapshot.hasData)
          {
            return const HomeScreen();
          }
          return const LoginScreen();
        },
      ),
    );
  }
}