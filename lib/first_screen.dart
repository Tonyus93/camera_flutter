import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:test_camera/camera_services.dart';
import 'package:torch/torch.dart';

class FirstScreen extends StatefulWidget {

  @override
  FirstScreenState createState() => FirstScreenState();
}

class FirstScreenState extends State<FirstScreen> {
  CameraController _controller;
  Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
  }

  getAvailableCameras() async {
    WidgetsFlutterBinding.ensureInitialized();
    return await availableCameras();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Test camera')),
      // Wait until the controller is initialized before displaying the
      // camera preview. Use a FutureBuilder to display a loading spinner
      // until the controller has finished initializing.
      body: Column(
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              Torch.turnOn();
              availableCameras().then((cameras) {
                Navigator.push(context, MaterialPageRoute(builder: (builder) => TakePictureScreen(camera: cameras.first)));
              });
            },
            child: Text('Lunch camera'),
          )
        ],
      )
    );
  }
}