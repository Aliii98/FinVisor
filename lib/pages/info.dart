import 'package:flutter/material.dart';
import 'package:finvisor/Stock.dart';
import 'package:finvisor/data/StockOverview.dart';
import 'package:finvisor/data/FundamentalOverview.dart';
import 'package:finvisor/widgets/WidgetStockOverview.dart';
import 'package:finvisor/widgets/WidgetFundamentalOverview.dart';
import 'package:finvisor/widgets/WidgetAnnualEPS.dart';
import 'package:finvisor/widgets/WidgetQuarterlyEPS.dart';

class Info extends StatefulWidget {
  const Info({Key? key}) : super(key: key);

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Stock;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stock Info Page'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            WidgetStockOverview(arguments),
            WidgetFundamentalOverview(arguments),
            WidgetAnnualEPS(arguments),
            WidgetQuarterlyEPS(arguments),
          ],
        ),
      ),
    );
  }
}
