import 'SortButtonInsertion.dart';
import 'SortProvider.dart';
import 'speedInsertion.dart';
import 'sortVisualInsertion.dart';
import 'package:flutter/material.dart';
import 'sortVisualInsertion.dart';
import 'buttons.dart';

class SortPage<T extends SortProvider> extends StatelessWidget {
  final String title;
  final double BlockSize;

  SortPage({required this.title, this.BlockSize = 90}) : assert(title != null);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 100.0),
              child: Text(
                title,
                style: TextStyle(
                    color: Colors.orange,
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Container(
                width: constraints.maxWidth,
                child: Center(
                  child: SortVisual(
                    blockSize: BlockSize,
                    width: constraints.maxWidth,
                  ),
                ),
              ),
            ),
            Buttons(),
            Speed(),
            SortButton(),
          ],
        ),
      );
    });
  }
}
