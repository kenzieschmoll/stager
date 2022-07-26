// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StagerAppGenerator
// **************************************************************************

import 'posts_list_scenes.dart';

import 'package:flutter/material.dart';
import 'package:stager/stager.dart';

Future<void> main() async {
  final scenes = [
    EmptyListScene(),
    WithPostsScene(),
    LoadingScene(),
    ErrorScene(),
  ];

  if (const String.fromEnvironment('Scene').isNotEmpty) {
    const sceneName = String.fromEnvironment('Scene');
    final scene = scenes.firstWhere((scene) => scene.title == sceneName);
    await scene.setUp();
    runApp(scene.build());
  } else {
    for (final scene in scenes) {
      await scene.setUp();
    }

    runApp(StagerApp(scenes: scenes));
  }
}
