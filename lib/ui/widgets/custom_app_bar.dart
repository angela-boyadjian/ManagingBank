import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final bool previous;
  final String title;

  CustomAppBar(this.title, {Key key, this.previous = false})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);
  @override
  final Size preferredSize; // default is 56.0

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return AppBar(
      elevation: 0.0,
      backgroundColor: Color(0xFFFCFCFC),
      leading: widget.previous
          ? IconButton(
              icon: Icon(Icons.arrow_back, color: Color(0xFF242461)),
              onPressed: () => Navigator.of(context).pop())
          : Container(),
      centerTitle: true,
      title: Text(widget.title,
          style: textTheme.headline5.copyWith(fontWeight: FontWeight.bold)),
      actions: [
        IconButton(
            icon: Icon(FontAwesomeIcons.cog, color: Color(0xFF242461)),
            onPressed: () => {}),
      ],
    );
  }
}
