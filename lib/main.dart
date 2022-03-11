import 'package:flutter/material.dart';
import 'algolandapp/generatediphone11prox1widget/GeneratedIPhone11ProX1Widget.dart';
import 'algolandapp/generatediphone11prox2widget/GeneratedIPhone11ProX2Widget.dart';
import 'algolandapp/generatediphone11prox4widget/GeneratedIPhone11ProX4Widget.dart';
import 'algolandapp/generatediphone11prox5widget/GeneratedIPhone11ProX5Widget.dart';
import 'algolandapp/generatediphone11prox6widget/GeneratedIPhone11ProX6Widget.dart';
import 'algolandapp/generatediphone11prox7widget/GeneratedIPhone11ProX7Widget.dart';
import 'algolandapp/generatediphone11prox8widget/GeneratedIPhone11ProX8Widget.dart';
import 'algolandapp/generatedimage8widget/GeneratedImage8Widget.dart';
import 'algolandapp/generatedimage9widget/GeneratedImage9Widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import './auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp(
      name: 'check',
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
  runApp(AlgolandApp());
}

class AlgolandApp extends StatelessWidget {
  const AlgolandApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AuthGate(),
    );
  }
}

class Start extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/GeneratedIPhone11ProX1Widget',
      routes: {
        '/GeneratedIPhone11ProX1Widget': (context) =>
            GeneratedIPhone11ProX1Widget(),
        '/GeneratedIPhone11ProX2Widget': (context) =>
            GeneratedIPhone11ProX2Widget(),
        '/GeneratedIPhone11ProX4Widget': (context) =>
            GeneratedIPhone11ProX4Widget(),
        '/GeneratedIPhone11ProX5Widget': (context) =>
            GeneratedIPhone11ProX5Widget(),
        '/GeneratedIPhone11ProX6Widget': (context) =>
            GeneratedIPhone11ProX6Widget(),
        '/GeneratedIPhone11ProX7Widget': (context) =>
            GeneratedIPhone11ProX7Widget(),
        '/GeneratedIPhone11ProX8Widget': (context) =>
            GeneratedIPhone11ProX8Widget(),
        '/GeneratedImage8Widget': (context) => GeneratedImage8Widget(),
        '/GeneratedImage9Widget': (context) => GeneratedImage9Widget(),
      },
    );
  }
}
