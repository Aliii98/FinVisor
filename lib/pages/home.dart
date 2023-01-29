import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:finvisor/Stock.dart';

class Home extends StatefulWidget{
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int counter = 0;
  late Future<Stock> futureStock;
  // late Stock futureStock;
  @override
  void initState() {
    super.initState();
    futureStock = fetchStock('msft');
    // futureStock = Stock('msft');
  }
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final myController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('FinVisor'),
          centerTitle: true,
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: Colors.green),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: myController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter a ticker',
                    ),
                  ),
                ),
              ),
            ]),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.search),
          onPressed: (){
            setState(() {
              fetchStock(myController.text).then((stock){
                print("inside fetchstock.then()");
                print(stock.symbol);
                // futureStock = Stock(myController.text);
                // futureStock = stock;
                // print(futureStock);
                // counter++;
                Navigator.pushNamed(context, '/info', arguments: {
                  'stockData': stock
                });
              });
            });
          },
        ),
      ),
    );
  }

  int getCount(){
    return counter;
  }
  Future<Stock> fetchStock(String ticker) async {
    // String FUNCTION = "GLOBAL_QUOTE";
    // String SYMBOL = ticker;
    // String API_KEY = "MF1CDJUAAMBCPMJZ";
    // String OUTPUT_SIZE = "compact" ;
    // print(SYMBOL);
    // final response = await http
    //     .get(
    //     Uri.parse('https://www.alphavantage.co/query?function=$FUNCTION&symbol=$SYMBOL&apikey=$API_KEY'),
    //     headers: {"Accept": "application/json"}
    // );
    // print('Sent Request Now (Home).. Awaiting Respoonse:');
    // if (response.statusCode == 200) {
    //   // If the server did return a 200 OK response,
    //   // then parse the JSON.
    //   return Stock.fromJson(jsonDecode(response.body));
    // } else {
    //   // If the server did not return a 200 OK response,
    //   // then throw an exception.
    //   throw Exception('Failed to load album');
    // }
    Stock future_stock = await Stock(ticker);
    return future_stock;
  }
  // Future<Stock> get(String ticker) async {
  //   String FUNCTION = "CASH_FLOW";
  //   String SYMBOL = ticker;
  //   String API_KEY = "MF1CDJUAAMBCPMJZ";
  //   String OUTPUT_SIZE = "compact" ;
  //   print(SYMBOL);
  //   final response = await http
  //       .get(
  //       Uri.parse('https://www.alphavantage.co/query?function=$FUNCTION&symbol=$SYMBOL&outputsize=$OUTPUT_SIZE&apikey=$API_KEY'),
  //       headers: {"Accept": "application/json"}
  //   );
  //   print('Sent Request Now.. Awaiting Respoonse:');
  //   if (response.statusCode == 200) {
  //     // If the server did return a 200 OK response,
  //     // then parse the JSON.
  //     return Stock.fromJson(jsonDecode(response.body));
  //   } else {
  //     // If the server did not return a 200 OK response,
  //     // then throw an exception.
  //     throw Exception('Failed to load album');
  //   }
  // }
}