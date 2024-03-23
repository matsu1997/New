
import 'dart:math';

import 'package:asaminew/colum.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'SignUp.dart';

class Ticket extends StatefulWidget {
  @override
  State<Ticket> createState() => _TicketState();
}
class _TicketState extends State<Ticket> {
  var uid = "";
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
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title:Text("チケット",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black),),
            iconTheme: IconThemeData(color: Colors.black),
            centerTitle: true,
            actions: <Widget>[],
            bottom: const TabBar(
              tabs: [Tab(child: Text("現在の保有チケット",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),),
                Tab(child: Text("ギフト券",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),),],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.bookmark_add),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => TicketAdd()),).then((value) {}
              );},),
          body: TabBarView(
            children: [Ticket1(),Ticket2()],
          ),),),);}
}

class Ticket1 extends StatefulWidget {
  @override
  State<Ticket1> createState() => _Ticket1State();
}
class _Ticket1State extends State<Ticket1> {
  var item = [];
  String email = '';
  var uid = "";
  var _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
   aa();
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
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
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors:[Colors.white,Colors.white ],//[Colors.redAccent, Colors.red],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                              ),
                              padding: EdgeInsets.all(16),
                              child:Row(
                                children: [
                                  Container(
                                      height: 100,width: 100,
                                      margin: EdgeInsets.only(top: 10,left: 10,right: 10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          image: NetworkImage(item[index]["imageId"]),
                                          fit: BoxFit.fill,),)
                                  ),
                                  Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only( left: 10, right: 10),
                                            child: Text(item[index]["text"],
                                              style: TextStyle(fontSize:20,fontWeight: FontWeight.bold),),),
                                          Container(
                                            margin: EdgeInsets.only( top: 10,left: 10, right: 10),
                                            child: Text(item[index]["subText"], style: TextStyle(color: Colors.grey,
                                                fontWeight: FontWeight.bold,fontSize: 15),),),
                                          Container(
                                            margin: EdgeInsets.only(top:10,left: 10,right:10),
                                            width: double.infinity,
                                            child: ElevatedButton(child: Text("使う"), onPressed: () {
                                              showDialog(context: context, builder: (context) =>
                                                    AlertDialog(
                                                      title: Text("スタッフに提示してください",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,),),
                                                      actions: <Widget>[
                                                        Column(children: [
                                                          Container(
                                                              decoration: BoxDecoration(
                                                                border: Border.all(color: Colors.grey),
                                                                borderRadius: BorderRadius.circular(10),
                                                                color: Colors.white,),
                                                              padding: EdgeInsets.all(5),
                                                              child:Row(
                                                                children: [
                                                                  Container(
                                                                      height: 60,width: 60,
                                                                      margin: EdgeInsets.only(top: 10,left: 10,right: 10),
                                                                      decoration: BoxDecoration(
                                                                        border: Border.all(color: Colors.grey),
                                                                        borderRadius: BorderRadius.circular(10),
                                                                        image: DecorationImage(
                                                                          image: NetworkImage(item[index]["imageId"]),
                                                                          fit: BoxFit.fill,),)),
                                                                  Expanded(
                                                                    child: Column(
                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                      children: [
                                                                        Container(
                                                                          margin: EdgeInsets.only( left: 10, right: 10),
                                                                          child: Text(item[index]["text"],
                                                                            style: TextStyle(fontSize:20,fontWeight: FontWeight.bold),),),
                                                                        Container(
                                                                          margin: EdgeInsets.only( top: 10,left: 10, right: 10),
                                                                          child: Text(item[index]["subText"], style: TextStyle(color: Colors.grey,
                                                                              fontWeight: FontWeight.bold,fontSize: 15),),),
                                                                      ],),),],)),
                                                          Container(
                                                            margin: EdgeInsets.only(top:5,bottom: 5),
                                                            child: TextFormField(
                                                              controller: _controller,
                                                              decoration: InputDecoration(labelText: 'パスワード'),
                                                              onChanged: (String value) {
                                                                setState(() {
                                                                  email = value;
                                                                });},),),
                                                          Container(child:Text("使用後は削除されます",style: TextStyle(fontSize:10,color: Colors.red),)),
                                                          Container(
                                                            margin: EdgeInsets.only(top:20,bottom: 20),
                                                            child: ElevatedButton(
                                                              child: Text('使用',style: TextStyle(fontWeight: FontWeight.bold),),
                                                              onPressed: () {
                                                                FirebaseAuth.instance.authStateChanges().listen((User? user) async {
                                                                await FirebaseFirestore.instance.collection('users').doc(uid).collection("チケット").doc(item[index]["Id"]).delete();_loadData();});Navigator.pop(context);},),),
                                                          Container(width: 110,margin: EdgeInsets.only(bottom: 5,left:5,right: 5),child: ElevatedButton(
                                                            child: const Text('キャンセル'),
                                                            style: ElevatedButton.styleFrom(primary: Colors.blue, onPrimary: Colors.white,
                                                              shape: const StadiumBorder(),),
                                                            onPressed: () { Navigator.pop(context);},
                                                          ) ,)
                                                        ],)
                                                      ],));
                                            },),)
                                        ],)
                                  ),],)
                          ),
                        );},),),
                  Container()
                ]))),),);}
  void aa (){
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        Future(() {Navigator.push(context, MaterialPageRoute(builder: (context) {return SignUp();}));});} else {
        uid = user.uid;_loadData();}});}
  void _loadData()  {
    item = [];
    FirebaseFirestore.instance.collection('users').doc(uid).collection("チケット").get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((doc) {
        setState(() {
          item.add(doc);;});});});
    setState(() {});
  }
}

class Ticket2 extends StatefulWidget {
  @override
  State<Ticket2> createState() => _Ticket2State();
}
class _Ticket2State extends State<Ticket2> {
  var item = [];
  String email = '';
  var uid = "";
  var _controller = TextEditingController();
  @override
  void initState() {
    super.initState();aa();
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
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
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors:[Colors.white,Colors.white ],//[Colors.redAccent, Colors.red],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                            padding: EdgeInsets.all(16),
                            child:Row(
                              children: [
                                Container(
                                    height: 100,width: 100,
                                    margin: EdgeInsets.only(top: 10,left: 10,right: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        image: NetworkImage(item[index]["imageId"]),
                                        fit: BoxFit.fill,),)
                                ),
                                Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only( left: 10, right: 10),
                                          child: Text(item[index]["text"],
                                            style: TextStyle(fontSize:20,fontWeight: FontWeight.bold),),),
                                        Container(
                                          margin: EdgeInsets.only( top: 10,left: 10, right: 10),
                                          child: Text(item[index]["subText"], style: TextStyle(color: Colors.grey,
                                              fontWeight: FontWeight.bold,fontSize: 15),),),
                                        Container(
                                          margin: EdgeInsets.only(top:10,left: 10,right:10),
                                          width: double.infinity,
                                          child: ElevatedButton(child: Text("送る"), onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    AlertDialog(
                                                      title: Text("お渡しする方にお伝えください",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,),),
                                                      actions: <Widget>[
                                                        Column(children: [
                                                          Container(child: Text("ギフトID",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),),
                                                          Container(child: Text(item[index]["Id"],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),),
                                                          Container(margin: EdgeInsets.only(top:10) ,child: Text("パスワード",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),),
                                                          Container(child: Text(item[index]["pass"],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),),
                                                          Container(margin: EdgeInsets.only(top:10) ,width: double.infinity,height: 60,
                                                            child:OutlinedButton.icon(icon: Icon(Icons.copy),
                                                              label: Text('コピー', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                                              onPressed: () {Clipboard.setData(ClipboardData(text: "ギフトID: "+ item[index]["Id"]  + "\n" + "パスワード: " + item[index]["pass"])); },),),
                                                        ],)
                                                      ],));

                                          },),)
                                      ],)
                                ),],)
                        ),
                      );},),),
                Container()
              ])),),),);}
  void aa (){
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        Future(() {Navigator.push(context, MaterialPageRoute(builder: (context) {return SignUp();}));});} else {
        uid = user.uid;_loadData();}});}
  void _loadData()  {
    item = [];
    FirebaseFirestore.instance.collection('users').doc(uid).collection("ギフト").get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((doc) {
        setState(() {
          item.add(doc);;});});});
    setState(() {});
  }
}


class TicketAdd extends StatefulWidget {
  @override
  _TicketAddState createState() => _TicketAddState();
}

class _TicketAddState extends State<TicketAdd> {

  String id = '';
  String password = '';
  var uid = "";
  var name = "";
  var item = [];
  var search = false;
  var no = false;
  var SearchId = "";
  var SearchUid = "";
  var SearchText = "";
  var SearchSubText = "";
  var SearchImageId = "";
  var SearchPass = "";
  var _IdCon = TextEditingController();
  var _passCon = TextEditingController();
  void initState() {
    super.initState();
    inputData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("ギフトを受け取る",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black),),
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: _IdCon,
                decoration: InputDecoration(labelText: 'ギフトID'),
                onChanged: (String value) {
                  setState(() {
                    id = value;
                  });},),
              TextFormField(
                controller: _passCon,
                decoration: InputDecoration(labelText: 'パスワード'),
                onChanged: (String value) {
                  setState(() {
                   password = value;
                  });},),
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 10),
                width: double.infinity,
                child: ElevatedButton(
                  child: Text('検索'),
                  onPressed: ()  {
                    Search();
                  },
                ),
              ),
              Container(
                child: Visibility(
                  visible: no,
                  child: Container(
                    child: Text("検索の結果見つかりませんでした。"),
                  ),),),
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 10),
                child: Visibility(
                  visible: search,
                  child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.white, Colors.white],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Container(height: 70, width: 70, margin: EdgeInsets.only(top: 5, left: 10, right: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: NetworkImage(SearchImageId),
                                  fit: BoxFit.fill,
                                ),
                              )),
                          Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 10, right: 10),
                                    child: Text(SearchText, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 5, left: 10, right: 10),
                                    child: Text(SearchSubText, style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 10),),
                                  ),
                                ],
                              )),],)),),),
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 10),
                child: Visibility(
                  visible: search,
                  child: ElevatedButton(
                    child: Text('追加'),
                    onPressed: ()  {
                      Clipboard.setData(ClipboardData(text: uid));
                      Add();},),),),
              Container(
                child: Visibility(
                  visible: no,
                  child: Container(
                    child: Text("パスワードが間違っています",style: TextStyle(color: Colors.red),),
                  ),),),
            ],
          ),
        ),
      ),
    );
  }
  void Search(){
    item = [];
    FirebaseFirestore.instance.collection('ギフトAll').where('Id', isEqualTo: id).get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((doc) {
          item.add(doc);
          SearchId = doc["Id"];
          SearchUid = doc["uid"];
          SearchText = doc["text"];
          SearchSubText = doc["subText"];
          SearchImageId = doc["imageId"];
          SearchPass = doc["pass"];
          print(SearchText);print(SearchPass); print(password);
      // if (password == SearchPass){setState(() {search = true;no = false; ;});}
      });});
    setState(() {
   //   print(SearchText);print(SearchPass); print(password);
      if (SearchText != "" && password == SearchPass){
        search = true;no = false;
      }else{no = true; search = false;}});
      FocusScope.of(context).unfocus();
  }

  Future<String> inputData() async {
    final  user = await FirebaseAuth.instance.currentUser!;
    String id = user.uid.toString();
    uid = id;
    setState(() {});
    return id;
  }
  Future<void> Add() async {
    //showProgressDialog();
    no = true; search = false;
    FirebaseFirestore.instance.collection('users').doc(uid).collection("チケット").doc(SearchId).set({
      "text": SearchText,
      "subText": SearchSubText,
      "有効期限": 1095,
      "imageId": SearchImageId,
      "Id": SearchId,
      "createdAt": Timestamp.now(),
      });
      FirebaseFirestore.instance.collection('ギフトAll').doc(SearchId).delete();
      FirebaseFirestore.instance.collection('users').doc(SearchUid).collection("ギフト").doc(SearchId).delete();
      _passCon.clear();
      _IdCon.clear();_passCon.clear();
      // FocusScope.of(context).unfocus();
      // Navigator.of(context).pop();
    // }
  }
  String randomString(int length) {
    const _randomChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    const _charsLength = _randomChars.length;
    final rand = new Random();
    final codeUnits = new List.generate(
      length,
          (index) {
        final n = rand.nextInt(_charsLength);
        return _randomChars.codeUnitAt(n);
      },
    );
    return new String.fromCharCodes(codeUnits);
  }
}

