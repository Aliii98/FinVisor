import 'package:intl/intl.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

class FundamentalOverview {
  List<String>? _keys;
  String? _symbol;
  String? _assetType;
  String? _name;
  String? _description;
  String? _cIK;
  String? _exchange;
  String? _currency;
  String? _country;
  String? _sector;
  String? _industry;
  String? _address;
  String? _fiscalYearEnd;
  String? _latestQuarter;
  String? _marketCapitalization;
  String? _eBITDA;
  String? _pERatio;
  String? _pEGRatio;
  String? _bookValue;
  String? _dividendPerShare;
  String? _dividendYield;
  String? _ePS;
  String? _revenuePerShareTTM;
  String? _profitMargin;
  String? _operatingMarginTTM;
  String? _returnOnAssetsTTM;
  String? _returnOnEquityTTM;
  String? _revenueTTM;
  String? _grossProfitTTM;
  String? _dilutedEPSTTM;
  String? _quarterlyEarningsGrowthYOY;
  String? _quarterlyRevenueGrowthYOY;
  String? _analystTargetPrice;
  String? _trailingPE;
  String? _forwardPE;
  String? _priceToSalesRatioTTM;
  String? _priceToBookRatio;
  String? _eVToRevenue;
  String? _eVToEBITDA;
  String? _beta;
  String? _s52WeekHigh;
  String? _s52WeekLow;
  String? _s50DayMovingAverage;
  String? _s200DayMovingAverage;
  String? _sharesOutstanding;
  String? _dividendDate;
  String? _exDividendDate;

  FundamentalOverview._create(this._symbol);
  static Future<FundamentalOverview> create(String symbol) async
  {
    print("Inside StockOverview.create()... symbol = " + symbol);
    // Call the private constructor
    var fundamental_overview = FundamentalOverview._create(symbol);
    await fundamental_overview._getJson(symbol);
    // stock_overview._setStockOverview(json);
    return fundamental_overview;
  }
  List<String>? get keys => _keys;
  String? get symbol => _symbol;
  set symbol(String? symbol) => _symbol = symbol;
  String? get assetType => _assetType;
  set assetType(String? assetType) => _assetType = assetType;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get description => _description;
  set description(String? description) => _description = description;
  String? get cIK => _cIK;
  set cIK(String? cIK) => _cIK = cIK;
  String? get exchange => _exchange;
  set exchange(String? exchange) => _exchange = exchange;
  String? get currency => _currency;
  set currency(String? currency) => _currency = currency;
  String? get country => _country;
  set country(String? country) => _country = country;
  String? get sector => _sector;
  set sector(String? sector) => _sector = sector;
  String? get industry => _industry;
  set industry(String? industry) => _industry = industry;
  String? get address => _address;
  set address(String? address) => _address = address;
  String? get fiscalYearEnd => _fiscalYearEnd;
  set fiscalYearEnd(String? fiscalYearEnd) => _fiscalYearEnd = fiscalYearEnd;
  String? get latestQuarter => _latestQuarter;
  set latestQuarter(String? latestQuarter) => _latestQuarter = latestQuarter;
  String? get marketCapitalization => _marketCapitalization;
  set marketCapitalization(String? marketCapitalization) =>
      _marketCapitalization = marketCapitalization;
  String? get eBITDA => _eBITDA;
  set eBITDA(String? eBITDA) => _eBITDA = eBITDA;
  String? get pERatio => _pERatio;
  set pERatio(String? pERatio) => _pERatio = pERatio;
  String? get pEGRatio => _pEGRatio;
  set pEGRatio(String? pEGRatio) => _pEGRatio = pEGRatio;
  String? get bookValue => _bookValue;
  set bookValue(String? bookValue) => _bookValue = bookValue;
  String? get dividendPerShare => _dividendPerShare;
  set dividendPerShare(String? dividendPerShare) =>
      _dividendPerShare = dividendPerShare;
  String? get dividendYield => _dividendYield;
  set dividendYield(String? dividendYield) => _dividendYield = dividendYield;
  String? get ePS => _ePS;
  set ePS(String? ePS) => _ePS = ePS;
  String? get revenuePerShareTTM => _revenuePerShareTTM;
  set revenuePerShareTTM(String? revenuePerShareTTM) =>
      _revenuePerShareTTM = revenuePerShareTTM;
  String? get profitMargin => _profitMargin;
  set profitMargin(String? profitMargin) => _profitMargin = profitMargin;
  String? get operatingMarginTTM => _operatingMarginTTM;
  set operatingMarginTTM(String? operatingMarginTTM) =>
      _operatingMarginTTM = operatingMarginTTM;
  String? get returnOnAssetsTTM => _returnOnAssetsTTM;
  set returnOnAssetsTTM(String? returnOnAssetsTTM) =>
      _returnOnAssetsTTM = returnOnAssetsTTM;
  String? get returnOnEquityTTM => _returnOnEquityTTM;
  set returnOnEquityTTM(String? returnOnEquityTTM) =>
      _returnOnEquityTTM = returnOnEquityTTM;
  String? get revenueTTM => _revenueTTM;
  set revenueTTM(String? revenueTTM) => _revenueTTM = revenueTTM;
  String? get grossProfitTTM => _grossProfitTTM;
  set grossProfitTTM(String? grossProfitTTM) =>
      _grossProfitTTM = grossProfitTTM;
  String? get dilutedEPSTTM => _dilutedEPSTTM;
  set dilutedEPSTTM(String? dilutedEPSTTM) => _dilutedEPSTTM = dilutedEPSTTM;
  String? get quarterlyEarningsGrowthYOY => _quarterlyEarningsGrowthYOY;
  set quarterlyEarningsGrowthYOY(String? quarterlyEarningsGrowthYOY) =>
      _quarterlyEarningsGrowthYOY = quarterlyEarningsGrowthYOY;
  String? get quarterlyRevenueGrowthYOY => _quarterlyRevenueGrowthYOY;
  set quarterlyRevenueGrowthYOY(String? quarterlyRevenueGrowthYOY) =>
      _quarterlyRevenueGrowthYOY = quarterlyRevenueGrowthYOY;
  String? get analystTargetPrice => _analystTargetPrice;
  set analystTargetPrice(String? analystTargetPrice) =>
      _analystTargetPrice = analystTargetPrice;
  String? get trailingPE => _trailingPE;
  set trailingPE(String? trailingPE) => _trailingPE = trailingPE;
  String? get forwardPE => _forwardPE;
  set forwardPE(String? forwardPE) => _forwardPE = forwardPE;
  String? get priceToSalesRatioTTM => _priceToSalesRatioTTM;
  set priceToSalesRatioTTM(String? priceToSalesRatioTTM) =>
      _priceToSalesRatioTTM = priceToSalesRatioTTM;
  String? get priceToBookRatio => _priceToBookRatio;
  set priceToBookRatio(String? priceToBookRatio) =>
      _priceToBookRatio = priceToBookRatio;
  String? get eVToRevenue => _eVToRevenue;
  set eVToRevenue(String? eVToRevenue) => _eVToRevenue = eVToRevenue;
  String? get eVToEBITDA => _eVToEBITDA;
  set eVToEBITDA(String? eVToEBITDA) => _eVToEBITDA = eVToEBITDA;
  String? get beta => _beta;
  set beta(String? beta) => _beta = beta;
  String? get s52WeekHigh => _s52WeekHigh;
  set s52WeekHigh(String? s52WeekHigh) => _s52WeekHigh = s52WeekHigh;
  String? get s52WeekLow => _s52WeekLow;
  set s52WeekLow(String? s52WeekLow) => _s52WeekLow = s52WeekLow;
  String? get s50DayMovingAverage => _s50DayMovingAverage;
  set s50DayMovingAverage(String? s50DayMovingAverage) =>
      _s50DayMovingAverage = s50DayMovingAverage;
  String? get s200DayMovingAverage => _s200DayMovingAverage;
  set s200DayMovingAverage(String? s200DayMovingAverage) =>
      _s200DayMovingAverage = s200DayMovingAverage;
  String? get sharesOutstanding => _sharesOutstanding;
  set sharesOutstanding(String? sharesOutstanding) =>
      _sharesOutstanding = sharesOutstanding;
  String? get dividendDate => _dividendDate;
  set dividendDate(String? dividendDate) => _dividendDate = dividendDate;
  String? get exDividendDate => _exDividendDate;
  set exDividendDate(String? exDividendDate) =>
      _exDividendDate = exDividendDate;


  dynamic _getJson(String symbol) async {
    String FUNCTION = "OVERVIEW";
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
    _symbol = json['Symbol'];
    _assetType = json['AssetType'];
    _name = json['Name'];
    _description = json['Description'];
    _cIK = json['CIK'];
    _exchange = json['Exchange'];
    _currency = json['Currency'];
    _country = json['Country'];
    _sector = json['Sector'];
    _industry = json['Industry'];
    _address = json['Address'];
    _fiscalYearEnd = json['FiscalYearEnd'];
    _latestQuarter = json['LatestQuarter'];
    _marketCapitalization = json['MarketCapitalization'];
    _eBITDA = json['EBITDA'];
    _pERatio = json['PERatio'];
    _pEGRatio = json['PEGRatio'];
    _bookValue = json['BookValue'];
    _dividendPerShare = json['DividendPerShare'];
    _dividendYield = json['DividendYield'];
    _ePS = json['EPS'];
    _revenuePerShareTTM = json['RevenuePerShareTTM'];
    _profitMargin = json['ProfitMargin'];
    _operatingMarginTTM = json['OperatingMarginTTM'];
    _returnOnAssetsTTM = json['ReturnOnAssetsTTM'];
    _returnOnEquityTTM = json['ReturnOnEquityTTM'];
    _revenueTTM = json['RevenueTTM'];
    _grossProfitTTM = json['GrossProfitTTM'];
    _dilutedEPSTTM = json['DilutedEPSTTM'];
    _quarterlyEarningsGrowthYOY = json['QuarterlyEarningsGrowthYOY'];
    _quarterlyRevenueGrowthYOY = json['QuarterlyRevenueGrowthYOY'];
    _analystTargetPrice = json['AnalystTargetPrice'];
    _trailingPE = json['TrailingPE'];
    _forwardPE = json['ForwardPE'];
    _priceToSalesRatioTTM = json['PriceToSalesRatioTTM'];
    _priceToBookRatio = json['PriceToBookRatio'];
    _eVToRevenue = json['EVToRevenue'];
    _eVToEBITDA = json['EVToEBITDA'];
    _beta = json['Beta'];
    _s52WeekHigh = json['52WeekHigh'];
    _s52WeekLow = json['52WeekLow'];
    _s50DayMovingAverage = json['50DayMovingAverage'];
    _s200DayMovingAverage = json['200DayMovingAverage'];
    _sharesOutstanding = json['SharesOutstanding'];
    _dividendDate = json['DividendDate'];
    _exDividendDate = json['ExDividendDate'];
  }

}