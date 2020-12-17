import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:mimi/logic/cubit/cubit.dart';
import 'package:mimi/ui/widgets/custom_app_bar.dart';
import 'package:mimi/ui/widgets/disabled_button.dart';
import 'package:mimi/ui/widgets/drop_down/custom_drop_down.dart';
import 'package:mimi/ui/widgets/drop_down/drop_down_model.dart';

class AddCategoryScreen extends StatefulWidget {
  AddCategoryScreen({Key key}) : super(key: key);

  @override
  _AddCategoryScreenState createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
  final List<DropDownModel> items = [
    DropDownModel(text: "Apport Personnel", selected: true),
    DropDownModel(text: "Recettes"),
    DropDownModel(text: "Refacturation de frais"),
    DropDownModel(text: "Redevance de collaboration"),
    DropDownModel(text: "Gains financiers"),
    DropDownModel(text: "Emprunt"),
    DropDownModel(text: "Cession d’immobilisations"),
    DropDownModel(text: "Loyer et charges locatives"),
    DropDownModel(text: "Caution"),
    DropDownModel(text: "Location matériel et mobilier"),
  ];
  TextEditingController _amountController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  Widget _buildTitle(String text) => Text(
        text,
        style: Theme.of(context).textTheme.subtitle1.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 12.0,
              color: Color(0xFF242461).withOpacity(0.6),
            ),
      );

  Widget _buildKnowMoreButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Icon(FontAwesomeIcons.questionCircle,
            color: Theme.of(context).primaryColor, size: 14.0),
        SizedBox(width: 8.0),
        Text(
          'En savoir plus sur les catégories',
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
    final _height = MediaQuery.of(context).size.height;

    InputDecoration _textFieldDecoration(String hintText) {
      var style = Theme.of(context)
          .textTheme
          .subtitle1
          .copyWith(color: Color.fromRGBO(36, 36, 97, 0.27));

      return InputDecoration(
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

    return Scaffold(
      appBar: CustomAppBar("Ajouter une catégorie", cancel: true),
      body: Stack(
        children: [
          Positioned(
            top: _height * 0.60,
            left: MediaQuery.of(context).size.width * 0.25,
            child: _buildKnowMoreButton(),
          ),
          Positioned(
            top: _height * 0.48,
            left: MediaQuery.of(context).size.width -
                MediaQuery.of(context).size.width * 0.95,
            child: DisabledButton(
              text: "Ajouter",
            ),
          ),
          Positioned(
            top: _height * 0.32,
            left: MediaQuery.of(context).size.width -
                MediaQuery.of(context).size.width * 0.96,
            child: _buildTitle('Montant en euros'),
          ),
          Positioned(
            top: _height * 0.35,
            left: MediaQuery.of(context).size.width -
                MediaQuery.of(context).size.width * 0.95,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextField(
                keyboardType: TextInputType.number,
                controller: _amountController,
                decoration: _textFieldDecoration("0,00"),
              ),
            ),
          ),
          Positioned(
            top: _height * 0.19,
            left: MediaQuery.of(context).size.width -
                MediaQuery.of(context).size.width * 0.96,
            child: _buildTitle('Sous-catégorie'),
          ),
          Positioned(
            top: _height * 0.22,
            right: MediaQuery.of(context).size.width -
                MediaQuery.of(context).size.width * 0.96,
            child: BlocProvider(
              create: (_) => DropDownCubit(items, 0),
              child: CustomDropDown(),
            ),
          ),
          Positioned(
            top: _height * 0.05,
            left: MediaQuery.of(context).size.width -
                MediaQuery.of(context).size.width * 0.96,
            child: _buildTitle('Catégorie principale'),
          ),
          Positioned(
            top: _height * 0.08,
            right: MediaQuery.of(context).size.width -
                MediaQuery.of(context).size.width * 0.96,
            child: BlocProvider(
              create: (_) => DropDownCubit(items, 0),
              child: CustomDropDown(),
            ),
          ),
        ],
      ),
    );
  }
}
