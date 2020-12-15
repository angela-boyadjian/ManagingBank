import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String _category;

  CategoryCard(this._category);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 2.0,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 100.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Container(
                width: 48.0,
                height: 48.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color(0xFFF5F5F5),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _category,
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0),
                ),
                Text(
                  "Restaurant",
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                      color: Theme.of(context).primaryColor, fontSize: 10.0),
                ),
              ],
            ),
            SizedBox(width: 20.0),
          ],
        ),
      ),
    );
  }
}
