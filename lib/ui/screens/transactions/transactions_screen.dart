import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:mimi/logic/bloc/bloc.dart';
import 'package:mimi/ui/widgets/pending_card.dart';
import 'package:mimi/ui/widgets/bottom_loader.dart';
import 'package:mimi/ui/widgets/custom_app_bar.dart';
import 'package:mimi/constants/constants.dart' as constants;

import 'widgets/transaction_card.dart';

class TransactionsScreen extends StatefulWidget {
  TransactionsScreen({Key key}) : super(key: key);

  @override
  _TransactionsScreenState createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;
  TransactionsBloc _transactionsBloc;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _transactionsBloc = BlocProvider.of<TransactionsBloc>(context);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;

    if (maxScroll - currentScroll <= _scrollThreshold) {
      _transactionsBloc.add(TransactionsFetched());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("Transactions"),
      body: Column(
        children: [
          SizedBox(height: 30.0),
          Flexible(
            flex: 1,
            child: Center(
              child: PendingCard(isTransaction: true),
            ),
          ),
          Flexible(
            flex: 1,
            child: Align(
              alignment: FractionalOffset(0.18, 0.5),
              child: Text(
                "-2 567, 92 €",
                style: Theme.of(context).textTheme.headline3.copyWith(
                    color: Color(0xFFFDAF3A),
                    fontWeight: FontWeight.w700,
                    fontSize: 36),
              ),
            ),
          ),
          Flexible(
            flex: 4,
            child: Container(
              color: Colors.white,
              child: BlocBuilder<TransactionsBloc, TransactionsState>(
                builder: (context, state) {
                  if (state is TransactionsInitial) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is TransactionsFailure) {
                    return Center(
                      child: Text('failed to fetch transactions'),
                    );
                  }
                  if (state is TransactionsSuccess) {
                    if (state.transactions.isEmpty) {
                      return Center(
                        child: Text('no transactions'),
                      );
                    }
                    return ListView.separated(
                      controller: _scrollController,
                      scrollDirection: Axis.vertical,
                      itemCount: state.transactions.length,
                      itemBuilder: (BuildContext context, index) {
                        return index >= state.transactions.length
                            ? BottomLoader()
                            : TransactionCard(
                                state.transactions[index].attributes);
                      },
                      separatorBuilder: (context, index) {
                        return Container(
                            width: MediaQuery.of(context).size.width,
                            height: 0.88,
                            color: Color(0xFFEEEEFC));
                      },
                    );
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0.0,
        child: null,
      ),
      floatingActionButton: Container(
        width: 64,
        height: 64,
        child: FloatingActionButton(
            child: Icon(FontAwesomeIcons.search, color: Colors.white, size: 22),
            backgroundColor: Theme.of(context).primaryColor,
            onPressed: () =>
                Navigator.of(context).pushNamed(constants.searchRoute)),
      ),
    );
  }
}
