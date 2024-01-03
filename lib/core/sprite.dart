class Sprite {
  int _currentFrameIndex = 0;

  String get currentFrame => _images[_currentFrameIndex];

  final List<String> _images = [];

  void updateImages(List<String> images) {
    _images.clear();
    _images.addAll(images);
    reset();
  }

  void moveToNextFrame() {
    _currentFrameIndex = (_currentFrameIndex + 1) % _images.length;
  }

  void reset() {
    _currentFrameIndex = 0;
  }
}
