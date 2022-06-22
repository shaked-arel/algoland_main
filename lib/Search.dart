import './BinarySearchProve.dart';
import 'SearchProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'config/palette.dart';

class Search extends StatefulWidget {
  // const Search({
  //   Key key,
  // }) : super(key: key);

  @override
  _SearchState<BinarySearchProvider> createState() =>
      _SearchState<BinarySearchProvider>();
}

class _SearchState<BinartSearchProvider extends SearchProvider>
    extends State<Search> {
  final searchController = TextEditingController();

  void _search() {
    try {
      final val = int.parse(searchController.text);
      Provider.of<BinartSearchProvider>(context, listen: false)
          .search(value: val);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Container(
          width: 100,
          child: TextField(
            controller: searchController,
            decoration: const InputDecoration(
              labelText: 'Value',
            ),
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            keyboardType: TextInputType.number,
          ),
        ),
        Selector<BinarySearchProvider, bool>(
          selector: (_, provider) => provider.isSearching,
          builder: (_, isSearching, child) {
            return Container(
                width: 150,
                height: 40,
                child: ElevatedButton(
                child: child,
                style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),),
                  primary: Palette.lightBlue2,
            ),
              onPressed: isSearching ? null : _search,
              //child: child,
            ));
          },
          child: const Text('Search', style: TextStyle(color: Colors.white)),
        )
      ],
    );
  }
}
