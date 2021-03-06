import 'dart:io';
import 'package:binarysearch/config/palette.dart';
import 'package:flutter/material.dart';

class Answer extends StatefulWidget {
  final VoidCallback handler;
  final String answerText;
  final Color color;

  Answer(this.handler, this.answerText, this.color);

  ColorChange createState() => ColorChange();
}

class ColorChange extends State<Answer> {
  ColorChange();
  Color col = Palette.yellow;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7),
      width: 350,
      height: 55,
      child: RaisedButton(
        color: col,
        textColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        child: Text(
          widget.answerText,
          style: TextStyle(fontSize: 19),
        ),
        onPressed: () {
          setState(() => col = widget.color);
          Future.delayed(const Duration(milliseconds: 250), () {
            col = Palette.yellow;
            widget.handler();
          });
        },
      ),
    );
  }
}
