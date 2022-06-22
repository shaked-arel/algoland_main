import 'package:google_fonts/google_fonts.dart';

import 'SortButton.dart';
import 'SortProvider.dart';
import 'Speed.dart';
import 'sortVisual.dart';
import 'package:flutter/material.dart';
import 'sortVisual.dart';
import 'buttons.dart';

class SortPage<T extends SortProvider> extends StatelessWidget {
  final String title;
  final double BlockSize;

  SortPage({required this.title, this.BlockSize = 90}) : assert(title != null);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      return Column(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: 0),
                child: Text(
                  title,
                  style: TextStyle(
                      color: Colors.orange,
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
              )),
          Align(
              alignment: Alignment.topCenter,
              child: Expanded(
                child: Container(
                  width: constraints.maxWidth,
                  child: Center(
                    child: SortVisual(
                      blockSize: BlockSize,
                      width: constraints.maxWidth,
                    ),
                  ),
                ),
              )),
          //Buttons(),
          SizedBox(
            height: 10,
          ),
          Align(alignment: Alignment.bottomCenter, child: Speed()),
          Align(alignment: Alignment.bottomCenter, child: SortButton()),
          //Align(
          //alignment: Alignme,
          Stack(children: <Widget>[
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset('assets/board.png', width: 250),
            ),
            Align(
              alignment: Alignment(-1, 0),
              child: Image.asset('assets/teach.png', width: 120),
            ),
            Align(
                alignment: Alignment.bottomRight,
                child: Container(
                    width: 300,
                    height: 120,
                    child: Align(
                        //alignment: Alignment.bottomRig,
                        child: Text(
                          '   Remember! \r\n \r\n'
                          '   The time complexity \r\n'
                              '   is O(n^2).',
                          style: GoogleFonts.robotoFlex(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        )))),
          ]),
        ],
      );
    });
  }
}
