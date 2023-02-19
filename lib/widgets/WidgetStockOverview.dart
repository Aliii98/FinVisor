import 'package:flutter/material.dart';
import 'package:finvisor/Stock.dart';
import 'package:finvisor/StockOverview.dart';
import 'package:finvisor/FundamentalOverview.dart';

class WidgetStockOverview extends StatelessWidget {
  final data;
  const WidgetStockOverview({this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.blueAccent),
          borderRadius: BorderRadius.all(
              Radius.circular(5.0) //                 <--- border radius here
          ),
          boxShadow: [
            new BoxShadow(
              color: Colors.red,
              offset: new Offset(20.0, 10.0),
              blurRadius: 20.0,
            )
          ],
        ),
        // child: Text(arguments.stock_overview.previous_close)
        // ),
        child: Data(data: this.data)
    );
  }

}

class Data extends StatelessWidget {
  final data;
  const Data({this.data});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<StockOverview>(
      future: data.stock_overview,
      builder: (context, snapshot) {
        if (snapshot.hasData &&
            snapshot.connectionState == ConnectionState.done) {
          return Column(
              children: <Widget>[
                Text("Symbol: ${snapshot.data!.symbol}"),
                Text("Price: ${snapshot.data!.price}"),
                Text("Previous Close: ${snapshot.data!.previous_close}"),
                Text("Open: ${snapshot.data!.open}"),
                Text("Change: ${snapshot.data!.change}"),
                Text("Change %: ${snapshot.data!.change_percent}"),
                Text("High: ${snapshot.data!.high}"),
                Text(
                    "Latest Trading Day: ${snapshot.data!.latest_trading_day}"),
                Text("Low: ${snapshot.data!.low}"),
                Text("Volume: ${snapshot.data!.volume}"),
              ]
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        // By default, show a loading spinner.
        return const CircularProgressIndicator();
      },
    );
  }
}
