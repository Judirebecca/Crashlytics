import 'dart:async';
import 'dart:isolate';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

import 'App.dart';
import 'firebase_options.dart';

Future<void> main(List<String> args) async {
  // to catch the zoned errors that are uncaught by flutter
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,   
    );
    
    FirebaseCrashlytics crashlytics = FirebaseCrashlytics.instance;

    crashlytics.setCrashlyticsCollectionEnabled(true);

    // to catch all the errors that are thrown by the flutter framework
    FlutterError.onError = crashlytics.recordFlutterError;

    runApp(const MyApp());
  }, (error, stack) => FirebaseCrashlytics.instance.recordError(error, stack));

  // to catch error that are not caused by flutter
  Isolate.current.addErrorListener(RawReceivePort((pair) async {
    final List<dynamic> errorAndStacktrace = pair;
    await FirebaseCrashlytics.instance.recordError(
      errorAndStacktrace.first,
      errorAndStacktrace.last,
    );
  }).sendPort);
}
