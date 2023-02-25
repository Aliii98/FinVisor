import 'package:intl/intl.dart';
import 'package:finvisor/data/StockOverview.dart';
import 'package:finvisor/data/FundamentalOverview.dart';
import 'package:finvisor/data/HistoricEPS.dart';

class Stock {
  final String _symbol;
  final Future<StockOverview> _stock_overview;
  final Future<FundamentalOverview> _fundamental_overview;
  final Future<HistoricEPS> _historic_eps;

  Stock._(this._symbol, this._stock_overview, this._fundamental_overview, this._historic_eps);

  factory Stock(String symbol)
  {
    Future<StockOverview> stock_overview = StockOverview.create(symbol);
    Future<FundamentalOverview> fundamental_overview = FundamentalOverview.create(symbol);
    Future<HistoricEPS> historic_eps = HistoricEPS.create(symbol);
    return new Stock._(symbol, stock_overview, fundamental_overview, historic_eps);
  }

  String get symbol => _symbol;
  Future<StockOverview> get stock_overview => _stock_overview;
  Future<FundamentalOverview> get fundamental_overview => _fundamental_overview;
  Future<HistoricEPS> get historic_eps => _historic_eps;

  factory Stock.fromJson(Map<String, dynamic> json) {
    print(json);
    json = json["Global Quote"]; //Parse the wrapper object
    var symbol = json["01. symbol"];
    return new Stock(symbol);
  }
}