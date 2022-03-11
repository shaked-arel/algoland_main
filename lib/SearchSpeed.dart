import './BinarySearchProve.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchSpeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('Search Speed', style: Theme.of(context).textTheme.caption),
        Consumer<BinarySearchProvider>(
          builder: (context, provider, child) {
            return Container(
              constraints: const BoxConstraints(maxWidth: 300),
              child: Slider(
                value: provider.ExecSpeed,
                onChanged: (value) => provider.ExecSpeed = value,
              ),
            );
          },
        ),
      ],
    );
  }
}
