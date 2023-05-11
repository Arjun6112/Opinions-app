import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:opinions_app/controllers/firebase_auth.dart';
import 'package:opinions_app/firebase_options.dart';
import 'package:opinions_app/views/auth/login_screen.dart';
import 'package:opinions_app/views/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Opinions',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.deepOrange,
      ),
      home: const AuthPage(),
    );
  }
}
