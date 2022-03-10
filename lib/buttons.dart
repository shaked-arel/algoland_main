import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  const Buttons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      children: <Widget>[
        Icon(Icons.swap_horiz),
        Icon(Icons.cloud_circle),
        Icon(Icons.stop),
      ],
      onPressed: (int index) {
        print(index);
      },
      isSelected: [false, true, false],
      selectedColor: Colors.cyan,
      renderBorder: false,
    );
  }
}
