import 'package:binarysearch/binary_search/BinarySearchProve.dart';

import 'SearchProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchMessage extends StatefulWidget {

  @override
  _SearchMessageState<BinarySearchProvider> createState() => _SearchMessageState<BinarySearchProvider>();
}

class _SearchMessageState<T extends SearchProvider>
    extends State<SearchMessage> {
  var _fontSize = 16.0;

  var _color = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Selector<BinarySearchProvider, int>(
        selector: (_, provider) => provider.position,
        builder: (_, position, __) {
          String outputMessage;
          if (position == -2) {
            outputMessage = '';
            _fontSize = 0;
            _color = Colors.black;
          } else if (position == -1) {
            outputMessage = 'Value not found';
            _fontSize = 24;
            _color = Colors.red;
          } else {
            outputMessage =
            'Value found at position: ${(position + 1).toString()}';
            _fontSize = 24;
            _color = Colors.black;
          }
          return Container(
            height: 50,
            child: AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 400),
              curve: Curves.ease,
              style: Theme.of(context).textTheme.headline5!.copyWith(
                fontSize: _fontSize,
                color: _color,
              ),
              child: Text(
                outputMessage,
              ),
            ),
          );
        });
  }
}