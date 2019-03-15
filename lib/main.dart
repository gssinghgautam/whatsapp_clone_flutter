import 'package:flutter/material.dart';
import 'package:whatsapp_clone/whatsapp_home.dart';
import 'package:camera/camera.dart';

List<CameraDescription> cameras;

Future<Null> main() async {
  cameras = await availableCameras();
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "WhatsApp",
      theme: ThemeData(
          primaryColor: Color(0xFF075E54), accentColor: Color(0xFF25D366)),
      home: WhatsAppHome(cameras),
    );
  }
}
