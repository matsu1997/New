
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResarvationAddP extends StatefulWidget {
  @override
  State<ResarvationAddP> createState() => _ResarvationAddPState();
}
class _ResarvationAddPState extends State<ResarvationAddP> {
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
          title:Text("予約",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black),),
          centerTitle: true,
        ),
        body: Container(
            child: Stack(
                children: <Widget>[
                  new Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        colorFilter: ColorFilter.mode(
                          Colors.white.withOpacity(0.5),
                          BlendMode.dstATop,
                        ),
                        image: AssetImage("images/ベッド.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  new Container(
                      child: Column(children: <Widget>[
                        Expanded(
                          child: Text("いらっしゃいませ"),),
                        Container()
                      ]))]))
    );
  }
}