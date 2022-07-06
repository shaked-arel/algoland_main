import 'package:binarysearch/BinarySearchGame.dart';
import 'package:flutter/material.dart';
import 'config/palette.dart';

class AllBackButton extends StatelessWidget {
  //const BackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Palette.lightBlue2,
      textColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Text(
        'Back to Levels',
        style: TextStyle(fontSize: 20),
      ),
      onPressed: () {
        int count= 0;
        Navigator.of(context).popUntil((_) => count++ >= 2);
      },
    );
  }
}
