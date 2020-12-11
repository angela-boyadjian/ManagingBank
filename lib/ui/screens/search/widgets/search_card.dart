import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class SearchCard extends StatefulWidget {
  final String title;

  SearchCard({Key key, this.title}) : super(key: key);

  @override
  _SearchCardState createState() => _SearchCardState();
}

class _SearchCardState extends State<SearchCard> {
  bool _isSelected = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      activeColor: Theme.of(context).primaryColor,
      title: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Text(
          widget.title,
          style: Theme.of(context).textTheme.headline6.copyWith(fontSize: 14.0),
        ),
      ),
      value: _isSelected,
      onChanged: (bool newValue) {
        setState(() {
          _isSelected = newValue;
        });
      },
    );
  }
}
