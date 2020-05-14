import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:vector_math/vector_math_64.dart' as vector;
import 'package:flutterapp4/about_widget.dart';

import 'dart:async';
import './ex2.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  String elementUrl="";

  MyApp([String url]) {
    elementUrl = url;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter AR',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage('Flutter AR', elementUrl),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage(this.title, this.url) {}
  String title;
  String url;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ArCoreController arCoreController;
  var clicked = 0;

  _onArCoreViewCreated(ArCoreController _arcoreController) {
    arCoreController = _arcoreController;

    arCoreController.onNodeTap = (name) => {
      clicked++,
   if(clicked == 1) {
     showDialog(
       context: context,
       builder: (context) => AboutWidget(),
     ),
   }
  };
    if(widget.url!=null) {
      _addObj(arCoreController);
    }


  }

  _addObj(ArCoreController _arcoreController) {
    final node = ArCoreReferenceNode(
      name: "Toucano",
      objectUrl:
      "https://raw.githubusercontent.com/Nyerca/ar_images/master/scene.gltf",
      scale: vector.Vector3(0.1, 0.1, 0.1),
      position: vector.Vector3(0, 0, -1),
      rotation:  vector.Vector4(90, 0, 0, 0),
    );

    _arcoreController.addArCoreNode(node);
  }


  @override
  void dispose() {
    print("DISPOSE");
    arCoreController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

      body: Stack(
        children: <Widget>[
          ArCoreView(
            onArCoreViewCreated: _onArCoreViewCreated,
            enableTapRecognizer: true,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: RaisedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => QRViewExample()),
                );
              },
              child: Text('Scan'),
            ),
          ),
        ],
      ),
    );
  }
}

