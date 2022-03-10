import 'SearchSpeed.dart';
import 'searchVisual.dart';
import 'SearchProvider.dart';
import 'Search.dart';
import 'SearchIndicator.dart';
import 'SearchMessage.dart';
import 'package:flutter/material.dart';

class SearchPage<T extends SearchProvider> extends StatelessWidget {
  final String title;

  SearchPage({required this.title})
      : assert(title != null);

  @override
  Widget build(BuildContext context) {
    GlobalKey key = GlobalKey(debugLabel: title);
    return Stack(
      key: key,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: Text(
                title,
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            const SizedBox(height: 24),
            //Below can not be constant
            Expanded(
              child: SearchVisual(),
            ),
            SearchMessage(),
            const SizedBox(height: 24),
            SearchSpeed(),
            Search(),
            const SizedBox(height: 24),
          ],
        ),
        SearchIndicator(
          parentKey: key,
        ),
      ],
    );
  }
}