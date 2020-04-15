import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

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

  void  _onArCoreViewCreated(ArCoreController controller) {
    arCoreController = controller;
    arCoreController.onPlaneTap = _handleOnPlaneTap;



  }


  void _handleOnPlaneTap(List<ArCoreHitTestResult> hits){
    final material = ArCoreMaterial(
      color: Color.fromARGB(120, 66, 134, 244),
    );
    final sphere = ArCoreSphere(
      materials: [material],
      radius: 10,
    );
    final node = ArCoreNode(
      shape: sphere,
      position: vector.Vector3(0, 0, -1.5),
    );
    arCoreController.addArCoreNode(node);
  }

  @override
  void dispose() {
    arCoreController.dispose();
    super.dispose();
  }

  @override
  Widget  build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(
        title:  const  Text('AR Home'),
      ),
      body:  ArCoreView(
        onArCoreViewCreated: _onArCoreViewCreated,
        enableTapRecognizer:  true,
      ),
    );
  }
}