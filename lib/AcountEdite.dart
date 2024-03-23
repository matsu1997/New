
import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io' as io;

class AcountEdite extends StatefulWidget {
  @override
  AcountEdite(this.name, this.Id, this.uid);

  String name;
  String Id;
  String uid;

  static Future<String?> select_icon(BuildContext context) async {
    String SELECT_ICON = "アイコンを選択";
    List<String> SELECT_ICON_OPTIONS = ["写真から選択", "写真を撮影"];
    int GALLERY = 0;
    int CAMERA = 1;

    var _select_type = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text(SELECT_ICON),
            children: SELECT_ICON_OPTIONS.asMap().entries.map((e) {
              return SimpleDialogOption(
                child: ListTile(
                  title: Text(e.value),
                ),
                onPressed: () => Navigator.of(context).pop(e.key),
              );
            }).toList(),
          );
        });

    final picker = ImagePicker();
    var _img_src;

    if (_select_type == null) {
      return null;
    }
    //カメラで撮影
    else if (_select_type == CAMERA) {
      _img_src = ImageSource.camera;
    }
    //ギャラリーから選択
    else if (_select_type == GALLERY) {
      _img_src = ImageSource.gallery;
    }

    final pickedFile = await picker.getImage(source: _img_src);

    if (pickedFile == null) {
      return null;
    } else {
      return pickedFile.path;
    }
  }

  @override
  State<AcountEdite> createState() => _AcountEditeState();
}

class _AcountEditeState extends State<AcountEdite> {

  void initState() {
    super.initState();
  }
  File? get nil => null;
  String imgPathUse="";
  File? _image;
  var _controller = TextEditingController();
  var ID = "";
  String email = '';
  bool _B = false;
  final imagePicker = ImagePicker();
  Future getImageFromCamera() async {
    _B = true;
    final pickedFile = await imagePicker.getImage(source: ImageSource.camera);
    setState(() {if (pickedFile != null) {_image = File(pickedFile.path);}});}
  PickedFile? pickedFile;
  Future getImageFromGarally() async {
    _B = true;
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
    getImgs(ID);
    // addFilePath(widget.uid, pickedFile!.path);
    // Navigator.of(context).pop();
  }

  Future<void> addFilePath(String userId, String localPath) async {
    CollectionReference users = FirebaseFirestore.instance.collection('チケット');
    await users.doc(ID).set({
      "text": email,
      "messageId": ID,
      'ImgId': imgPathUse,
    }, SetOptions(merge: true));
    _controller.clear();
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
        addFilePath(widget.uid, pickedFile!.path);
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
          title: Text("アカウント編集",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black),),
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
        ),
        body: Container(
            child: Column(children: <Widget>[
              Container(margin: EdgeInsets.only(top:20,bottom: 5),child:Text("現在の名前:",style: TextStyle(fontWeight: FontWeight.bold,),)),
              Container(child:Text("本名でお願いいたします",style: TextStyle(fontSize:10,fontWeight: FontWeight.bold,color:Colors.red),)),
              Container(
                margin: EdgeInsets.only(top:5,bottom: 5),
                child: TextFormField(
                  controller: _controller,
                  decoration: InputDecoration(labelText: '新しい名前'),
                  onChanged: (String value) {
                    setState(() {
                      email = value;
                    });},),),
              Container(
                margin: EdgeInsets.only(top:20,bottom: 20),
                child: ElevatedButton(
                  child: Text('編集',style: TextStyle(fontWeight: FontWeight.bold),),
                  onPressed: !_B ? null:()  {
                    ID = randomString(20);

                    },),)
            ])));
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
          );});}

}
