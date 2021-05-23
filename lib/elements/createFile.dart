import 'dart:convert';
import 'dart:io';
import 'package:srt/classes/game.dart';

void createFile(Map<String, Game> content, Directory dir, String fileName) {
  File file = new File(dir.path + "/" + fileName);
  file.createSync();
  file.writeAsStringSync(jsonEncode(content));
}
