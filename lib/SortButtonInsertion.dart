import 'package:provider/provider.dart';
import 'InsertionSortProv.dart';
import 'package:flutter/material.dart';

import 'config/palette.dart';

class SortButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Selector<InsertionSortProvider, bool>(
        selector: (_, provider) => provider.isSorted,
        builder: (_, sorted, child) {
          return Container(
              width: 180,
              height: 40,
              child: ElevatedButton(
                child: child,
                //color: Palette.lightBlue2,
                //disabledColor: Colors.grey,
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Palette.lightBlue2),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ))),
                onPressed: sorted
                    ? null
                    : () {
                        Provider.of<InsertionSortProvider>(context,
                                listen: false)
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
