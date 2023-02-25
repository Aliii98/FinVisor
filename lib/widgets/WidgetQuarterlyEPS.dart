import 'package:flutter/material.dart';
import 'package:finvisor/Stock.dart';
import 'package:finvisor/data/FundamentalOverview.dart';
import 'package:finvisor/data/HistoricEPS.dart';

class WidgetQuarterlyEPS extends StatelessWidget {
  final data;
  const WidgetQuarterlyEPS(this.data);

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
        child: Data(this.data)
    );
  }

}

class Data extends StatelessWidget {
  final data;
  const Data(this.data);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<HistoricEPS>(
      future: data.historic_eps,
      builder: (context, snapshot) {
        if (snapshot.hasData &&
            snapshot.connectionState == ConnectionState.done) {
          return Container(
            // height: MediaQuery.of(context).size.height,
            height: 100.0,
            width: 500,
            child:  ListView.builder(
            // Let the ListView know how many items it needs to build.
            itemCount: snapshot.data!.quarterly_eps.length,
            // Provide a builder function. This is where the magic happens.
            // Convert each item into a widget based on the type of item it is.
            itemBuilder: (context, index) {
              final item = snapshot.data!.quarterly_eps[index];
              return ListTile(
                leading: Icon(Icons.monetization_on),
                title: Text("Reported: " + item.reportedEPS + ", Estimate ~ " + item.estimatedEPS + ", Surprise: " + item.surprisePercentage),
                subtitle: Text(item.fiscalDateEnding),
                trailing: Icon(Icons.percent_rounded),
              );
            },
          ),
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
