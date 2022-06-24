import 'package:binarysearch/BinarySearchGame.dart';
import 'package:binarysearch/BubbleSortGame.dart';
import 'package:binarysearch/InsertionSortGame.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'HomePage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp(
      name: 'check',
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        //  /*
        initialRoute: "/home",
        routes: {
          "/home": (context) => HomePage(),
          "/levelsBubble": (context) => BubbleTodoScreen(
                levels: [],
              ),
          "/levelsBinary": (context) => BinaryTodoScreen(levels: []),
          "/levelsInsertion": (context) => InsertionTodoScreen(levels: [])
        },
        //*/
        home: HomePage());
  }
}
