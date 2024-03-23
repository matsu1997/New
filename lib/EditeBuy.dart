import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'dart:io' as io;
class EditeBuy extends StatefulWidget {
  @override
  State<EditeBuy> createState() => _EditeBuyState();
}

class _EditeBuyState extends State<EditeBuy> {
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
          title: Text("物販編集", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
          actions: <Widget>[
              IconButton(
                    onPressed: () {  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => EditeBuyAdd()),).then((value) {_loadData();});},
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
                                    onPressed: () {Id = item[index]["Id"];delete();_loadData();},),),
                                Container(
                                  margin: EdgeInsets.all(5),width: double.infinity,
                                  child: TextButton(
                                    child: Text('いいえ',style: TextStyle(fontWeight: FontWeight.bold),),
                                    onPressed: () {;Navigator.of(context).pop();},),),
                              ],)
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
                          //[Colors.redAccent, Colors.red],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      padding: EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Container(
                              height: 100,
                              width: 100,
                              margin:
                                  EdgeInsets.only(top: 10, left: 10, right: 10),
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
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    top: 10, left: 10, right: 10),
                                child: Text(
                                  item[index]["subText"],
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    top: 10, left: 10, right: 10),
                                child: Text(item[index]["値段"].toString() + "円",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ),
                            ],
                          )),],)),));},),),
          Container()
        ])));}
  void _loadData()  {
    item = [];
    FirebaseFirestore.instance.collection('物販').get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((doc) {
        setState(() {
          item.add(doc);
          ;});});});}
  void delete (){
    setState(() {
      FirebaseFirestore.instance
          .collection("物販").doc(Id).delete();
      _loadData();});Navigator.of(context).pop();}
}


class EditeBuyAdd extends StatefulWidget {
  @override
  _EditeBuyAddState createState() => _EditeBuyAddState();
}

class _EditeBuyAddState extends State<EditeBuyAdd> {
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
    FirebaseFirestore.instance.collection('物販').doc(Id).set({
      "text": text,
      "subText":subText,
      "値段":limit,
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
                      decoration: InputDecoration(labelText:"商品名"),
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
                      decoration: InputDecoration(labelText:"値段"),
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