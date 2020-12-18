import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/getwidget.dart';

import 'package:mimi/ui/widgets/custom_app_bar.dart';

class CategoriesScreen extends StatefulWidget {
  CategoriesScreen({Key key}) : super(key: key);

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List<CategoryModel> _list = [
    CategoryModel("Apport Personnel",
        "Le montant d'apport personnel minimum est généralement égal ou supérieur à 30% de l'investissement initial. Le calcul pour définir le montant minimal d'apport personnel est réalisé sur le base du dossier prévisionnel."),
    CategoryModel("Recettes", 'Data'),
    CategoryModel("Refacturation de frais", 'Data'),
    CategoryModel("Refacturation de frais", 'Data'),
    CategoryModel("Refacturation de frais", 'Data'),
    CategoryModel("Refacturation de frais", 'Data'),
    CategoryModel("Refacturation de frais", 'Data'),
  ];

  Widget _buildSectionTitle(IconData icon, String title) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Icon(icon, color: Color(0xFF5353E0), size: 14.0),
        ),
        SizedBox(width: 10.0),
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(fontWeight: FontWeight.bold, fontSize: 16.0),
        ),
      ],
    );
  }

  Widget _buildList() {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: _list.length,
      itemBuilder: (context, index) {
        return GFAccordion(
          title: _list[index].title,
          contentChild: Text(_list[index].content,
              style: Theme.of(context).textTheme.subtitle1.copyWith(
                  color: Color(0xFF242461).withOpacity(0.6), fontSize: 12.0)),
          contentBackgroundColor: Colors.transparent,
          collapsedTitleBackgroundColor: Colors.transparent,
          expandedTitleBackgroundColor: Colors.transparent,
          textStyle:
              Theme.of(context).textTheme.subtitle1.copyWith(fontSize: 14.0),
          collapsedIcon: Icon(FontAwesomeIcons.chevronRight,
              color: Color(0xFF242461).withOpacity(0.6), size: 14.0),
          expandedIcon: Icon(FontAwesomeIcons.chevronDown,
              color: Color(0xFF242461).withOpacity(0.6), size: 14.0),
        );
      },
      separatorBuilder: (context, index) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: 0.88,
          color: Color(0xFFEEEEFC),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar('Catégories', previous: true),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 30.0),
              _buildSectionTitle(FontAwesomeIcons.piggyBank, 'Encaissements'),
              SizedBox(height: 10.0),
              _buildList(),
              SizedBox(height: 30.0),
              _buildSectionTitle(FontAwesomeIcons.houseDamage, 'Frais Fixes'),
              SizedBox(height: 10.0),
              _buildList(),
            ],
          ),
        ),
      ),
    );
  }
}

// FIXME
class CategoryModel {
  final String title;
  final String content;
  final bool isOpen;

  CategoryModel(this.title, this.content, {this.isOpen = false});
}
