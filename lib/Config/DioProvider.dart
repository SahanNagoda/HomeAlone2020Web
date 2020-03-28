import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'Config.dart';

class DioProvider {
  Dio dio;
  DioProvider() {
    dio = new Dio(); // with default Options

// Set default configs
    dio.options.baseUrl = Config.getURL();
    dio.options.connectTimeout = 5000; //5s
    dio.options.receiveTimeout = 3000;
  }
  Future<Map> sendRequest(
      {@required Map data,
      @required String url,
      @required GlobalKey<ScaffoldState> scaffoldKey}) async {
    print(Config.getURL() + url);
    try {
      Response res = await dio.post(
        Config.getURL() + url,
        data: data,
        // options: Options(
        //   headers: {
        //     "Access-Control-Allow-Origin": "*",
        //     "Access-Control-Allow-Methods": "POST,GET,DELETE,PUT,OPTIONS"
        //   },
        // ),
        onSendProgress: (int sent, int total) {
          print("$sent $total");
        },
      );
      print("Data Received ${res.statusCode.toString()}");
      if (res.statusCode == 200) {
        print(res.data);
        return res.data;
      } else {
        scaffoldKey.currentState.showSnackBar(new SnackBar(
            content: Row(
          children: <Widget>[
            Icon(Icons.warning),
            Text(' Something went Wrong ${res.statusCode} !'),
          ],
        )));
        return null;
      }
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print("Error :");
        print("Error : " + e.response.data);
        print("Error : " + e.response.headers.toString());
        print("Error : " + e.response.request.toString());
        print("Error : " + e.response.statusCode.toString());
        if (e.response.statusCode == 403) {
          scaffoldKey.currentState.showSnackBar(new SnackBar(
              content: Row(
            children: <Widget>[
              Icon(Icons.warning),
              Text(' Token Expired! you already submit the answer'),
            ],
          )));
        } else {
          scaffoldKey.currentState.showSnackBar(new SnackBar(
              content: Row(
            children: <Widget>[
              Icon(Icons.warning),
              Text(' Something went Wrong !'),
            ],
          )));
        }
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print("Error : " + e.request.toString());
        print("Error : " + e.message);
        scaffoldKey.currentState.showSnackBar(new SnackBar(
            content: Row(
          children: <Widget>[
            Icon(Icons.warning),
            Text(' Something went Wrong !'),
          ],
        )));
      }
    }

    return null;
  }
}
