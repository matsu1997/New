import 'dart:ffi';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'dart:io' as io;


class EditeGift extends StatefulWidget {
  @override
  State<EditeGift> createState() => _EditeGiftState();
}

class _EditeGiftState extends State<EditeGift> {
  var item = [];
  var Id = "";
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
          title: Text("ギフト編集", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
          actions: <Widget>[
            IconButton(
                onPressed: () {  Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => EditeGiftAdd()),).then((value) {_loadData();});},
                icon:Icon(Icons.add))
          ],
        ),
        body: Container(
            child: Column(children: <Widget>[
              Expanded(
                child: ListView.builder(
                  itemCount: item.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          showDialog(context: context, builder: (context) =>
                              AlertDialog(
                                title: Text("投稿を削除しますか？",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,),),
                                actions: <Widget>[
                                  Column(children: [
                                    Container(
                                      margin: EdgeInsets.all(10),width: double.infinity,
                                      child: ElevatedButton(
                                        child: Text('削除',style: TextStyle(fontWeight: FontWeight.bold),),
                                        onPressed: () {Id = item[index]["Id"];delete();},),)],)
                                ],));
                        },child:Card(
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
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Container(
                                  height: 70,
                                  width: 70,
                                  margin:
                                  EdgeInsets.only(top: 5, left: 10, right: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: NetworkImage(item[index]["imageId"]),
                                      fit: BoxFit.fill,
                                    ),
                                  )),
                              Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left: 10, right: 10),
                                        child: Text(
                                          item[index]["text"],
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 5, left: 10, right: 10),
                                        child: Text(
                                          item[index]["subText"],
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.all(5),
                                        width: double.infinity,height: 30,
                                        child: ElevatedButton(child: Text("送る"), onPressed: () {Navigator.of(context).push(
                                          MaterialPageRoute(builder: (context) => EditeGiftV2(item[index]["text"],item[index]["subText"],item[index]["imageId"],item[index]["有効期限"],item[index]["Id"],)),).then((value) {_loadData();});},),)
                                    ],
                                  )),],)),));},),),
              Container()
            ])));
  }
  void _loadData()  {
    item = [];
    FirebaseFirestore.instance.collection('ギフト').get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((doc) {
        setState(() {
          item.add(doc);
          ;});});});}
  void delete (){
    setState(() {
      FirebaseFirestore.instance.collection("ギフト").doc(Id).delete();
      _loadData();});Navigator.of(context).pop();}
}


class EditeGiftAdd extends StatefulWidget {
  @override
  _EditeGiftAddState createState() => _EditeGiftAddState();
}

class _EditeGiftAddState extends State<EditeGiftAdd> {


  void initState() {
    super.initState();
    DateFormat outputFormat = DateFormat('MM/dd');
    date = outputFormat.format(today);
  }
  var today = DateTime.now();
  var date = "";
  var uid = "";
  String infoText = '';
  String text = '';
  String subText = '';
  var limit = 0;
  var Id = "";
  File? get nil => null;
  String imgPathUse="";
  File? _image;
  var textCon = TextEditingController();
  var subTextCon = TextEditingController();
  var limitCon = TextEditingController();
  String email = '';
  final imagePicker = ImagePicker();


  Future getImageFromCamera() async {
    final pickedFile = await imagePicker.getImage(source: ImageSource.camera);
    setState(() {if (pickedFile != null) {_image = File(pickedFile.path);}});}
  PickedFile? pickedFile;
  Future getImageFromGarally() async {
    pickedFile = await imagePicker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {_image = File(pickedFile!.path);}});
  }
  Future<void> uploadFile(String sourcePath, String uploadFileName) async {
    showProgressDialog();
    final FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child("images"); //保存するフォルダ
    io.File file = io.File(sourcePath);
    UploadTask task = ref.child(uploadFileName).putFile(file);
    try {
      var snapshot = await task;
    } catch (FirebaseException) {}
    //addFilePath(uid, pickedFile!.path);
    getImgs(Id);
    // addFilePath(widget.uid, pickedFile!.path);
    // Navigator.of(context).pop();
  }

  Future<void> addFilePath(String userId, String localPath) async {
    FirebaseFirestore.instance.collection('ギフト').doc(Id).set({
      "text": text,
      "subText":subText,
      "有効期限":limit,
      'imageId': imgPathUse,
      "Id":Id,
    }, SetOptions(merge: true));
    textCon.clear();
    subTextCon.clear();
    limitCon.clear();
    _image = nil;
    imgPathUse = "";
    Navigator.of(context, rootNavigator: true).pop();
    setState(() {});
  }
  void getImgs(String imgPathRemote) async{
    if ((imgPathRemote != "") && (imgPathRemote != null)) {
      try {
        imgPathUse = await FirebaseStorage.instance.ref().
        child("images").child(imgPathRemote).getDownloadURL();
        addFilePath(Id, pickedFile!.path);
      }
      catch (FirebaseException) {}} else{}}
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
    return new String.fromCharCodes(codeUnits);}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("追加",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black),),
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Container(
                child: Column(children: <Widget>[
                  Container(
                    height: 200,
                    child: Container(
                        alignment: Alignment.center,
                        child: _image == null ?
                        Text(
                          '写真は１枚のみです',
                          // style: Theme.of(context).textTheme.headline4,
                        )
                            : Image.file(_image!)),),
                  Container(
                      margin: EdgeInsets.only(top:20,bottom: 20),
                      child:
                      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                        FloatingActionButton(
                            onPressed: getImageFromCamera, child: Icon(Icons.photo_camera)),
                        FloatingActionButton(
                            onPressed: getImageFromGarally, child: Icon(Icons.photo_album))
                      ])),
                  Container(
                    margin: EdgeInsets.all(10),
                    child:TextFormField(
                      controller: textCon,
                      decoration: InputDecoration(labelText:"ギフト名"),
                      onChanged: (String value) {
                        setState(() {text = value;});
                      },),) ,
                  Container(
                    margin: EdgeInsets.all(10),
                    child:TextFormField(
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      controller: subTextCon,
                      decoration: InputDecoration(labelText:"説明"),
                      onChanged: (String value1) {
                        setState(() {subText = value1;});
                      },),),
                  Container(
                    margin: EdgeInsets.all(10),
                    child:TextFormField(
                      keyboardType: TextInputType.number,
                      maxLines: null,
                      controller: limitCon,
                      decoration: InputDecoration(labelText:"有効日数"),
                      onChanged: (String value2) {
                        setState(() {limit = int.parse(value2); });
                      },),),
                  Container(
                    margin: EdgeInsets.only(top:20,bottom: 20),
                    child: ElevatedButton(
                      child: Text('追加',style: TextStyle(fontWeight: FontWeight.bold),),
                      onPressed: ()  {
                        Id = randomString(20);
                        uploadFile(pickedFile!.path,Id);
                        // setState(() { FocusScope.of(context).unfocus(); });
                      },
                    ),)
                ]))));
  }
  void showProgressDialog() {
    showGeneralDialog(
        context: context,
        barrierDismissible: false,
        transitionDuration: Duration(milliseconds: 300),
        barrierColor: Colors.black.withOpacity(0.5),
        pageBuilder: (BuildContext context, Animation animation, Animation secondaryAnimation) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });}
}




class EditeGiftV2 extends StatefulWidget {
  EditeGiftV2(this.text,this.subText,this.imageId,this.limit,this.Id);
  String text;
  String subText;
  String Id;
  int limit;
  String imageId;
  @override
  State<EditeGiftV2> createState() => _EditeGiftV2State();
}
class _EditeGiftV2State extends State<EditeGiftV2> {
  var item = [];
  var item1 = [];
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
          title: Text("送り先", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: Container(
            child: Column(children: <Widget>[
              Container(
                margin: EdgeInsets.only(top:20),
                child: ElevatedButton(
                  child: const Text('全員に送る'),
                  style: ElevatedButton.styleFrom(primary: Colors.yellow[800], onPrimary: Colors.white, shape: const StadiumBorder(),),
                  onPressed: () {alert();},
                ),),
              Container(width: double.infinity,margin:EdgeInsets.only(top:20,left:10),child: Text("個人に送る",style: TextStyle(fontWeight: FontWeight.bold)),),
              Container(margin:EdgeInsets.only(left:10),width:double.infinity,height:50,child: Row(children: [
                Expanded(child:TextFormField(
                  controller: _controller,
                  decoration: InputDecoration(labelText:"名前検索"),
                  onChanged: (String value) {
                    setState(() {email = value;_loadData1();});
                  },),),
                Container(width:50,height:50,child:IconButton(onPressed: () { _loadData();},
                    icon:Icon(Icons.remove_circle_outline)))
              ],),),
              Expanded(
                child: ListView.builder(
                  itemCount: item.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          showDialog(context: context, builder: (context) =>
                              AlertDialog(
                                title: Text(item[index]["userName"] + "さんに送りますか？",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                                actions: <Widget>[
                                  Container(width: double.infinity,
                                    child:Row(children: [
                                      Container(width: 110,margin: EdgeInsets.only(bottom: 5,left:5,right: 5),child: ElevatedButton(
                                        child: const Text('送る'),
                                        style: ElevatedButton.styleFrom(primary: Colors.blue, onPrimary: Colors.white,
                                          shape: const StadiumBorder(),),
                                        onPressed: () {
                                          var Id = randomString(5);
                                          var pass = randomString(4);
                                         FirebaseFirestore.instance.collection('users').doc(item[index]["uid"]).collection("ギフト").doc(Id).set({
                                              "text":widget.text,
                                              "subText":widget.subText,
                                              "imageId" : widget.imageId,
                                              "Id":Id,
                                              "uid":item[index]["uid"],
                                              "pass":pass,
                                              "createdAt": Timestamp.now(),});
                                          FirebaseFirestore.instance.collection('ギフトAll').doc(Id).set({
                                            "text":widget.text,
                                            "subText":widget.subText,
                                            "imageId" : widget.imageId,
                                            "Id":Id,
                                            "uid":item[index]["uid"],
                                            "pass":pass,
                                            "createdAt": Timestamp.now(),});Navigator.pop(context);},
                                      ) ,),
                                      Container(width: 110,margin: EdgeInsets.only(bottom: 5,left:5,right: 5),child: ElevatedButton(
                                        child: const Text('キャンセル'),
                                        style: ElevatedButton.styleFrom(primary: Colors.blue, onPrimary: Colors.white,
                                          shape: const StadiumBorder(),),
                                        onPressed: () { Navigator.pop(context);},
                                      ) ,)]),)],));},
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
                                      )),],)),));},),),
            ])));}
  void _loadData()  {
    item = [];
    item1 = [];
    FirebaseFirestore.instance.collection('users').get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((doc) {
        setState(() {
          item.add(doc);
          item1.add(doc["uid"]);
          ;});});});}
  void _loadData1()  {
    item = [];
    FirebaseFirestore.instance.collection('users').where("userName", isEqualTo: email).get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((doc) {
        setState(() {
          item.add(doc);
          ;});});});}

  void alert (){
    showDialog(context: context, builder: (context) =>
        AlertDialog(
          title: Text("全員に送りますか？",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
          actions: <Widget>[
            Container(width: double.infinity,
              child:Row(children: [
                Container(width: 110,margin: EdgeInsets.only(bottom: 5,left:5,right: 5),child: ElevatedButton(
                  child: const Text('送る'),
                  style: ElevatedButton.styleFrom(primary: Colors.blue, onPrimary: Colors.white,
                    shape: const StadiumBorder(),),
                  onPressed: () {send();},
                ) ,),
                Container(width: 110,margin: EdgeInsets.only(bottom: 5,left:5,right: 5),child: ElevatedButton(
                  child: const Text('キャンセル'),
                  style: ElevatedButton.styleFrom(primary: Colors.blue, onPrimary: Colors.white,
                    shape: const StadiumBorder(),),
                  onPressed: () { Navigator.pop(context);},
                ) ,)]),)],));
  }
  void send (){
    for (var co = 0; co < item1.length  ; co++) {
      var Id = randomString(20);
      FirebaseFirestore.instance.collection('users').doc(item1[co]).collection("ギフト").doc(Id).set({
        "text": widget.text,
        "subText": widget.subText,
        "有効期限": widget.limit,
        "imageId": widget.imageId,
        "Id": Id,
        "createdAt": Timestamp.now(),});
      Navigator.pop(context);
    }
  }
  String randomString(int length) {
    const _randomChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    const _charsLength = _randomChars.length;
    final rand = new Random();
    final codeUnits = new List.generate(
      length, (index) {
      final n = rand.nextInt(_charsLength);
      return _randomChars.codeUnitAt(n);},);
    return new String.fromCharCodes(codeUnits);}
}
