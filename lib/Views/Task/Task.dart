import 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:homeAlone2020/Components/ProfileTextField.dart';
import 'dart:js' as js;

import 'package:homeAlone2020/Config/DioProvider.dart';

class Task extends StatefulWidget {
  String id;
  Task({Key key, this.id}) : super(key: key);

  @override
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<Task> {
  String token;
  String password, hash;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLoading = true;
  bool isCompleted = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    token = window.localStorage["token"];
    hash = window.localStorage["hash"];

    if (token != null && hash == null) {
      getHash();
    } else if (hash != null) {
      isLoading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    print("ID $token $kIsWeb");
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: <Widget>[
          Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Color(0xFF5b86e5).withOpacity(0.6),
                    offset: const Offset(1.1, 10.0),
                    blurRadius: 8.0),
              ],
              gradient: LinearGradient(
                colors: <Color>[
                  Color(0xFF5b86e5),
                  Color(0xFF36d1dc),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
          ),
          Positioned.fill(
            top: AppBar().preferredSize.height + 10,
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.only(),
              child: Container(
                // constraints: BoxConstraints(maxWidth: 1000),
                height: MediaQuery.of(context).size.height,
                // decoration: BoxDecoration(color: Colors.white.withOpacity(0.5)),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height -
                          AppBar().preferredSize.height -
                          20,
                      constraints: BoxConstraints(maxWidth: 900),
                      // decoration: BoxDecoration(
                      //   color: Colors.white.withOpacity(0.5),
                      //   borderRadius: BorderRadius.only(
                      //     bottomRight: Radius.circular(18.0),
                      //     bottomLeft: Radius.circular(18.0),
                      //     topLeft: Radius.circular(18.0),
                      //     topRight: Radius.circular(18.0),
                      //   ),
                      // ),
                      child: Visibility(
                        visible: !isLoading,
                        child: Column(
                          children: <Widget>[
                            ProfileTextField(
                                prefixText: "Hash",
                                initialValue: hash,
                                readOnly: true,
                                onChange: (val) {}),
                            ProfileTextField(
                                prefixText: "Token",
                                initialValue: token,
                                readOnly: true,
                                onChange: (val) {}),
                            ProfileTextField(
                                prefixText: "Cost",
                                initialValue: "4 Times",
                                readOnly: true,
                                onChange: (val) {}),
                            ProfileTextField(
                                prefixText: "Character set",
                                initialValue: "[0,1,2,3,4,5,6,7,8,9]",
                                readOnly: true,
                                onChange: (val) {}),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.3),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20.0)),
                                ),
                                width: double.maxFinite,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: RichText(
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 17),
                                      children: [
                                        TextSpan(
                                            text: "This Hash is generated by "),
                                        TextSpan(
                                            text: "bcrypt.js. ",
                                            recognizer:
                                                new TapGestureRecognizer()
                                                  ..onTap = () => js.context
                                                          .callMethod("open", [
                                                        "https://www.npmjs.com/package/bcryptjs"
                                                      ]),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                decoration:
                                                    TextDecoration.underline)),
                                        TextSpan(
                                            text:
                                                "The task is you have to decode this hash. This hash only contain digits and password length is 5 digits. You can user this "),
                                        TextSpan(
                                            text: "bcrypt API ",
                                            recognizer:
                                                new TapGestureRecognizer()
                                                  ..onTap = () => js.context
                                                          .callMethod("open", [
                                                        "https://bcrypt.org/"
                                                      ]),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                decoration:
                                                    TextDecoration.underline)),
                                        TextSpan(
                                            text:
                                                "to decode this hash. You are free to use any tool or resources. After decodeing enter the final password below text field. "),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            ProfileTextField(
                                prefixText: "Password",
                                initialValue: "",
                                hintText: "Password",
                                readOnly: false,
                                onChange: (val) {
                                  // print(val);
                                  setState(() {
                                    password = val;
                                  });
                                }),
                            Spacer(),
                            Center(
                              child: SizedBox(
                                width:
                                    MediaQuery.of(context).size.width / 2 * 0.5,
                                child: RaisedButton(
                                  onPressed: password == null || password == ""
                                      ? null
                                      : () => getResult(),
                                  child: Text(
                                    token == null
                                        ? "Invalid Token"
                                        : password == null
                                            ? "Enter Password"
                                            : "Submit",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  color: Color(0xFF5b86e5),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(18.0),
                                      side:
                                          BorderSide(color: Color(0xFF36d1dc))),
                                ),
                              ),
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            // left: 0,
            // right: 0,
            width: width,
            height: AppBar().preferredSize.height,
            child: Container(
              padding: EdgeInsets.only(
                left: 30.0,
                right: 10.0,
                top: 5.0,
                bottom: 10.0,
              ),
              color: Colors.white.withOpacity(0.3),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "HomeAlone",
                    textScaleFactor: 2.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 5.0,
                      right: 5.0,
                      top: 5.0,
                      bottom: 5.0,
                    ),
                    child: Text(
                      "2020",
                      textScaleFactor: 1.0,
                    ),
                  ),
                  Spacer(),
                  // ButtonBar(
                  //   children: <Widget>[
                  //     IconButton(
                  //         icon: FaIcon(FontAwesomeIcons.facebook),
                  //         onPressed: () {}),
                  //     IconButton(
                  //         icon: FaIcon(FontAwesomeIcons.facebook),
                  //         onPressed: () {}),
                  //     IconButton(
                  //         icon: FaIcon(FontAwesomeIcons.facebook),
                  //         onPressed: () {}),
                  //   ],
                  // )
                ],
              ),
            ),
          ),
          Visibility(
            visible: isLoading,
            child: Positioned.fill(
                child: Container(
              color: Colors.black.withOpacity(0.3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Spacer(
                    flex: 3,
                  ),
                  Container(
                    constraints: BoxConstraints(
                        maxWidth: 200,
                        maxHeight: 200,
                        minHeight: 100,
                        minWidth: 100),
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: CircularProgressIndicator(
                        strokeWidth: 5.0,
                      ),
                    ),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Container(
                    constraints: BoxConstraints(maxWidth: 300, maxHeight: 300),
                    child: FittedBox(
                      child: Text(
                        "Generating Data ...",
                        textAlign: TextAlign.center,
                        textScaleFactor: 4.0,
                        style: TextStyle(color: Colors.white.withOpacity(0.5)),
                      ),
                    ),
                  ),
                  Spacer(
                    flex: 3,
                  ),
                ],
              ),
            )),
          ),
          Visibility(
            visible: isCompleted,
            child: Positioned.fill(
                child: Container(
              color: Colors.black.withOpacity(0.3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Spacer(
                    flex: 3,
                  ),
                  // Container(
                  //   constraints: BoxConstraints(
                  //       maxWidth: 200,
                  //       maxHeight: 200,
                  //       minHeight: 100,
                  //       minWidth: 100),
                  //   child: FittedBox(
                  //     fit: BoxFit.cover,
                  //     child: CircularProgressIndicator(
                  //       strokeWidth: 5.0,
                  //     ),
                  //   ),
                  // ),
                  // Spacer(
                  //   flex: 1,
                  // ),
                  Container(
                    constraints: BoxConstraints(maxWidth: 300, maxHeight: 300),
                    child: FittedBox(
                      child: Text(
                        "Task Completed !",
                        textAlign: TextAlign.center,
                        textScaleFactor: 4.0,
                        style: TextStyle(color: Colors.white.withOpacity(0.9)),
                      ),
                    ),
                  ),
                  Spacer(
                    flex: 3,
                  ),
                ],
              ),
            )),
          )
        ],
      ),
    );
  }

  getHash() async {
    DioProvider dio = new DioProvider();
    await dio.sendRequest(
        data: {"token": token},
        url: "/getHash",
        scaffoldKey: _scaffoldKey).then((res) {
      if (res != null) {
        window.localStorage["hash"] = res['hash'];
        setState(() {
          hash = res['hash'];
          isLoading = false;
        });
      }
    });
  }

  getResult() async {
    setState(() {
      isLoading = true;
    });
    DioProvider dio = new DioProvider();
    await dio.sendRequest(
        data: {"token": token, "password": password},
        url: "/checkHash",
        scaffoldKey: _scaffoldKey).then((res) {
      if (res != null) {
        if (res["password"] == password) {
          setState(() {
            isCompleted = true;
          });
        }
        setState(() {
          isLoading = false;
        });
      }
    });
  }
}
