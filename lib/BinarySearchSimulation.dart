import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'BinarySearchProve.dart';
import 'SearchPage.dart';
import 'config/palette.dart';

class BinarySearchSimulation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: 'Algorithms',
      debugShowCheckedModeBanner: false,
      // showPerformanceOverlay: true,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('Simulation', style: GoogleFonts.robotoFlex(
              color: Palette.darkBlue2, fontWeight: FontWeight.bold)),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Palette.darkBlue2,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.white, // appbar color.
          foregroundColor: Palette.darkBlue2, // appbar text color.
        ),
        body: MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (_) => BinarySearchProvider(),
            ),
          ],
              child: SearchPage(
            title: '',
          )),
        ),
    );
  }
}


