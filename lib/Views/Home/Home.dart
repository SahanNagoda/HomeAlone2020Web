import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:html';

class Home extends StatefulWidget {
  final String id;
  Home({Key key, this.id}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Animation animation;
  // AnimationController animationController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.id != null) {
      window.localStorage["token"] = widget.id;
    }
    // animationController =
    //     AnimationController(vsync: this, duration: Duration(seconds: 3));
    // animation = Tween(begin: 1.0, end: 0.0).animate(
    //     CurvedAnimation(parent: animationController, curve: Curves.easeIn));
    // animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    String token = window.localStorage["token"];
    print("Token $token");
    return Scaffold(
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
          Positioned(
            // top: AppBar().preferredSize.height,
            left: 80.0,
            child: Container(
              width: (width / 2) - 80.0,
              height: height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Welcome",
                    textAlign: TextAlign.center,
                    textScaleFactor: 6.0,
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    "Brute Force Task",
                    textAlign: TextAlign.center,
                    textScaleFactor: 4.0,
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: height * 0.1,
                  ),
                  Text(
                    "The Options class describes the http request information and configuration. Each Dio instance has a base config for all requests maked by itself, and we can override the base config with [Options] when make a single request. The [BaseOptions] declaration as follows",
                    textAlign: TextAlign.start,
                    textScaleFactor: 1.5,
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: height * 0.1,
                  ),
                  Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 2 * 0.5,
                      child: RaisedButton(
                        onPressed: token == null ? null : () => onPress(),
                        child: Text(
                          token == null ? "Invalid Token" : "Enter",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Color(0xFF5b86e5),
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(18.0),
                            side: BorderSide(color: Color(0xFF36d1dc))),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            // top: AppBar().preferredSize.height,
            right: 80.0,
            child: Container(
              width: (width / 2) - 80.0,
              height: height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/img.png',
                    fit: BoxFit.fill,
                  )
                ],
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
          Positioned.fill(
            top: AppBar().preferredSize.height,
            child: Container(),
          )
          // Container(
          //   height: height * animation.value,
          //   width: width,
          //   decoration: BoxDecoration(
          //     boxShadow: <BoxShadow>[
          //       BoxShadow(
          //           color: Color(0xFF5b86e5).withOpacity(0.6),
          //           offset: const Offset(1.1, 10.0),
          //           blurRadius: 8.0),
          //     ],
          //     gradient: LinearGradient(
          //       colors: <Color>[
          //         Color(0xFF36d1dc),
          //         Color(0xFF5b86e5),
          //       ],
          //       begin: Alignment.topLeft,
          //       end: Alignment.bottomRight,
          //     ),
          //     borderRadius: BorderRadius.only(
          //       bottomRight: Radius.circular(8.0),
          //       bottomLeft: Radius.circular(8.0),
          //       topLeft: Radius.circular(0.0),
          //       topRight: Radius.circular(0.0),
          //     ),
          //   ),
          // ),
          // Transform(
          //   transform: Matrix4.translationValues(
          //       0, -height + height * animation.value, 0),
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: Center(
          //       child: Column(
          //         children: <Widget>[
          //           Spacer(
          //             flex: 3,
          //           ),
          //           Text(
          //             "Home Alone",
          //             textAlign: TextAlign.center,
          //             textScaleFactor: 10.0,
          //             style: TextStyle(color: Colors.white),
          //           ),
          //           Spacer(
          //             flex: 1,
          //           ),
          //           Text(
          //             "2020",
          //             textAlign: TextAlign.center,
          //             textScaleFactor: 7.0,
          //             style: TextStyle(color: Colors.white),
          //           ),
          //           Spacer(
          //             flex: 3,
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  onPress() {
    print(widget.id);
    Navigator.pushNamed(context, '/task/${widget.id}');
  }
}
