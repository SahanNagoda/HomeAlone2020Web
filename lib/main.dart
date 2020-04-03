import 'package:flutter/material.dart';
import 'package:homeAlone2020/Views/Home/Home.dart';
import 'package:homeAlone2020/Views/Task/Task.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'HomeAlone 2020',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.grey,
          // scaffoldBackgroundColor: Colors.black,
        ),
        onGenerateRoute: (settings) {
          List<String> pathComponents = settings.name.split('/');
          print(pathComponents.toString());
          if (pathComponents[1] == 'task') {
            return MaterialPageRoute(
              builder: (context) {
                String token = pathComponents.last;
                return Task(id: token);
              },
            );
          } else if (pathComponents[1] == 'home') {
            print("Home");
            return MaterialPageRoute(
              builder: (context) {
                String token = pathComponents.last;

                return Home(id: token);
              },
            );
          }
          return MaterialPageRoute(
            builder: (context) {
              return Home();
            },
          );
        },
        // home: Home(),
        routes: {
          '/': (BuildContext context) => Home(),
          '/home': (BuildContext context) => Home(),
          '/task': (BuildContext context) => Task(),
        });
  }
}
