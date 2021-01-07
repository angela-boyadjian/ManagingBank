import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mimi/logic/cubit/cubit.dart';

class ResultCard extends StatefulWidget {
  final String title;
  final String amount;
  final Color color;
  final String route;

  ResultCard({
    Key key,
    @required this.title,
    @required this.amount,
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

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: InkWell(
        onTap: () => Navigator.of(context).pushNamed(widget.route),
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
                      child: BlocBuilder<BankAccountCubit, BankAccountState>(
                        builder: (context, state) {
                          if (state is BankAccountSuccess) {
                            print("AMOUNT: " + state.amount);
                          }
                          return Text(
                            widget.amount,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1
                                .copyWith(
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.w700,
                                    color: color),
                          );
                        },
                      ),
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
}
