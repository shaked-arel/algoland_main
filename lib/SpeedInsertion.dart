import 'package:binarysearch/config/palette.dart';
import 'InsertionSortProv.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Speed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // Text('sorting speed',
        //     style: TextStyle(fontSize: 14, color: Colors.black)),
        Selector<InsertionSortProvider, double>(
            selector: (context, provider) => provider.ExecSpeed,
            builder: (context, executionSpeed, child) {
              return Container(
                constraints: const BoxConstraints(maxWidth: 300),
                child: Slider(
                  activeColor: Palette.lightBlue2,
                  value: executionSpeed,
                  onChanged: (value) =>
                      Provider.of<InsertionSortProvider>(context, listen: false)
                          .ExecSpeed = value,
                  //divisions: 4,
                  label: "$executionSpeed",
                ),
              );
            })
      ],
    );
  }
}
