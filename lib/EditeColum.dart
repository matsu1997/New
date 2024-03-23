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

import 'ColumV2.dart';
import 'SignUp.dart';

class EditeColum extends StatefulWidget {
  @override
  State<EditeColum> createState() => _EditeColumState();
}

class _EditeColumState extends State<EditeColum> {
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
          title: Text("コラム編集", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
          actions: <Widget>[
            IconButton(
                onPressed: () {  Navigator.of(context).push(
                 MaterialPageRoute(builder: (context) => EditeColumAdd()),).then((value) {_loadData();});},
                icon:Icon(Icons.add))
          ],
        ),
        body: Container(
            child: Column(children: <Widget>[
              Expanded(
                child: ListView.builder(
                  itemCount: item.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                        key:  Key(item.toString()),
                        onDismissed: (direction) {
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
                        },child:GestureDetector(
                    onTap: () {   Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ColumV2(item[index]["Id"])),
                    );},
                    child:Card(
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
                                  )),],)),)));},),),
              Container()
            ])));
  }
  void delete (){
    setState(() {
      FirebaseFirestore.instance
          .collection("コラム").doc(Id).delete();
      _loadData();});Navigator.of(context).pop();}
  void _loadData()  {
    item = [];
    FirebaseFirestore.instance.collection('コラム').get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((doc) {
        setState(() {
          item.add(doc);
          ;});});});}
}



class EditeColumAdd extends StatefulWidget {
  @override
  @override
  State<EditeColumAdd> createState() => _EditeColumAddState();
}
class _EditeColumAddState extends State<EditeColumAdd> {

  void initState() {
    super.initState();
    DateFormat outputFormat = DateFormat('MM/dd');
    date = outputFormat.format(today);
    aa();
  }
  var today = DateTime.now();
  var date = "";
  var uid = "";
  String infoText = '';
  String title = '';
  String text = '';
  var Id = "";
  File? get nil => null;
  String imgPathUse="";
  File? _image;
  var _controller = TextEditingController();
  var _controller1 = TextEditingController();
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
    FirebaseFirestore.instance.collection('コラム').doc(userId).set({
      "title":title,
      "text": text,
      "date":date,
      'ImageId': imgPathUse,
      "Id":Id,
    }, SetOptions(merge: true));
    _controller.clear();
    _controller1.clear();
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
                  controller: _controller,
                  decoration: InputDecoration(labelText:"題名"),
                  onChanged: (String value) {
                    setState(() {title = value;});
                  },),) ,
              Container(
                margin: EdgeInsets.all(10),
                child:TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  controller: _controller1,
                  decoration: InputDecoration(labelText:"文章"),
                  onChanged: (String value1) {
                    setState(() {text = value1;});
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
  void aa (){
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
        Future(() {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return SignUp();
          }));})
        ;} else {
        print('User is signed in!');
        uid = user.uid;
      }
    });
  }
}
