import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:data/data_repository.dart';
import 'package:mimi/ui/utils/date_converter.dart';
import 'package:mimi/ui/widgets/custom_app_bar.dart';
import 'package:mimi/ui/widgets/date/date_card.dart';
import 'package:mimi/ui/widgets/disabled_button.dart';

import 'widgets/category_card.dart';
import 'widgets/detail_section.dart';
import 'widgets/add_category_card.dart';

class DetailsScreen extends StatefulWidget {
  final TransactionAttributes transaction;

  DetailsScreen({Key key, this.transaction}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  TextEditingController _noteController = TextEditingController();
  final DateConverter dateConverter = DateConverter();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  InputDecoration _textFieldDecoration(String hintText) {
    var style = Theme.of(context)
        .textTheme
        .subtitle1
        .copyWith(color: Color.fromRGBO(36, 36, 97, 0.27));

    return InputDecoration(
      labelText: hintText,
      hintText: hintText,
      labelStyle: style,
      hintStyle: style,
      filled: true,
      fillColor: Colors.white,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFFA9A9EF), width: 1.5),
        borderRadius: BorderRadius.circular(10.0),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }

  Widget _getTitle() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: DateCard(
              date: dateConverter.convertDate(widget.transaction.date)),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  widget.transaction.description,
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Icon(
                    FontAwesomeIcons.creditCard,
                    color: Color(0xFF242461).withOpacity(0.6),
                    size: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Débit différé du 23/04',
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                          color: Color(0xFF242461).withOpacity(0.6),
                          fontWeight: FontWeight.w400,
                          fontSize: 12.0),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Color(0xFFEEEEFC),
            ),
            child: Icon(FontAwesomeIcons.paperclip, color: Color(0xFF5353E0)),
          ),
        )
      ],
    );
  }

  Widget _buildAddDetailButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Icon(FontAwesomeIcons.plusCircle,
            color: Theme.of(context).primaryColor, size: 14.0),
        SizedBox(width: 8.0),
        Text(
          'Ajouter un détail',
          style: Theme.of(context).textTheme.subtitle1.copyWith(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 12.0),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("Détails", previous: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20.0),
            _getTitle(),
            SizedBox(height: 20.0),
            CategoryCard("Sans catégorie"),
            SizedBox(height: 20.0),
            DetailSection("10", widget.transaction.amount),
            SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: _buildAddDetailButton(),
            ),
            SizedBox(height: 20.0),
            AddCategoryCard(),
            SizedBox(height: 20.0),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextField(
                maxLines: 2,
                controller: _noteController,
                decoration: _textFieldDecoration("Ajouter une note"),
              ),
            ),
            SizedBox(height: 40.0),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: DisabledButton(text: "Valider la transaction"),
            ),
          ],
        ),
      ),
    );
  }
}
