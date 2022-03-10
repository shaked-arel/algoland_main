import 'package:flutter/material.dart';
import 'SortModel.dart';

class SortWidget extends StatelessWidget {
  final SortModel number;
  final int index;
  final double widgetSize;
  final double containerWidth;

  SortWidget(
      {required this.number,
      required this.containerWidth,
      required this.index,
      required this.widgetSize})
      : assert(number != null && index != null && widgetSize != null),
        assert(index >= 0 && widgetSize > 30);

  Offset _getPosition(double width) {
    final horizontal = width ~/ widgetSize;
    final leftOver = width - (horizontal * widgetSize);
    final vertical = index ~/ horizontal;
    final horizontalIndex = index % horizontal;
    var dx = (widgetSize * horizontalIndex) + leftOver / 2;
    var dy = widgetSize * vertical;
    return Offset(dx, dy);
  }

  @override
  Widget build(BuildContext context) {
    final offset = _getPosition(containerWidth);

    var _fontSize = 20.0;
    var _borderRadius = 5.0;
    var _borderWidth = 1.0;
    var _borderColor = Colors.black;
    if (number.state == SortState.sort) {
      _fontSize = 32;
      _borderRadius = 40;
      _borderWidth = 2;
    }
    if (number.state == SortState.sorted) {
      _fontSize = 20;
      _borderRadius = 5;
      _borderWidth = 1;
      _borderColor = Colors.orange;
    }

    return AnimatedPositioned(
      duration: const Duration(microseconds: 2250),
      curve: Curves.elasticOut,
      left: offset.dx,
      top: offset.dy,
      child: SizedBox(
        width: widgetSize,
        height: widgetSize,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            curve: Curves.ease,
            decoration: BoxDecoration(
              border: Border.all(
                color: _borderColor,
                width: _borderWidth,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(_borderRadius),
              ),
            ),
            child: Center(
              child: AnimatedDefaultTextStyle(
                duration: Duration(milliseconds: 400),
                curve: Curves.ease,
                style: TextStyle(
                  color: number.color,
                  fontSize: _fontSize,
                ),
                child: Text(number.value.toString()),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
