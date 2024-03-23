
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColumV2 extends StatefulWidget {
  ColumV2(this.Id);
  String Id;
  @override
  State<ColumV2> createState() => _ColumV2State();
}
class _ColumV2State extends State<ColumV2> {
  var title = "";
  var text = "";
  var date = "";
  var imageId = "";
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
          title:Text("コラム",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black),),
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
              Container(margin:EdgeInsets.all(20),width: double.infinity,child: Text(title,style: TextStyle(fontSize:20,fontWeight: FontWeight.bold )),),
              Container(margin:EdgeInsets.only(left:20),width: double.infinity,child: Text(date,style: TextStyle(fontSize:15,fontWeight: FontWeight.bold, color: Colors.grey),),),
              SingleChildScrollView(child:Column(children: <Widget>[Container(margin:EdgeInsets.all(20),width: double.infinity,child: Text(text,style: TextStyle(height: 2,fontSize:15,fontWeight: FontWeight.bold),),),
                Container(child: Image(image:NetworkImage(imageId),),)])),
            ]))
    );
  }
  void _loadData()  {
    print(widget.Id); print("widget.Id");
    FirebaseFirestore.instance.collection('コラム').where("Id", isEqualTo: widget.Id).get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((doc) {
        setState(() {
          title = doc["title"];
          text = doc["text"];
          date = doc["date"];
          imageId = doc["ImageId"];
          ;});});});}
}