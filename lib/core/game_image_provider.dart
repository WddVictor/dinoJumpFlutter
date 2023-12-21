import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/services.dart';

class GameImageProvider {
  final Map<String, ui.Image> _cache = {};

  ui.Image? getImage(String path) => _cache[path];

  Future<ui.Image> loadImage(String path) async {
    if (_cache.containsKey(path)) {
      return _cache[path]!;
    }
    final image = await _loadUiImageFromAsset(path);
    _cache[path] = image;
    return image;
  }

  Future<ui.Image> _loadUiImageFromAsset(String imageAssetPath) async {
    final ByteData data = await rootBundle.load(imageAssetPath);
    final Completer<ui.Image> completer = Completer();
    ui.decodeImageFromList(Uint8List.view(data.buffer), (ui.Image img) {
      return completer.complete(img);
    });
    return completer.future;
  }
}
