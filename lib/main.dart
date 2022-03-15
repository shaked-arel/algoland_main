// import 'package:flutter/material.dart';
// import 'bubble_sort/BubbleSortProve.dart';
// import 'package:provider/provider.dart';
// import 'bubble_sort/SortPage.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Algorithms',
//       debugShowCheckedModeBanner: false,
//       // showPerformanceOverlay: true,
//       home: Scaffold(
//         body: MultiProvider(
//           providers: [
//             ChangeNotifierProvider(
//               create: (_) => BubbleSortProvider(),
//             ),
//           ],
//           child: SortPage(title: '',),
//         ),
//       ),
//     );
//   }
// }

// import 'package:binarysearch/binary_search/BinarySearchProve.dart';
// import 'package:flutter/material.dart';
// import 'binary_search/SearchPage.dart';
// import 'bubble_sort/BubbleSortProve.dart';
// import 'package:provider/provider.dart';
// import 'bubble_sort/SortPage.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Algorithms',
//       debugShowCheckedModeBanner: false,
//       // showPerformanceOverlay: true,
//       home: Scaffold(
//         body: MultiProvider(
//           providers: [
//             ChangeNotifierProvider(
//               create: (_) => BinarySearchProvider(),
//             ),
//           ],
//           child: SearchPage(title: '',),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'HomePage.dart';
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
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage());
  }
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
