import 'package:flutter/material.dart';
import 'package:money_lab/src/layouts/searchPage/search.dart';

class Searcher extends StatelessWidget {
  const Searcher({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.search),
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SearchScreen()),
      ),
    );
  }
}
