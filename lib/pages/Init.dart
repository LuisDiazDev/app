import 'package:app/utils/status.dart';
import 'package:flutter/material.dart';

import 'drawer/custom_drawer.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(page: pages.agencia,),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        //TODO
      ),
    );
  }
}