
import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io' as io;

class StaffAdd extends StatefulWidget {

  @override
  State<StaffAdd> createState() => _StaffAddState();
}

class _StaffAddState extends State<StaffAdd> {

  void initState() {
    super.initState();
  }
  final tags = ["月","火","水","木","金","土","日"];
  var selectedTags = <String>[];
  File? get nil => null;
  String imgPathUse="";
  File? _image;
  var _NameCon = TextEditingController();
  var _CommentCon = TextEditingController();
  var ID = "";
  String name = '';
  String comment = '';
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
   FirebaseFirestore.instance.collection('スタッフ').doc(userId).set({
      "名前": name,
     "コメント":comment,
     "出勤日":selectedTags,
      "Id": userId,
      'ImgId': imgPathUse,
    }, SetOptions(merge: true));
    _NameCon.clear();
    _CommentCon.clear();
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
        addFilePath(ID, pickedFile!.path);
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
          title: Text("スタッフ追加",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black),),
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
        ),
        body: Container(
            child: Column(children: <Widget>[
              Expanded(
                child: Container(
                    alignment: Alignment.center,
                    child: _image == null ?
                    Text(
                      '写真を１枚選択してください',
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
                margin: EdgeInsets.only(top:20,bottom: 20),
                child: TextFormField(
                  controller: _NameCon,
                  decoration: InputDecoration(labelText: '名前'),
                  onChanged: (String value) {
                    setState(() {name = value;});},),),
              Container(
                margin: EdgeInsets.only(top:20,bottom: 20),
                child: TextFormField(
                  controller: _CommentCon,
                  decoration: InputDecoration(labelText: 'コメント'),
                  onChanged: (String value1) {
                    setState(() {comment = value1;});},),),
              Container(margin: EdgeInsets.only(left: 20,right: 20,top: 20),
               child: Text("出勤日"),),
              Container(margin: EdgeInsets.only(left: 20,right: 20,top: 20),
                child: Wrap(
                  runSpacing: 7, spacing: 7,
                  children: tags.map((tag) {
                    // selectedTags の中に自分がいるかを確かめる
                    final isSelected = selectedTags.contains(tag);
                    return InkWell(
                      borderRadius: const BorderRadius.all(Radius.circular(32)),
                      onTap: () {
                        if (isSelected) {// すでに選択されていれば取り除く
                          selectedTags.remove(tag);
                        } else {// 選択されていなければ追加する
                          selectedTags.add(tag);
                        }setState(() {});
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(32)),
                          border: Border.all(width: 2, color: Colors.orange,),
                          color: isSelected ? Colors.orange : null,
                        ),
                        child: Text(tag, style: TextStyle(
                          color: isSelected ? Colors.white : Colors.orange, fontWeight: FontWeight.bold,
                        ),),),);}).toList(),
                ),),
              Container(
                margin: EdgeInsets.only(top:20,bottom: 20),
                child: ElevatedButton(
                  child: Text('追加',style: TextStyle(fontWeight: FontWeight.bold),),
                  onPressed: !_B ? null:()  {
                    ID = randomString(20);
                    uploadFile(pickedFile!.path,ID);
                    setState(() { _B  = false;FocusScope.of(context).unfocus(); });

                  },
                ),)
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
          );
        });}
}
