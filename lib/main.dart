import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:plantdiseasedetector/screens/homepage.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    // Retrieve the device cameras

  } on Exception catch (e) {
    print(e);
  }

  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryIconTheme: IconThemeData(color: Colors.black)
      ),
      home: HomePage(),
    );
  }
}

