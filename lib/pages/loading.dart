import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      appBar: AppBar(
        title: const Text('Loading Page'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
              margin: const EdgeInsets.all(50),
              child: const SpinKitFadingCube(
                color: Colors.white,
                size: 100.0,
              ),
          ),
          Container(
            child: RichText(
              text: TextSpan(
                text: 'Fin',
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'RubikVinyl'
                ),
                children: const <TextSpan>[
                  TextSpan(
                    text: 'Visor',
                    style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        color: Colors.yellow,
                        fontFamily: 'Lobster'
                    ),
                  )
                ]
              )
            ),
          ),
        ],
      )
    );
  }

  @override
  void initState() {
    super.initState();
    showLoadingScreen();
  }

  void showLoadingScreen() async {
    await Future.delayed(const Duration(seconds: 2), (){
      Navigator.pushNamed(context, '/home');
    });
  }
}
