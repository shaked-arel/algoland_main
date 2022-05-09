import 'dart:io';

import 'package:binarysearch/wait.dart';
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
  Color col = Colors.blue;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: col,
        textColor: Colors.white,
        child: Text(widget.answerText),
        onPressed: () {
          setState(() => col = widget.color);
          Future.delayed(const Duration(milliseconds: 250), () {
            col = Colors.blue;
            widget.handler();
          });
        },
      ),
    );
  }
}
