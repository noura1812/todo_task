import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app/app.dart';
import 'app/di.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    configureDependencies(),
    Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    ),
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ])
  ]);
  runApp(ProviderScope(
      child: DevicePreview(
          enabled: !kReleaseMode,
          builder: (context) {
            return const MyApp();
          })));
}
