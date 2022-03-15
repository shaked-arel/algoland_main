import 'BaseProvider.dart';
import 'InsertionSortProv.dart';
import 'SortProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SortButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Selector<InsertionSortProvider, bool>(
        selector: (_, provider) => provider.isSorted,
        builder: (_, sorted, child) {
          return RaisedButton(
            child: child,
            color: Colors.orange,
            disabledColor: Colors.grey,
            onPressed: sorted
                ? null
                : () {
                    Provider.of<InsertionSortProvider>(context, listen: false)
                        .sort();
                  },
          );
        },
        child: Text(
          "Sort",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
