import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'binary_search/BinarySearchProve.dart';
import 'binary_search/SearchPage.dart';

class BinarySearchSimulation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Algorithms',
      debugShowCheckedModeBanner: false,
      // showPerformanceOverlay: true,
      home: Scaffold(
        body: MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (_) => BinarySearchProvider(),
            ),
          ],
          child: SearchPage(title: '',),
        ),
      ),
    );
  }
}