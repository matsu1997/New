import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Acount extends StatefulWidget {
  @override
  State<Acount> createState() => _AcountState();
}

class _AcountState extends State<Acount> {
  var item = [];
  String infoText = '';
  String email = '';
  String password = '';
  var uid = "";
  var name = "";
  var _controller = TextEditingController();
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
          title: Text("顧客情報", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: Container(
            child: Column(children: <Widget>[
              Container(margin:EdgeInsets.all(10),width:double.infinity,height:50,child: Row(children: [
                Expanded(child:TextFormField(
                  controller: _controller,
                  decoration: InputDecoration(labelText:"名前検索",icon: Icon(Icons.search_sharp)),
                  onChanged: (String value) {
                    setState(() {email = value;_loadData1();});
                  },),),
                Container(width:50,height:50,child:IconButton(onPressed: () {_loadData();},
                    icon:Icon(Icons.remove_circle_outline,color: Colors.blue,)))
              ],),),
              Expanded(
                child: ListView.builder(
                  itemCount: item.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () { Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => AcountDetail(item[index]["uid"],item[index]["userName"])),).then((value) {_loadData();});},
                    child: Card(
                      shadowColor: Colors.grey[100],
                      elevation: 8,
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Container(
                          padding: EdgeInsets.all(5),
                          child: Row(
                            children: [
                              Container(
                                  height: 50,
                                  width: 50,
                                  margin:
                                  EdgeInsets.only(top: 5,bottom: 5, left: 10, right: 5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: AssetImage("images/ベッド.jpg"),
                                      fit: BoxFit.fill,
                                    ),
                                  )),
                              Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left: 10, right: 10),
                                        child: Text(item[index]["userName"],
                                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                      ),
                                    ],
                                  )),],)),));},),),])));}
  void _loadData()  {
    item = [];
    FirebaseFirestore.instance.collection('users').get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((doc) {
        setState(() {
          item.add(doc);
          ;});});});}
  void _loadData1()  {
    item = [];
    FirebaseFirestore.instance.collection('users').where("userName", isGreaterThanOrEqualTo: email).get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((doc) {
        setState(() {
          item.add(doc);
          ;});});});}
}


class AcountDetail extends StatefulWidget {
  @override
  AcountDetail(this.Id,this.name);
  String Id;
  String name;
  State<AcountDetail> createState() => _AcountDetailState();
}
class _AcountDetailState extends State<AcountDetail> {
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title:Text(widget.name + "様",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black),),
            iconTheme: IconThemeData(color: Colors.black),
            centerTitle: true,
            actions: <Widget>[],
            bottom: const TabBar(
              tabs: [
                Tab(child: Text("顧客情報",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),),
                Tab(child: Text("来院履歴",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),),
                ],),),
          body: TabBarView(
            children: [
              AcountDetailV1(widget.Id),
              AcountDetailV2(widget.Id),
            ],),),),);}
}

class AcountDetailV1 extends StatefulWidget {
  @override
  AcountDetailV1(this.Id);
  String Id ;
  State<AcountDetailV1> createState() => _AcountDetailV1State();
}
class _AcountDetailV1State extends State<AcountDetailV1> {
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
        body: Container(child: SingleChildScrollView(
            child: Column(children: <Widget>[
              Container(
                margin: EdgeInsets.only(top:20,bottom: 20),
                child: ElevatedButton(
                  child: const Text('メッセージ'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    onPrimary: Colors.white,
                    shape: const StadiumBorder(),),
                  onPressed: () { Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) =>
                            AcountDetailV3(widget.Id)),);},
                ),),
            Container(child: Row(children: [Text("名前:",style:TextStyle(color:Colors.grey,fontWeight: FontWeight.bold),),Text("山田花子(やまだはなこ)")],)),
              Container(child: Row(children: [Text("住所:"),Text("神奈川県秦野市")],)),
              Container(child: Row(children: [Text("初診日"),Text("2022/08/12")],)),
              Container(child: Row(children: [Text("電話番号"),Text("000-0000-0000")],)),
              Container(child: Row(children: [Text("生年月日"),Text("0000年00月00日")],)),
              Container(child: Row(children: [Text("身長"),Text("170cm")],)),
              Container(child: Row(children: [Text("体重"),Text("60kg")],)),
              Container(child: Row(children: [Text("既往歴"),Text("骨折")],)),
              Container(child: Row(children: [Text("職業"),Text("会社員")],)),
              Container(child: Row(children: [Text("その他情報"),Text("お菓子好き")],)),
    ]))));
  }
}

class AcountDetailV2 extends StatefulWidget {
  @override
  AcountDetailV2(this.Id);
  String Id ;
  State<AcountDetailV2> createState() => _AcountDetailV2State();
}
class _AcountDetailV2State extends State<AcountDetailV2> {
  var item = [];
  var uid = "";
  @override
  void initState() {
    super.initState();
    _loadData();
}
  Widget build(BuildContext context) {
    return Scaffold(
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
                          children: [Row(
                            children: [Expanded(
                              child: Text(item[index]["text"],style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,color:Colors.black),textAlign: TextAlign.center,),),
                              Container(width:10,margin: EdgeInsets.only(right: 5),child: Text(item[index]["完了"],style: TextStyle(fontWeight: FontWeight.bold,color:Colors.red),textAlign: TextAlign.center,),)],),
                            Container(width: double.infinity,margin: EdgeInsets.only(right: 15),child: Text(item[index]["日"].toString()+"日" +item[index]["開始時間"].toString()+ "~"+item[index]["開始時間"].toString(),style: TextStyle(fontWeight: FontWeight.bold,color:Colors.grey),textAlign: TextAlign.center,),)],),),
                    );},),),
              Container()
            ])));
  }
  void _loadData()  {
    item = [];
    FirebaseFirestore.instance.collection('users').doc(widget.Id).collection("予約").orderBy('createdAt', descending: true).get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((doc) {
        setState(() {
          item.add(doc);
          ;});});});}
}

class AcountDetailV3 extends StatefulWidget {
  AcountDetailV3(this.uid);
  String uid;
  @override
  State<AcountDetailV3> createState() => _AcountDetailV3State();
}
class _AcountDetailV3State extends State<AcountDetailV3> {
  var _controller = TextEditingController();
  var uid = "";
  var text = "";
  var item = [];
  var date = DateTime.now();
  @override
  void initState() {
    super.initState();
    update ();
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
          title:Text("メッセージ",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black),),
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
          actions: [Icon(Icons.upgrade)],
        ),
        body:GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child:  Container(
                color: Colors.blue[100],
                child: Column(children: <Widget>[
                  Expanded(
                      child: Container(margin: EdgeInsets.only(top: 10,bottom: 20,left: 10,right: 10),
                        child:ListView.builder(
                          itemCount: item.length,
                          itemBuilder: (context, index) {
                            return Card(
                              // shadowColor: Colors.grey[100],
                                elevation: 8,
                                clipBehavior: Clip.antiAlias,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Container(margin: EdgeInsets.all(10),child:
                                Row(children: [Column(children: [Container(
                                  margin: EdgeInsets.only(top:5,bottom: 5,left: 5,right: 10),
                                  child: Icon(Icons.account_circle_rounded,color:Color(item[index]["Color"])),), Container(child: Text(item[index]["人"],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10,color: Colors.grey[500]),))]),
                                  Expanded(child: Text(item[index]["text"],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15, letterSpacing:2,height:1.3),),)],),));},),)),
                  Container(color: Colors.white,alignment: Alignment.bottomCenter,width:double.infinity,height:60,child: Row(children: [
                    Expanded(child:Container(margin: EdgeInsets.only(bottom: 5,left: 5),
                      child:TextFormField(
                        controller: _controller,
                        decoration: InputDecoration(labelText:"message"),
                        onChanged: (String value) {
                          setState(() {text = value;});
                        },),)),
                    Container(width:50,height:50,child:IconButton(onPressed: () {send();},
                        //   child: Text("cdsd"))),
                        icon:Icon(Icons.send,color: Colors.blue,)))
                  ],),),
                ]))));
  }
  void _loadData()  {
    item = [];
    FirebaseFirestore.instance.collection('users').doc(widget.uid).collection("メッセージ").orderBy('createdAt', descending: true).get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((doc) {
        setState(() {
          item.add(doc);
          ;});});});}
  void send() {
    DateFormat outputFormat = DateFormat('MM月dd日HH時m分');
     var day = outputFormat.format(date);
    print(text);
    if (text != ""){
      FirebaseFirestore.instance.collection('users').doc(widget.uid).collection("メッセージ").doc().set({
        "Color":int.parse("0xFFFFAB40"),
        "人":"スタッフ",
        "text":text,
        "date":day,
        "createdAt": Timestamp.now(),});
      FirebaseFirestore.instance.collection('メッセージ').doc(widget.uid).update({
        "date":day,
        "createdAt": Timestamp.now(),});
      _loadData();FocusScope.of(context).unfocus();_controller.clear();
    }}
  void update (){
    FirebaseFirestore.instance.collection('メッセージ').doc(widget.uid).update({
      "既読":int.parse("0xFFffffff"),});}
}



class AcountDetailV2Show extends StatefulWidget {
  AcountDetailV2Show(this.uid,this.Id);
  String uid;
  String Id;
  @override
  State<AcountDetailV2Show> createState() => _AcountDetailV2ShowState();
}
class _AcountDetailV2ShowState extends State<AcountDetailV2Show> {
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
          title:Text("施術録",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black),),
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
    FirebaseFirestore.instance.collection('user').doc(widget.uid).collection("来院").where("Id", isEqualTo: widget.Id).get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((doc) {
        setState(() {
          title = doc["title"];
          text = doc["text"];
          date = doc["date"];
          imageId = doc["ImageId"];
          ;});});});}
}

class AcountDetailV2Edite extends StatefulWidget {
  AcountDetailV2Edite(this.uid,this.Id);
  String uid;
  String Id;
  @override
  State<AcountDetailV2Edite> createState() => _AcountDetailV2EditeState();
}
class _AcountDetailV2EditeState extends State<AcountDetailV2Edite> {
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
          title:Text("施術録",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black),),
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
    FirebaseFirestore.instance.collection('user').doc(widget.uid).collection("来院").where("Id", isEqualTo: widget.Id).get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((doc) {
        setState(() {
          title = doc["title"];
          text = doc["text"];
          date = doc["date"];
          imageId = doc["ImageId"];
          ;});});});}
}



