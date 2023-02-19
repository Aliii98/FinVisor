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
  // late Future<Stock> futureStock;
  late Stock futureStock;
  @override
  void initState() {
    super.initState();
    // futureStock = await fetchStock('msft');
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
            setState(() async {
              Navigator.pushNamed(context, '/info', arguments: await Stock(myController.text));
            });
          },
        ),
      ),
    );
  }

  int getCount(){
    return counter;
  }
}