import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  String id;
  Task({Key key, this.id}) : super(key: key);

  @override
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<Task> {
  @override
  Widget build(BuildContext context) {
    print("ID ${widget.id}");
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
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
          Positioned.fill(
            child: Column(
              children: <Widget>[],
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
          )
        ],
      ),
    );
  }
}
