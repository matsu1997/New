
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Access extends StatefulWidget {
  @override
  State<Access> createState() => _AccessState();
}
class _AccessState extends State<Access> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("アクセス", style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black),),
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: Column(
            children: <Widget>[]
        )
    );
  }
}