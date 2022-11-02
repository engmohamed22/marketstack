import 'package:flutter/material.dart';

import '../../data/model/ticker_model.dart';
import '../screens/stock_screen.dart';

class TickerCard extends StatelessWidget {
  const TickerCard({
    Key? key,
    required this.ticker,
  }) : super(key: key);

  final TickerModel ticker;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => StockScreen(symbol: ticker.symbol),
            ),
          );
        },
        leading: SizedBox(
          width: MediaQuery.of(context).size.width * 0.2,
          child: Text(
            ticker.symbol,
            style: Theme.of(context).textTheme.headline6,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        title: Text(ticker.name),
        subtitle: Text(ticker.stockExchange.name),
        // trailing: IconButton(
        //     onPressed: () {}, icon: const Icon(Icons.favorite_border)),
      ),
    );
  }
}
