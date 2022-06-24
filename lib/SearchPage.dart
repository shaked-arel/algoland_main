import 'package:google_fonts/google_fonts.dart';

import 'SearchSpeed.dart';
import 'searchVisual.dart';
import 'SearchProvider.dart';
import 'Search.dart';
import 'SearchIndicator.dart';
import 'SearchMessage.dart';
import 'package:flutter/material.dart';

class SearchPage<T extends SearchProvider> extends StatelessWidget {
  final String title;

  SearchPage({required this.title}) : assert(title != null);

  @override
  Widget build(BuildContext context) {
    GlobalKey key = GlobalKey(debugLabel: title);
    return Stack(
      key: key,
      children: <Widget>[
        Column(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            // Padding(
            //   padding: const EdgeInsets.only(top: 0.0),
            //   child: Text(
            //     title,
            //     style: Theme.of(context).textTheme.headline4,
            //   ),
            // ),
            //Image.asset('assets/robot1.png', width: 70),
            SearchMessage(),
            //const SizedBox(height: 24),
            //Below can not be constant
            //const SizedBox(height: 0),
            Expanded(
              child: SearchVisual(),
            ),
            SearchSpeed(),
            Search(),

            const SizedBox(height: 70),
            Stack(children: <Widget>[
              Align(
                alignment: Alignment(0.3, 0.5),
                child: Image.asset('assets/board.png', width: 210),
              ),
              Align(
                alignment: Alignment(-0.6, 0.5),
                child: Image.asset('assets/teach.png', width: 80),
              ),
              Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                      width: 310,
                      height: 120,
                      child: Align(
                          //alignment: Alignment.bottomRight,
                          child: Text(
                        'Remember! \r\n \r\n'
                        'The time complexity \r\n'
                        'is O(log n).',
                        style: GoogleFonts.robotoFlex(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      )))),
            ]),

            //const SizedBox(height: 24),
          ],
        ),
        SearchIndicator(
          parentKey: key,
        ),
        const SizedBox(height: 70),
        // Align(
        //   alignment: Alignment.bottomLeft,
        //   child: Image.asset('assets/simulations.png', width: 100),
        // ),
      ],
    );
  }
}
