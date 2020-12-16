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
  }

  void checkcode(){
    var myList = ['1122334455', '987654321', '1234567890'];

    var element = value;

    if(myList.contains(element)){
      //print('product is genuine ==>  MADE IN INDIA');
      myList.remove(element);
      Navigator.push(context, new MaterialPageRoute(builder: (ctxt) => new genuineResult()));

    } else {
      //print('product is fake');
      Navigator.push(context, new MaterialPageRoute(builder: (ctxt) => new fakeResult()));
    }
  }

  @override
  Widget build(BuildContext context) {
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(barcode, textAlign: TextAlign.center,),
            ),
            Container(
                width: 200,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter BarCode Here',
                    hintText: 'Enter BarCode Here',

                  ),
                  onChanged: (text) {
                    value = text;
                  },
                  autofocus: false,
                )
            ),
            Container(
              margin: EdgeInsets.all(25),
              child: FlatButton(
                child: Text('Check the Barcode', style: TextStyle(fontSize: 20.0),),
                onPressed: () => checkcode(),
              ),
            ),
          ],
        ),
      ),
      drawer: new Draweronly(),
    );
  }
}

class genuineResult extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(title: new Text("Results"),),
      body: new Text("The product is genuine ==> made in india"),
    );
  }

}

class fakeResult extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(title: new Text("Results"),),
      body: new Text("The product is fake"),
    );
  }

}
