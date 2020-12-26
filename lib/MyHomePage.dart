import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import './drawer.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

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
    checkcode();
  }
  var myList = ['1122334455', '987654321', '1234567890'];
  void checkcode(){
    var element = barcode;
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
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BarCode Scanner'),
        centerTitle: true,
      ),
      body:
      new Center(
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
            /*Container(
              child: Text(
                "\n    The BarCode is:",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.green[700],
                    fontWeight: FontWeight.bold
                ),
              ),
            ),*/
            /*Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
              child: Text(barcode, textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.green[700],
                    fontWeight: FontWeight.bold
                ),),
            ),*/
           /* Container(
              child: Text(
                "\n    Enter the BarCode:",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.green[700],
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20,5,20,5),
                child: TextField(
                  obscureText: false,
                  style: style,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      hintText: "Enter the above barcode",
                      border:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
                  onChanged: (text) {
                    value = text;
                  },
                  autofocus: false,
                )
            ),*/
            /*Container(
              margin: EdgeInsets.fromLTRB(120,15,120,5),
              //padding: const EdgeInsets.only(left: 125.0,right: 125.0),
              height: 30.0,
              child :RaisedButton(
                color: Colors.purple,
                textColor: Colors.white,
                splashColor: Colors.blueGrey,
                onPressed: checkcode,
                child: Text(
                    "CHECK"
                ),
              ),
            ),*/
          ],
        ),
      ),
      drawer: new Draweronly(),
    );
  }
}

class genuineResult extends StatelessWidget{

  @override
  _launchURL() async {
    const url = 'https://sites.google.com/view/reportcenterscanit/home';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(title: new Text("Results"),),
      body: Center(

        child: ListView(
        children: <Widget>[
         Text("The Product is Genuine",
          textAlign: TextAlign.center,
          style: TextStyle(height: 3, fontSize: 25),
        ),
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              // Stroked text as border.
              Text(
                'Made in India',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 6
                    ..color = Colors.blue[700],
                ),
              ),
              // Solid text as fill.
              Text(
                'Made in India',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.grey[300],
                ),
              ),
            ],
          ),
          /*Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
            child: Text(barcode, textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.green[700],
                  fontWeight: FontWeight.bold
              ),),
          ),*/
          Text("For more information about product:",
            textAlign: TextAlign.center,
            style: TextStyle(height: 3, fontSize: 20),
          ),
          Container(
              padding: const EdgeInsets.only(left: 115.0,right: 115.0),
              height: 30.0,
              child :RaisedButton(
                color: Colors.purple,
                textColor: Colors.white,
                splashColor: Colors.blueGrey,
                onPressed: _launchURL,
                child: Text(
                    "CLICK HERE!!"
                ),
              ),
          ),/*RaisedButton(
                color: Colors.purple,
                textColor: Colors.white,
                splashColor: Colors.blueGrey,
                onPressed: _launchURL,
                child: Text(
                    "CLICK HERE!!"
                ),
              ),*/
          Container(
              margin: const EdgeInsets.fromLTRB(20, 100, 20, 2),
              child: Image.asset(
                "assets/icon/icon.png",
                width: 120, height: 120, fit: BoxFit.contain,)),
          Text(
            "Verified By : ScanIT",
            textAlign: TextAlign.center,
            style: TextStyle(height:2, fontSize: 15),
          ),
      ]
      )
      )
    );
  }
}

class fakeResult extends StatelessWidget{
  @override
  launchURL() async {
    const url = 'https://sites.google.com/view/reportcenterscanit/home';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(title: new Text("Results"),),
      body: Center(
        child: ListView(
            children: <Widget>[
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  // Stroked text as border.
                  Text(
                    '\n\n\nSORRY!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 3
                        ..color = Colors.red[700],
                    ),
                  ),
                  // Solid text as fill.
                  Text(
                    '\n\n\nSORRY!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.yellowAccent[300],
                    ),
                  ),
                ],
              ),
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  // Stroked text as border.
                  Text(
                    '\nThe Product is not Genuine :(',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 3
                        ..color = Colors.red[700],
                    ),
                  ),
                  // Solid text as fill.
                  Text(
                    '\nThe Product is not Genuine :(',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.yellowAccent[300],
                    ),
                  ),
                ],
              ),
              Text(
                  "\n  What can you do?",
                textAlign: TextAlign.left,
                style: TextStyle(height:2, fontSize: 20),
              ),
              Text("\n  1) Check if you entered right Barcode.",
                textAlign: TextAlign.left,
                style: TextStyle(height:1, fontSize: 15),
              ),
              Text("\n  2) Click on the below button to REPORT the product:\n\n",
                textAlign: TextAlign.left,
                style: TextStyle(height:1, fontSize: 15),
              ),
              Container(
                padding: const EdgeInsets.only(left: 125.0,right: 125.0),
                height: 30.0,
                child :RaisedButton(
                  color: Colors.purple,
                  textColor: Colors.white,
                  splashColor: Colors.blueGrey,
                  onPressed: launchURL,
                  child: Text(
                      "REPORT"
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.fromLTRB(20, 100, 20, 2),
                  child: Image.asset(
                    "assets/icon/icon.png",
                    width: 120, height: 120, fit: BoxFit.contain,)),
              Text(
                "Verified By : ScanIT",
                textAlign: TextAlign.center,
                style: TextStyle(height:2, fontSize: 15),
              ),
            ]
        ),
      )
    );
  }

}
