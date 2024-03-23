
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ColumV2.dart';
import 'NewsV2.dart';

class News extends StatefulWidget {
  @override
  State<News> createState() => _NewsState();
}
class _NewsState extends State<News> {
  var item = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title:Text("最新情報",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black),),
          iconTheme: IconThemeData(color: Colors.black),
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
                  new  Container(
                      child: Column(children: <Widget>[
                        Expanded(
                          child: ListView.builder(
                            itemCount: item.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                  onTap: () { Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) => NewsV2(item[index]["Id"])),);},
                                  child:  Card(
                                    shadowColor: Colors.grey[100],
                                    elevation: 8,
                                    clipBehavior: Clip.antiAlias,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    child: Container(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [Colors.white, Colors.white],
                                            //[Colors.redAccent, Colors.red],
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                          ),
                                        ),
                                        padding: EdgeInsets.all(16),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                        margin: EdgeInsets.only(left: 10, right: 10),
                                                        child: Row(children: [
                                                          Expanded(child:Text(item[index]["title"],
                                                            style: TextStyle(
                                                                fontSize: 20,
                                                                fontWeight: FontWeight.bold),
                                                          ), ),
                                                          Container(child:Text(item[index]["date"])),
                                                        ],)
                                                    ),
                                                    Container(
                                                      height: 20,
                                                      margin: EdgeInsets.only(
                                                          top: 10, left: 10, right: 10),
                                                      child: Text(
                                                        item[index]["text"],
                                                        overflow: TextOverflow.ellipsis,
                                                        style: TextStyle(
                                                            color: Colors.grey,
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: 15),
                                                      ),
                                                    ),
                                                  ],
                                                )),],)),));},),),
                        Container()
                      ]))])));}
  void _loadData()  {
    item = [];
    FirebaseFirestore.instance.collection('最新情報').get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((doc) {
        setState(() {
          item.add(doc);
          ;});});});}
}