import 'dart:ffi';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interval_time_picker/interval_time_picker.dart';
import 'package:intl/intl.dart';

class ResarvationAdd extends StatefulWidget {
  ResarvationAdd(this.date);
  String date;
  @override
  State<ResarvationAdd> createState() => _ResarvationAddState();
}

class _ResarvationAddState extends State<ResarvationAdd> {
  void initState() {
    super.initState();
    _loadData();
    _loadData1();
    _loadResarvation();
    selectDate =  DateTime(selectDate.year, selectDate.month, selectDate.day ,0,0);
  }
  var selectDate = DateTime.now();
  var uid = "";
  String infoText = '';
  String text = '';
  String subText = '';
  var limit = 0;
  var Id = "";
  var time = "選択";
  var course = "選択";
  var timeInt = 0;
  var StartInt = 0;
  var price = 0;
  var name = "";
  var item = [];
  var item1 = [];
  var item2 = [];
  var _controller = TextEditingController();
  String email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(widget.date + "(追加)", style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black),),
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
        ),
        body: Container(
            child: Container(
                child: Column(children: <Widget>[
                  Container(child:Row(children: [
                    Container(
                        margin: EdgeInsets.all(5),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
                          Container(
                            child:Text("開始時間:",style: TextStyle(fontWeight: FontWeight.bold),),
                          ),
                          Container(child: TextButton(
                              onPressed: (){
                                showDialog(context: context, builder: (context) =>
                                    AlertDialog(actions: <Widget>[
                                      Column(children: [Container(
                                        height: 200,width: double.infinity,alignment: Alignment.center,
                                        child: Center(
                                            child: CupertinoDatePicker(
                                              minuteInterval: 15,
                                              initialDateTime: selectDate,
                                              mode: CupertinoDatePickerMode.time,
                                              onDateTimeChanged: (dateTime) {
                                                setState(() => selectDate = dateTime);
                                                DateFormat outputFormat = DateFormat('HH:mm');
                                                DateFormat outputFormat1 = DateFormat('HHmm');
                                                time = outputFormat.format(selectDate);
                                                StartInt = int.parse(outputFormat1.format(selectDate));
                                                setState(() {});
                                              },)),),])],));},
                              child:Text(time)))
                        ],)),
                    Container(
                        margin: EdgeInsets.all(5),
                        child: Row(children: [
                          Container(
                            child:Text("メニュー:",style: TextStyle(fontWeight: FontWeight.bold),),
                          ),
                          Container(
                            child: TextButton(
                              child: Text(course),
                              onPressed: (){
                                showDialog(context: context, builder: (context) =>
                                    AlertDialog(
                                      title: Text('メニュー'),
                                      content: Container(
                                        width: 200,
                                        height: 200,
                                        child: ListView.builder(
                                          itemCount: item.length,
                                          itemBuilder: (context, index) {
                                            return GestureDetector(
                                                onTap: () {setState(() {course = item[index]["text"]; price = item[index]["値段"];timeInt = item[index]["時間"];Navigator.pop(context);});},
                                                child: ListTile(
                                                  title: Text(item[index]["text"],style: TextStyle(fontWeight: FontWeight.bold),),
                                                ));},),),
                                      actions: [
                                        TextButton(
                                          onPressed: () => Navigator.pop(context),
                                          child: Text('閉じる'),
                                        )],));},),),],)),
                    Container(
                        margin: EdgeInsets.all(5),
                        child: Row(children: [
                          Container(child:Text("名前:",style: TextStyle(fontWeight: FontWeight.bold),),),
                          Container(child:Text(name,style: TextStyle(fontWeight: FontWeight.bold),),
                          ),
                        ],)),
                  ],)),
                  Container(width: 110,margin: EdgeInsets.only(bottom: 15,left:5,right: 5),child: ElevatedButton(
                    child: const Text('登録'),
                    style: ElevatedButton.styleFrom(primary: Colors.blue, onPrimary: Colors.white,
                      shape: const StadiumBorder(),),
                    onPressed: () {setState((){send();});},
                  ) ,),
                      Container(margin:EdgeInsets.all(10),width:double.infinity,height:50,child: Row(children: [
                        Expanded(child:TextFormField(
                          controller: _controller,
                          decoration: InputDecoration(labelText:"名前検索",icon: Icon(Icons.search_sharp)),
                          onChanged: (String value) {
                            setState(() {email = value;_loadData2();});
                          },),),
                        Container(width:50,height:50,child:IconButton(onPressed: () {_loadData1();},
                            icon:Icon(Icons.remove_circle_outline,color: Colors.blue,)))
                      ],),),
                  Expanded(
                    child: ListView.builder(
                      itemCount: item1.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: () { setState((){name = item1[index]["userName"];uid = item1[index]["uid"];});},
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
                                                child: Text(item1[index]["userName"],
                                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                              ),
                                            ],
                                          )),
                                    ],)),));},),),
                  Container(child:Text(widget.date + "の予約", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),),
                  Expanded(
                    child: ListView.builder(
                      itemCount: item2.length,
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
                                  colors: [Colors.white, Colors.white],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                              ),
                              padding: EdgeInsets.all(16),
                              child: Row(
                                children: [
                                  Container(
                                      child: Text(
                                        item2[index]["開始時間"].toString() + "〜" + item2[index]["終了時間"].toString() + "     " +item2[index]["名前"] + "様",
                                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)),
                                  Container(margin:EdgeInsets.only(left: 10),
                                      child: Text(item2[index]["text"].toString(), style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 20),
                                      )),
                                ],
                              )),
                        );
                      },
                    ),
                  ),
                ]))));
  }
  void _loadResarvation() {
    item2 = [];
    FirebaseFirestore.instance.collection('予約').doc(widget.date).collection("予約").orderBy("開始時間", descending: false).get()
        .then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((doc) {
        setState(() {item2.add(doc);});});});}
  void _loadData()  {
    item = [];
    FirebaseFirestore.instance.collection('メニュー').get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((doc) {
        setState(() {
          item.add(doc);
          ;});});});}
  void _loadData1()  {
    item1 = [];
    FirebaseFirestore.instance.collection('users').get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((doc) {
        setState(() {
          item1.add(doc);
          ;});});});}
  void _loadData2()  {
    item1 = [];
    FirebaseFirestore.instance.collection('users').where("userName", isGreaterThanOrEqualTo: email).get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((doc) {
        setState(() {
          item1.add(doc);
          ;});});});}
  String randomString(int length) {
    const _randomChars =
        "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    const _charsLength = _randomChars.length;
    final rand = new Random();
    final codeUnits = new List.generate(
      length,
          (index) {
        final n = rand.nextInt(_charsLength);
        return _randomChars.codeUnitAt(n);
      },);
    return new String.fromCharCodes(codeUnits);
  }
void send(){
  var sumDate1 = selectDate.add(Duration(minutes: timeInt));
  DateFormat outputFormat1 = DateFormat('Hmm');
  var dateInt = outputFormat1.format(sumDate1);
  var Id = randomString(20);
  FirebaseAuth.instance.authStateChanges().listen((User? user) async {
    await FirebaseFirestore.instance.collection('予約').doc(widget.date).collection("予約").doc(Id).set({
      "text":course,
      "値段":price,
      "開始時間" :StartInt,
      "終了時間" :int.parse(dateInt),
      "時間":timeInt,
      "完了":"",
      "名前":name,
      "uid":uid,
      "Id":Id,
      "createdAt": Timestamp.now(),});});
  FirebaseAuth.instance.authStateChanges().listen((User? user) async {
    await FirebaseFirestore.instance.collection('users').doc(uid).collection("予約").doc(Id).set({
      "text":course,
      "値段":price,
      "開始時間" : StartInt,
      "終了時間" :int.parse(dateInt),
      "時間":timeInt,
      "完了":"",
      "名前":name,
      "uid":uid,
      "Id":Id,
      "日":widget.date,
      "createdAt": Timestamp.now(),});});
 // ;time = "選択";course = "選択";name = "";
}
}

