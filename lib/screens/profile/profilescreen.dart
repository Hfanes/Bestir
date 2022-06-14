import 'dart:convert';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bestir/model/usermodel.dart';
import 'package:bestir/screens/home/home.dart';
import 'package:bestir/widgets/mybutton.dart';
import 'package:bestir/widgets/mytextformField.dart';
import 'package:bestir/widgets/notification_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

final TextEditingController email = TextEditingController();
final TextEditingController userName = TextEditingController();
final TextEditingController phoneNumber = TextEditingController();
final TextEditingController password = TextEditingController();
final TextEditingController address = TextEditingController();
final TextEditingController userImage = TextEditingController();

bool initialLabel = false;
bool isMale = true;
bool isLoading = false;

class _ProfileScreenState extends State<ProfileScreen> {
  late UserCredential result;

  late UserModel userModel;
  late Uint8List bytes;
  String img64 = "";
  XFile? galleryFile;
  late File imagePath = File('');
  static late TextEditingController phoneNumber;
  static late TextEditingController address;
  static late TextEditingController userName;
  static final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>();
  static String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = new RegExp(p);
  bool isMale = false;
  void vaildation() async {
    if (userName.text.isEmpty && phoneNumber.text.isEmpty) {
      _scaffoldKey.currentState?.showSnackBar(
        SnackBar(
          content: Text("All Flied Are Empty"),
        ),
      );
    } else if (userName.text.isEmpty) {
      _scaffoldKey.currentState?.showSnackBar(
        SnackBar(
          content: Text("Name Is Empty "),
        ),
      );
    } else if (userName.text.length < 6) {
      _scaffoldKey.currentState?.showSnackBar(
        SnackBar(
          content: Text("Name Must Be 6 "),
        ),
      );
    } else if (phoneNumber.text.length < 11 || phoneNumber.text.length > 11) {
      _scaffoldKey.currentState?.showSnackBar(
        SnackBar(
          content: Text("Phone Number Must Be 11 "),
        ),
      );
    } else {
      userDetailUpdate();
    }
  }

  late File _pickedImage;

  late PickedFile _image;

  Future<void> getImageCamera() async {
    final _image =
        await ImagePicker.platform.pickImage(source: ImageSource.camera);
    if (_image != null) {
      setState(() {
        _pickedImage = File(_image.path);
      });
    }
  }

  getImageGallery() async {
    galleryFile = (await ImagePicker.platform.getImage(
      source: ImageSource.gallery,
    ));

    imagePath = File(galleryFile!.path);

    bytes = imagePath.readAsBytesSync();
    img64 = base64Encode(bytes);
    _pickedImage = File.fromRawPath(bytes);
    setState(() {});
    print(img64.toString());
  }

  late String userUid;

  _uploadImage() async {
    User? myUser = FirebaseAuth.instance.currentUser;

    FirebaseFirestore.instance.collection("User").doc(myUser?.uid).update({
      "userImage": img64.toString(),
    }).then((_) {
      print("success!");
    });
  }

  void getUserUid() {
    User? myUser = FirebaseAuth.instance.currentUser;
    if (myUser != null) {
      userUid = myUser.uid;
    }
  }

  bool centerCircle = false;
  var imageMap;
  void userDetailUpdate() async {
    setState(() {
      centerCircle = true;
    });
    _pickedImage != null ? imageMap = await _uploadImage() : Container();
    FirebaseFirestore.instance.collection("Product").add({
      "UserName": userName.text,
      "UserGender": isMale == true ? "Male" : "Female",
      "UserNumber": phoneNumber.text,
      "UserImage": imageMap,
      "UserAddress": address.text
    });
    setState(() {
      centerCircle = false;
    });
    setState(() {
      edit = false;
    });
  }

  Widget _buildSingleContainer(
      {Color? color, required String startText, required String endText}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Container(
        height: 55,
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: edit == true ? color : Colors.white,
          borderRadius: edit == false
              ? BorderRadius.circular(30)
              : BorderRadius.circular(0),
        ),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              startText,
              style: TextStyle(fontSize: 17, color: Colors.black45),
            ),
            Text(
              endText,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  late String userImage;
  bool edit = false;

  Widget _buildContainerPart() {
    if (initialLabel == false) {
      address = TextEditingController(text: userModel.userAddress);
      userName = TextEditingController(text: userModel.userName);
      phoneNumber = TextEditingController(text: userModel.userPhoneNumber);
      initialLabel = true;
    }

    if (userModel.userGender == "Male") {
      isMale = true;
    } else {
      isMale = false;
    }
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildSingleContainer(
            endText: userModel.userName!,
            startText: "Name",
          ),
          _buildSingleContainer(
            endText: userModel.userEmail!,
            startText: "Email",
          ),
          _buildSingleContainer(
            endText: userModel.userGender!,
            startText: "Gender",
          ),
          _buildSingleContainer(
            endText: userModel.userPhoneNumber!,
            startText: "Phone Number",
          ),
          _buildSingleContainer(
            endText: userModel.userAddress!,
            startText: "Address",
          ),
        ],
      ),
    );
  }

  Future<void> myDialogBox(context) {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  ListTile(
                    leading: Icon(Icons.camera_alt),
                    title: Text("Pick from camera"),
                    onTap: () {
                      getImageCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.photo_library),
                    title: Text("Pick from gallery"),
                    onTap: () {
                      getImageGallery();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget _buildTextFormFliedPart() {
    if (initialLabel == false) {
      address = TextEditingController(text: userModel.userAddress);
      userName = TextEditingController(text: userModel.userName);
      phoneNumber = TextEditingController(text: userModel.userPhoneNumber);
      initialLabel = true;
    }
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextFormField(
            decoration: const InputDecoration(
              labelText: "UserName",
            ),
            controller: userName,
          ),
          _buildSingleContainer(
            color: Colors.grey[300],
            endText: userModel.userEmail!,
            startText: "Email",
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isMale = !isMale;
              });
            },
            child: _buildSingleContainer(
              color: Colors.white,
              endText: isMale == true ? "Male" : "Female",
              startText: "Gender",
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: "Phone Number",
            ),
            controller: phoneNumber,
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: "Address",
            ),
            controller: address,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    getUserUid();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      key: _scaffoldKey,
      backgroundColor: Color(0xfff8f8f8),
      appBar: AppBar(
        leading: edit == true
            ? IconButton(
                icon: Icon(
                  Icons.close,
                  color: Colors.redAccent,
                  size: 30,
                ),
                onPressed: () {
                  setState(() {
                    edit = false;
                  });
                },
              )
            : IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: () {
                  setState(() {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (ctx) => HomeScreeen(),
                      ),
                    );
                  });
                },
              ),
        backgroundColor: Colors.white,
        actions: [
          edit == false
              ? NotificationButton()
              : IconButton(
                  icon: Icon(
                    Icons.check,
                    size: 30,
                    color: Color(0xff746bc9),
                  ),
                  onPressed: () {
                    vaildation();
                  },
                ),
        ],
      ),
      body: centerCircle == false
          ? ListView(
              children: [
                StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection("User")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      var myDoc = snapshot.data?.docs;

                      myDoc?.forEach((checkDocs) {
                        if ((checkDocs.data() as dynamic)["UserId"] ==
                            userUid) {
                          userModel = UserModel(
                            userEmail:
                                (checkDocs.data() as dynamic)["UserEmail"],
                            userImage:
                                (checkDocs.data() as dynamic)["UserImage"],
                            userAddress:
                                (checkDocs.data() as dynamic)["UserAddress"],
                            userGender:
                                (checkDocs.data() as dynamic)["UserGender"],
                            userName: (checkDocs.data() as dynamic)["UserName"],
                            userPhoneNumber:
                                (checkDocs.data() as dynamic)["UserNumber"],
                            role: (checkDocs.data() as dynamic)["role"],
                          );
                        }
                      });
                      return Container(
                        height: 603,
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: 200,
                                  width: double.infinity,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        maxRadius: 65,
                                        // backgroundImage: MemoryImage(bytes)
                                      ),
                                    ],
                                  ),
                                ),
                                //EDITAR -----------------------------------------------------------------------------------------------
                                edit == true
                                    ? Padding(
                                        padding: EdgeInsets.only(
                                            left: MediaQuery.of(context)
                                                    .viewPadding
                                                    .left +
                                                220,
                                            top: MediaQuery.of(context)
                                                    .viewPadding
                                                    .left +
                                                110),
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: GestureDetector(
                                            onTap: () {
                                              myDialogBox(context);
                                            },
                                            child: CircleAvatar(
                                              backgroundColor:
                                                  Colors.transparent,
                                              child: Icon(
                                                Icons.camera_alt,
                                                color: Color(0xff746bc9),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    : Container(),
                              ],
                            ),
                            Container(
                              height: 350,
                              color: Colors.transparent,
                              width: double.infinity,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Container(
                                      child: edit == true
                                          ? _buildTextFormFliedPart()
                                          : _buildContainerPart(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Card(
                              color: Color.fromARGB(255, 110, 201, 107),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20)),
                                child: edit == false
                                    ? MyButton(
                                        name: "Edit Profile",
                                        onPressed: () {
                                          setState(() {
                                            edit = true;
                                          });
                                        },
                                      )
                                    : Container(),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ],
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
