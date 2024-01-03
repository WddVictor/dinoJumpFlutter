import 'dart:ui';

class CollisionBox {
  final Offset offsetByObject;
  final double width;
  final double height;

  const CollisionBox({
    required this.offsetByObject,
    required this.width,
    required this.height,
  });

  bool isCollidedWith(
      Offset selfPosition, CollisionBox other, Offset otherPosition) {
    final selfRect = Rect.fromLTWH(
      selfPosition.dx + offsetByObject.dx,
      selfPosition.dy + offsetByObject.dy,
      width,
      height,
    );
    final otherRect = Rect.fromLTWH(
      otherPosition.dx + other.offsetByObject.dx,
      otherPosition.dy + other.offsetByObject.dy,
      other.width,
      other.height,
    );
    return selfRect.overlaps(otherRect);
  }
}
