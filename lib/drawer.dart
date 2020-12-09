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
            leading: Icon(Icons.analytics_rounded), title: Text("Report Product"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, new MaterialPageRoute(builder: (ctxt) => new report()));
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
class privacyPolicy extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Privacy Policy"),),
      body: new Text("Here will be Instructions to use"),
    );
  }
}
class report extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Report Product"),),
      body: new Text("Here will be Instructions to use"),
    );
  }
}