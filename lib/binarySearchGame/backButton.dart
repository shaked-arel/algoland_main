import 'package:flutter/material.dart';

class AllBackButton extends StatelessWidget {
  //const BackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.of(context).popUntil((route) => route.isFirst);
        },
        child: Text('Back to Levels'));
  }
}
