// ignore_for_file: public_member_api_docs, sort_constructors_first, file_names

import 'dart:isolate';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final dynamic extraData;
  const HomeScreen({
    Key? key,
    required this.extraData,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FirebaseCrashlytics crashlytics = FirebaseCrashlytics.instance;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeScreen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // test crash for trial
          Center(
            child: ElevatedButton(
              child: const Text('Fatal error'),
              onPressed: () {
                crashlytics.crash();
              },
            ),
          ),
          Center(
              child: ElevatedButton(
                  child: const Text('error'),
                  onPressed: () {
                    throw Error();
                  })),
          Center(
              child: ElevatedButton(
                  child: const Text('exception'),
                  onPressed: () {
                    throw Exception('This is an intentional exception!');
                  })),
          Center(
              child: ElevatedButton(
                  child: const Text('Format exception'),
                  onPressed: () {
                    throw FormatException;
                  })),
          Center(
              child: ElevatedButton(
                  child: const Text('Isolate exception'),
                  onPressed: () {
                    throw IsolateSpawnException;
                  })),
          Center(
              child: ElevatedButton(
                  child: const Text('Unsupported error'),
                  onPressed: () {
                    throw UnsupportedError;
                  })),
                  
        ],
      ),
    );
  }
}
