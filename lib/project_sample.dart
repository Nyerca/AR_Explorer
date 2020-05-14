import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:vector_math/vector_math_64.dart' as vector;
import 'package:flutterapp4/about_widget.dart';

import 'dart:async';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter AR',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter AR'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ArCoreController arCoreController;
  TextEditingController _outputController = new TextEditingController();
  var urlCode = "";
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
    _addObj(arCoreController);

  }

  _addObj(ArCoreController _arcoreController) {
    final node = ArCoreReferenceNode(
      name: "Toucano",
      objectUrl:
      "https://raw.githubusercontent.com/Nyerca/ar_images/master/scene.gltf",
      scale: vector.Vector3(0.2, 0.2, 0.2),
      position: vector.Vector3(0, 0, -1),
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

        ],
      ),
    );
  }
}

