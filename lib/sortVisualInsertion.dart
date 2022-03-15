import 'package:flutter/material.dart';
import 'InsertionSortProv.dart';
import 'package:provider/provider.dart';
import 'sortWidget.dart';

class SortVisual extends StatelessWidget {
  SortVisual({this.blockSize = 100, required this.width});

  final double blockSize;
  final double width;

  double _getHeight(double width, int numOfWidjets) {
    final horizontal = width ~/ blockSize;
    final rows = (numOfWidjets / horizontal).ceil();
    return rows * blockSize;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Consumer<InsertionSortProvider>(
        builder: (_, provider, __) {
          return SizedBox(
            width: width,
            height: _getHeight(
              width,
              provider.numbers.length,
            ),
            child: Stack(
              children: <Widget>[
                for (var i = 0; i < provider.numbers.length; i++)
                  SortWidget(
                    containerWidth: width,
                    number: provider.numbers[i],
                    index: i,
                    widgetSize: blockSize,
                  )
              ],
            ),
          );
        },
      ),
    );
  }
}
