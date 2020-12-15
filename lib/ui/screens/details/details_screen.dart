import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mimi/ui/screens/details/widgets/add_category_card.dart';
import 'package:mimi/ui/screens/transactions/transactions_screen.dart';
import 'package:mimi/ui/widgets/custom_app_bar.dart';
import 'package:mimi/ui/widgets/custom_button.dart';

class DetailsScreen extends StatefulWidget {
  final TransactionModel transaction;

  DetailsScreen({Key key, this.transaction}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  TextEditingController _noteController = TextEditingController();

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
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFFA9A9EF)),
        borderRadius: BorderRadius.circular(10.0),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }

  Widget _buildDate() {
    return Container(
      height: 55.0,
      width: 55.0,
      child: Card(
        elevation: 4.0,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 2.0),
              child: Text(widget.transaction.day,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      .copyWith(fontWeight: FontWeight.bold)),
            ),
            Text(widget.transaction.month,
                style: Theme.of(context)
                    .textTheme
                    .subtitle2
                    .copyWith(fontSize: 10.0)),
          ],
        ),
      ),
    );
  }

  Widget _getTitle() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: _buildDate(),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.transaction.name,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 20.0),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("Détails", previous: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            _getTitle(),
            SizedBox(height: 20),
            AddCategoryCard(),
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextField(
                maxLines: 2,
                controller: _noteController,
                decoration: _textFieldDecoration("Ajouter une note"),
              ),
            ),
            SizedBox(height: 20),
            CustomButton(onPressed: () {}, text: "Valider la transaction"),
          ],
        ),
      ),
    );
  }
}
