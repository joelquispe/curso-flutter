import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionsScreen extends StatefulWidget {
  const PermissionsScreen({super.key});

  @override
  State<PermissionsScreen> createState() => _PermissionsScreenState();
}

class _PermissionsScreenState extends State<PermissionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  final result = await Permission.camera.request();
                  if (result.isGranted) {
                    print("tengo acceso a la cámara");
                  }
                },
                child: Text("Request Camera")),
            ElevatedButton(
                onPressed: () async {
                  final result = await Permission.storage.request();
                  if (result.isGranted) {
                    print("tengo acceso al storage");
                  }
                },
                child: Text("Request gallery")),
            ElevatedButton(
                onPressed: () async {
                  final result = await Permission.location.request();
                  if(result.isGranted){
                    print("tengo acceso al location");
                  }
                },
                child: Text("Request Location")),
          ],
        ),
      ),
    );
  }
}
