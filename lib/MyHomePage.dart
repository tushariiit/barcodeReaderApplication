import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import './drawer.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';

String value = "";

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String barcode = "";
  Future scanCode() async {
    try {
      String barcode = await BarcodeScanner.scan();
      setState(() => this.barcode = barcode);
    } catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          this.barcode = 'The user did not grant the camera permission!';
        });
      } else {
        setState(() => this.barcode = 'Unknown error: $e');
      }
    }
    //checkcode();
  }

  @override
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BarCode Scanner'),
        centerTitle: true,
      ),
      body: new Center(
        child: new ListView(
          children: <Widget>[
            Container(
                margin: const EdgeInsets.fromLTRB(20, 20, 20, 5),
                child: Image.asset(
                  "assets/icon/icon.png",
                  width: 120, height: 120, fit: BoxFit.contain,)),
            Container(
              child: Text(
                  "\nThe One of a Kind",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.lightBlue[300],
                ),
              ),
            ),
            Container(
              child: Text(
                "COUNTERFEIT DETECTOR",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.blue[700],
                    fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20,50,20,80),
              child: RaisedButton(
                color: Colors.purple,
                textColor: Colors.white,
                splashColor: Colors.blueGrey,
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                onPressed: scanCode,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.scanner, size: 40,),
                    SizedBox(width: 10,),
                    Column(
                      children: <Widget>[
                        Text('Camera Scan', style: TextStyle(fontSize: 20.0),),
                        SizedBox(height: 10,),
                        Text("Click here to Scan")
                      ],
                    )
                  ],
                ),
              ),
            ),
            Text(
              barcode,
              style: TextStyle(fontSize: 50.0),
            ),
          ],
        ),
      ),
      drawer: new Draweronly(),
    );
  }
}

