import 'package:intl/intl.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

class HistoricEPS {
  late String _symbol;
  late List<AnnualEPS> _annual_eps;
  late List<QuarterlyEPS> _quarterly_eps;
  List<String>? _keys;

  HistoricEPS._create(this._symbol);
  static Future<HistoricEPS> create(String symbol) async
  {
    print("Inside StockOverview.create()... symbol = " + symbol);
    // Call the private constructor
    var historic_eps = HistoricEPS._create(symbol);
    await historic_eps._getJson(symbol);
    // stock_overview._setStockOverview(json);
    return historic_eps;
  }
  String get symbol => _symbol;
  List<AnnualEPS> get annual_eps => _annual_eps;
  List<QuarterlyEPS> get quarterly_eps => _quarterly_eps;
  List<String>? get keys => _keys;

  dynamic _getJson(String symbol) async {
    String FUNCTION = "EARNINGS";
    String SYMBOL = symbol;
    String API_KEY = "MF1CDJUAAMBCPMJZ";
    final response = await http
        .get(
        Uri.parse('https://www.alphavantage.co/query?function=$FUNCTION&symbol=$SYMBOL&apikey=$API_KEY'),
        headers: {"Accept": "application/json"}
    );
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      dynamic json = jsonDecode(response.body);
      // json = json["Global Quote"]; //Parse the wrapper object
      print(json);
      _init(json); //set the private variables
      _keys = json.keys.toList(); //get json keys
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
  void _init(dynamic json)
  {
    //Initialize Annual EPS Array
    var annualEPSJsonArr = json["annualEarnings"] as List;
    this._annual_eps = annualEPSJsonArr.map((epsObj) => AnnualEPS.fromJson(epsObj)).toList();
    //Initialize Quarterly EPS Array
    var quarterlyEPSJsonArr = json["quarterlyEarnings"] as List;
    this._quarterly_eps = quarterlyEPSJsonArr.map((epsObj) => QuarterlyEPS.fromJson(epsObj)).toList();
  }

}

class AnnualEPS {
  late String _fiscalDateEnding;
  late String _reportedEPS;
  //Constructor
  AnnualEPS(this._fiscalDateEnding, this._reportedEPS);
  factory AnnualEPS.fromJson(dynamic json){
    return AnnualEPS(json["fiscalDateEnding"] as String, json["reportedEPS"] as String);
  }
  //Getters
  String get fiscalDateEnding => _fiscalDateEnding;
  String get reportedEPS => _reportedEPS;
}

class QuarterlyEPS {
  late String _fiscalDateEnding;
  late String _reportedDate;
  late String _reportedEPS;
  late String _estimatedEPS;
  late String _surprise;
  late String _surprisePercentage;

  //Constructor
  QuarterlyEPS(this._fiscalDateEnding, this._reportedDate, this._reportedEPS, this._estimatedEPS, this._surprise, this._surprisePercentage);
  factory QuarterlyEPS.fromJson(dynamic json){
    return QuarterlyEPS(json["fiscalDateEnding"],
                        json["reportedDate"],
                        json["reportedEPS"],
                        json["estimatedEPS"],
                        json["surprise"],
                        json["surprisePercentage"]);
  }
  //Getters
  String get fiscalDateEnding => _fiscalDateEnding;
  String get reportedDate => _reportedDate;
  String get reportedEPS => _reportedEPS;
  String get estimatedEPS => _estimatedEPS;
  String get surprise => _surprise;
  String get surprisePercentage => _surprisePercentage;
}

