
import 'dart:math';

import 'package:asaminew/V2DateSelect.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class V2 extends StatefulWidget {
  @override
  State<V2> createState() => _V2State();
}
class _V2State extends State<V2> {
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
          title: Text("メニュー", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: Container(
            child: Column(children: <Widget>[
              Expanded(
                child: ListView.builder(
                  itemCount: item.length,
                  itemBuilder: (context, index) {
                    return Card(
                      shadowColor: Colors.grey[100],
                      elevation: 8,
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: Column(
                          children: [Container(
                            margin: EdgeInsets.only(top:10,left: 10,right: 5),
                            alignment: Alignment.center,
                            child: Text(item[index]["text"],style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,color:Colors.black)),),
                            Container(child:
                            Row(children: [Container(
                                height: 100,width: 100,
                                margin: EdgeInsets.only(top: 10,left: 10,right: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: NetworkImage(item[index]["imageId"]),
                                    fit: BoxFit.fill,),)),
                              Expanded(child: Text(item[index]["subText"],style: TextStyle(fontWeight: FontWeight.bold,color:Colors.grey),),)],),),
                            Container(
                              margin: EdgeInsets.all(10),
                              width: double.infinity,
                              child: ElevatedButton(child: Text("予約する"),   onPressed: () {  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => V2DateSelect(item[index]["時間"],item[index]["値段"],item[index]["text"])),);
                              },),)],
                        ),),);},),),
              Container()
            ])));}
  void _loadData()  {
    item = [];
    FirebaseFirestore.instance.collection('メニュー').get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((doc) {
        setState(() {
          item.add(doc);
          ;});});});}
}
