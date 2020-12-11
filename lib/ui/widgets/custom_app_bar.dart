import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final bool previous;
  final bool cancel;
  final String title;

  CustomAppBar(this.title,
      {Key key, this.previous = false, this.cancel = false})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);
  @override
  final Size preferredSize;

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
      title: Text(
        widget.title,
        style: textTheme.headline5
            .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      actions: [
        widget.cancel
            ? IconButton(
                icon: Icon(FontAwesomeIcons.times, color: Color(0xFF242461)),
                onPressed: () => Navigator.of(context).pop())
            : Container(
                padding: const EdgeInsets.only(right: 15.0),
                height: 55,
                width: 55,
                child: RawMaterialButton(
                  onPressed: () {},
                  elevation: 8.0,
                  fillColor: Theme.of(context).primaryColor,
                  child: Icon(
                    FontAwesomeIcons.bell,
                    size: 20.0,
                  ),
                  padding: EdgeInsets.all(10.0),
                  shape: CircleBorder(),
                ),
              ),
      ],
    );
  }
}
