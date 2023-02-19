import 'package:intl/intl.dart';
import 'package:finvisor/StockOverview.dart';
import 'package:finvisor/FundamentalOverview.dart';

class Stock {
  final String _symbol;
  final Future<StockOverview> _stock_overview;
  final Future<FundamentalOverview> _fundamental_overview;

  Stock._(this._symbol, this._stock_overview, this._fundamental_overview);

  factory Stock(String symbol)
  {
    Future<StockOverview> stock_overview = StockOverview.create(symbol);
    Future<FundamentalOverview> fundamental_overview = FundamentalOverview.create(symbol);
    return new Stock._(symbol, stock_overview, fundamental_overview);
  }

  String get symbol => _symbol;
  Future<StockOverview> get stock_overview => _stock_overview;
  Future<FundamentalOverview> get fundamental_overview => _fundamental_overview;

  factory Stock.fromJson(Map<String, dynamic> json) {
    print(json);
    json = json["Global Quote"]; //Parse the wrapper object
    var symbol = json["01. symbol"];
    return new Stock(symbol);
  }
}