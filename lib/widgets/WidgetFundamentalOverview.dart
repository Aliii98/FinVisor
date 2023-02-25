import 'package:flutter/material.dart';
import 'package:finvisor/Stock.dart';
import 'package:finvisor/data/StockOverview.dart';
import 'package:finvisor/data/FundamentalOverview.dart';

class WidgetFundamentalOverview extends StatelessWidget {
  final data;
  const WidgetFundamentalOverview(this.data);

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
    return FutureBuilder<FundamentalOverview>(
      future: data.fundamental_overview,
      builder: (context, snapshot) {
        if (snapshot.hasData &&
            snapshot.connectionState == ConnectionState.done) {
          return Column(
              children: <Widget>[
                Text("Symbol: ${snapshot.data!.symbol}"),
                Text("MarketCapitalization: ${snapshot.data!.marketCapitalization}"),
                Text("EBITDA: ${snapshot.data!.eBITDA}"),
                Text("PERatio: ${snapshot.data!.pERatio}"),
                Text("PEGRatio: ${snapshot.data!.pEGRatio}"),
                Text("BookValue: ${snapshot.data!.bookValue}"),
                Text("DividendYield: ${snapshot.data!.dividendYield}"),
                Text("EPS: ${snapshot.data!.ePS}"),
                Text("SharesOutstanding: ${snapshot.data!.sharesOutstanding}"),
                Text("ProfitMargin: ${snapshot.data!.profitMargin}"),
                Text("AnalystTargetPrice: ${snapshot.data!.analystTargetPrice}"),
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
