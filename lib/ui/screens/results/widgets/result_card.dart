import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mimi/logic/cubit/cubit.dart';

class ResultCard extends StatefulWidget {
  final String title;
  final Color color;
  final String route;

  ResultCard({
    Key key,
    @required this.title,
    @required this.color,
    @required this.route,
  }) : super(key: key);

  @override
  _ResultCardState createState() => _ResultCardState();
}

class _ResultCardState extends State<ResultCard> {
  Color color;

  @override
  void initState() {
    setState(() {
      color = widget.color;
    });
    super.initState();
  }

  getRightCubit() {
    if (widget.title == "Trésorerie") {
      return context.read<BankAccountCubit>();
    } else if (widget.title == "Dépenses") {
      return context.read<SpendingsCubit>();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: InkWell(
        onTap: () => Navigator.of(context)
            .pushNamed(widget.route, arguments: getRightCubit()),
        child: Container(
          width: MediaQuery.of(context).size.width - 30.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 12.0),
                      child: Text(
                        widget.title,
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                            fontSize: 14.0, fontWeight: FontWeight.w300),
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Padding(
                      padding: EdgeInsets.only(left: 12.0),
                      child: _buildAmount(),
                    ),
                  ],
                ),
              ),
              IconButton(
                  icon: Icon(FontAwesomeIcons.chevronRight,
                      color: Color.fromRGBO(36, 36, 97, 0.6)),
                  onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAmount() {
    if (widget.title == "Trésorerie") {
      return BlocBuilder<BankAccountCubit, BankAccountState>(
        builder: (context, state) {
          if (state is BankAccountInitial || state is BankAccountInProgress) {
            return Column(
              children: [
                SizedBox(height: 10.0),
                Center(
                  child: CircularProgressIndicator(),
                ),
              ],
            );
          }
          if (state is BankAccountSuccess) {
            return Text(
              state.amount + " €",
              style: Theme.of(context).textTheme.subtitle1.copyWith(
                  fontSize: 24.0, fontWeight: FontWeight.w700, color: color),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      );
    } else if (widget.title == "Dépenses") {
      return Text(
        "5 234" + " €",
        style: Theme.of(context).textTheme.subtitle1.copyWith(
            fontSize: 24.0, fontWeight: FontWeight.w700, color: color),
      );
    }
    return Text(
      "89 342" + " €",
      style: Theme.of(context)
          .textTheme
          .subtitle1
          .copyWith(fontSize: 24.0, fontWeight: FontWeight.w700, color: color),
    );
  }
}
