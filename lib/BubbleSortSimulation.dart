import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:popup_card/popup_card.dart';
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
      home: Scaffold(appBar: AppBar(
        title: Text(
          'appBarTitle',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontFamily: 'Calibri'),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
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

