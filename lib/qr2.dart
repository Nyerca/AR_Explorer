import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qrscan/qrscan.dart' as scanner;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController _outputController;

  @override
  initState() {
    super.initState();
    this._outputController = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Builder(
          builder: (BuildContext context) {
            return ListView(
              children: <Widget>[
                Container(
                  color: Colors.red,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 20),
                      TextField(
                        controller: this._outputController,
                        readOnly: true,
                        maxLines: 2,
                      ),
                      RaisedButton(
                        onPressed: _scan,
                        child: Text('Go back!'),
                      ),

                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }


  Future _scan() async {
    String barcode = await scanner.scan();
    this._outputController.text = barcode;
  }

}