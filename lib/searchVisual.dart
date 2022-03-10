import 'package:binarysearch/binary_search/BinarySearchProve.dart';
import 'SearchModel.dart';
import 'searchWidget.dart';
import 'package:binarysearch/binary_search/searchWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchVisual extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Selector<BinarySearchProvider, List<SearchModel>>(
        selector: (context, provider) => provider.numbers,
        builder: (_, numbers, __) {
          return Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: <Widget>[
              for (var number in numbers)
                SearchWidget(
                  number: number,
                )
            ],
          );
        },
      ),
    );
  }
}