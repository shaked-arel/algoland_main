import 'package:binarysearch/config/palette.dart';

import 'BaseProvider.dart';
import 'BubbleSortProv.dart';
import 'SortProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SortButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Selector<BubbleSortProvider, bool>(
        selector: (_, provider) => provider.isSorted,
        builder: (_, sorted, child) {
          return Container(
              width: 180,
              height: 40,
              child: ElevatedButton(
                child: child,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  primary: Palette.lightBlue2,
                  //primary: _hasBeenPressed ? Colors.grey : Palette.lightBlue2,
                ),
                onPressed: sorted
                    ? null
                    : () {
                        Provider.of<BubbleSortProvider>(context, listen: false)
                            .sort();
                      },
              ));
        },
        child: Text(
          "Sort",
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
      ),
    );
  }
}
