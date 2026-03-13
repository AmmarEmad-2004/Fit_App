import 'package:firebase_core/firebase_core.dart';
import 'package:fit_app/core/utils/service_locator.dart';
import 'package:fit_app/fit_app.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setUPGetIt();
  runApp(DevicePreview(enabled: false, builder: (context) => const FitApp()));
}
