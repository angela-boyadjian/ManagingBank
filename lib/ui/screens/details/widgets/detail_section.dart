import 'package:flutter/material.dart';

class DetailSection extends StatelessWidget {
  final String _tva;
  final String _amount;

  DetailSection(this._tva, this._amount);

  Widget _buildSeparator(context) => Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 0.9,
        color: Color(0xFFCBCBF6),
      );

  Widget _buildTitles(context) {
    TextStyle style = Theme.of(context).textTheme.subtitle1.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 12.0,
          color: Color(0xFF242461).withOpacity(0.6),
        );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text('TVA', style: style),
        SizedBox(width: 10),
        Text('Calcul TVA', style: style),
        SizedBox(width: 10),
        Text('TTC', style: style),
      ],
    );
  }

  Widget _buildData(context) {
    TextStyle style = Theme.of(context).textTheme.subtitle1.copyWith(
          fontWeight: FontWeight.w300,
          fontSize: 12.0,
        );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text("$_tva${_tva == 'multi-TVA' ? '' : '%'}", style: style),
        SizedBox(width: 10),
        Text(_tva == '0' ? '-' : '7,20 €', style: style),
        SizedBox(width: 10),
        Text(
          '${_amount.substring(1)}',
          style: Theme.of(context)
              .textTheme
              .subtitle1
              .copyWith(fontWeight: FontWeight.bold, fontSize: 12.0),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTitles(context),
        Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: _buildSeparator(context),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: _buildData(context),
        ),
      ],
    );
  }
}
