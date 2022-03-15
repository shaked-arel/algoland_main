import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'BubbleSortProv.dart';
import 'SortPage.dart';

class BubbleSortSimulation extends StatelessWidget {
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
              create: (_) => BubbleSortProvider(),
            ),
          ],
          child: SortPage(
            title: '',
          ),
        ),
      ),
    );
  }
}
