import 'package:flutter/material.dart';

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
          ListTile(
            leading: Icon(Icons.analytics_rounded), title: Text("Privacy Policy"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, new MaterialPageRoute(builder: (ctxt) => new privacyPolicy()));
            },
          ),
        ],
      ),
    );
  }
}

class contactus extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Contact Us"),),
      body: new Center(
        child: ListView(
          children: <Widget> [
            Text(
                "\nEmail us at:",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
            Text(
              "\n     contactus@scanit.com",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            )
          ],
        ),
      )
    );
  }
}
class howToUse extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("How to Use"),),
      body: new Center(
        child: ListView(
          children: <Widget>[
            Text(
              "Instructions\n",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              "Just scan the code and the results will be displayed.",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.justify,
            )
          ],
        ),
      )
    );
  }
}
class privacyPolicy extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Privacy Policy"),),
      body: new Center(
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(10,20,10,20),
              child: Text(
              "The information provided in the application is for demo purpose only. All information provided by the application should only be viewed as the information for the enlightenment of the very idea about how we want the application to work.",
              style: TextStyle(
                fontSize: 15,
              ),
              textAlign: TextAlign.justify,
            ),
            ),
            Stack(
              alignment: Alignment.bottomCenter,
            children:<Widget> [
              Text(
                "All Rights Reserved, TEAM ScanIT",
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
            ],
            )
          ]
        )
      )
    );
  }
}