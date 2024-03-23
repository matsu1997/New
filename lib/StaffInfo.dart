
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class StaffInfo extends StatefulWidget {
  @override
  State<StaffInfo> createState() => _StaffInfoState();
}
class _StaffInfoState extends State<StaffInfo> {
  // This widget is the root of your application.
  @override
  @override
  bool aka = true;
  var co = 0;
  var colorbid = 0.01;
  var color = Colors.red;
  var item = [];
  var uid = "";
  void initState() {
    super.initState();
   _loadData();
  }
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("スタッフ紹介",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black),),
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
          actions: <Widget>[],),
        body: GridView.count(
            padding: EdgeInsets.all(20.0),
            crossAxisCount: 1,
            crossAxisSpacing: 5.0, // 縦
            mainAxisSpacing: 10.0, // 横
            childAspectRatio: 0.8, // 高さ
            shrinkWrap: true,
            children: List.generate(item.length, (index) {
              return GestureDetector(
                  onTap: () { },
                  child:Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          new BoxShadow(
                            color: Colors.grey,
                            offset: new Offset(5.0, 5.0),
                            blurRadius: 10.0,
                          )
                        ],
                      ),
                      child: Column(children: <Widget>[
                        Expanded(
                            child:Container(
                                // height: 100,
                                // width: 100,
                                margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: NetworkImage(item[index]["ImgId"]),
                                    fit: BoxFit.fill,
                                  ),
                                )),) ,
                        Container(
                          margin: EdgeInsets.only(top:10,bottom: 10.0),
                          child: FittedBox(fit: BoxFit.fitWidth,
                              child:Text(item[index]["名前"],style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 30),)
                          ),),
                        Container(margin: EdgeInsets.all(20.0),
                              child:Text(item[index]["コメント"],style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 20),)
                        ),
                      ])));}))
    );
  }
  void _loadData()  {
    item = [];
    FirebaseFirestore.instance.collection('スタッフ').get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((doc) {
        setState(() {
          item.add(doc);;});});
    });
  }

}