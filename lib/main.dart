import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}
class Draweronly extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    return new Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
            DrawerHeader(
              child: Text('Hi User!!', style: TextStyle(fontSize: 40.0), textAlign: TextAlign.center,),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
          ListTile(
            leading: Icon(Icons.settings), title: Text("How to Use"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, new MaterialPageRoute(builder: (ctxt) => new howToUse()));
            },
          ),
          ListTile(
            leading: Icon(Icons.contacts), title: Text("Contact Us"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, new MaterialPageRoute(builder: (ctxt) => new contactus()));
            },
          ),
        ],
      ),
    );
  }
}

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
  }

  @override
  Widget build(BuildContext context) {
    var mainAxisAlignment;
    return Scaffold(
      appBar: AppBar(
        title: Text('BarCode Scanner'),
        centerTitle: true,
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: RaisedButton(
                color: Colors.purple,
                textColor: Colors.white,
                splashColor: Colors.blueGrey,
                onPressed: scanCode,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.scanner, size: 40,),
                    SizedBox(width: 10,),
                    Column(
                      children: <Widget>[
                        Text('Camera Scan', style: TextStyle(fontSize: 20.0),),
                        SizedBox(height: 2,),
                        Text("Click here to Scan")
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(barcode, textAlign: TextAlign.center,),
            )
          ],
        ),
      ),
        drawer: new Draweronly(),
    );
  }
}
class contactus extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Contact Us"),),
      body: new Text("Here will be contact Details"),
    );
  }
}
class howToUse extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("How to Use"),),
      body: new Text("Here will be Instructions to use"),
    );
  }
}