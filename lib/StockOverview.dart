import 'package:intl/intl.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

class StockOverview {
  String _symbol = "";
  String _open = "";
  String _high = "";
  String _low = "";
  String _price = "";
  String _volume = "";
  String _latest_trading_day = "";
  String _previous_close = "";
  String _change = "";
  String _change_percent = "";

  StockOverview._create(this._symbol);
  static Future<StockOverview> create(String symbol) async
  {
    print("Inside StockOverview.create()... symbol = " + symbol);
    // Call the private constructor
    var stock_overview = StockOverview._create(symbol);
    await stock_overview._getJson(symbol);
    return stock_overview;
  }
  String get symbol => _symbol;
  String get open => _open;
  String get high => _high;
  String get low => _low;
  String get price => _price;
  String get volume => _volume;
  String get latest_trading_day => _symbol;
  String get previous_close => _previous_close;
  String get change => _change;
  String get change_percent => _change_percent;

  Future<dynamic> _getJson(String symbol) async {
    String FUNCTION = "GLOBAL_QUOTE";
    String SYMBOL = symbol;
    String API_KEY = "MF1CDJUAAMBCPMJZ";
    final response = await http
        .get(
        Uri.parse('https://www.alphavantage.co/query?function=$FUNCTION&symbol=$SYMBOL&apikey=$API_KEY'),
        headers: {"Accept": "application/json"}
    );
    print('Sent Request Now (Overview).. Awaiting Respoonse:');
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      print("Overview getJson()");
      dynamic json = jsonDecode(response.body);
      json = json["Global Quote"]; //Parse the wrapper object
      print(json);
      _setStockOverview(json);
      return jsonDecode(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
  void _setStockOverview(dynamic json)
  {
    this._symbol = json["01. symbol"];
    this._open = json["02. open"];
    this._high = json["03. high"];
    this._low = json["04. low"];
    this._price = json["05. price"];
    this._volume = json["06. volume"];
    this._latest_trading_day = json["07. latest trading day"];
    this._previous_close = json["08. previous close"];
    this._change = json["09. change"];
    this._change_percent = json["10. change percent"];
  }

}