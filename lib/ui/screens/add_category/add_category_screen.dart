import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:mimi/logic/cubit/cubit.dart';
import 'package:mimi/ui/widgets/custom_app_bar.dart';
import 'package:mimi/ui/widgets/disabled_button.dart';
import 'package:mimi/ui/widgets/drop_down/drop_down_model.dart';
import 'package:mimi/ui/widgets/drop_down/custom_drop_down.dart';

class AddCategoryScreen extends StatefulWidget {
  AddCategoryScreen({Key key}) : super(key: key);

  @override
  _AddCategoryScreenState createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
  final List<DropDownModel> items = [
    DropDownModel(text: "Ce mois", selected: true),
    DropDownModel(text: "Ce trimestre", selected: false),
    DropDownModel(text: "Cette année"),
  ];

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

    return Scaffold(
      appBar: CustomAppBar("Ajouter une catégorie", cancel: true),
      body: Stack(
        children: [
          Positioned(
            top: _height * 0.50,
            left: MediaQuery.of(context).size.width * 0.25,
            child: _buildKnowMoreButton(),
          ),
          Positioned(
            top: _height * 0.35,
            left: MediaQuery.of(context).size.width -
                MediaQuery.of(context).size.width * 0.95,
            child: DisabledButton(
              text: "Ajouter",
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
