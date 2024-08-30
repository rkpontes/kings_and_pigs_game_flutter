import "package:bonfire/bonfire.dart";

abstract class PigSpritesheet {
  static Future<SpriteAnimation> get idle async {
    const String path = 'pig/Idle (34x28).png';
    final size = Vector2(34, 28);
    const amount = 11;

    return await _flipSpriteSheet(
      path: path,
      size: size,
      amount: amount,
    );
  }

  static Future<SpriteAnimation> get run async {
    const String path = 'pig/Run (34x28).png';
    final size = Vector2(34, 28);
    const amount = 6;

    return await _flipSpriteSheet(path: path, size: size, amount: amount);
  }

  static Future<SpriteAnimation> get attack async {
    const String path = 'pig/Attack (34x28).png';
    final size = Vector2(34, 28);
    const amount = 5;

    return await _flipSpriteSheet(path: path, size: size, amount: amount);
  }

  static Future<SpriteAnimation> get dead async {
    const String path = 'pig/Dead (34x28).png';
    final size = Vector2(34, 28);
    const amount = 4;

    return await _flipSpriteSheet(path: path, size: size, amount: amount);
  }

  static Future<SpriteAnimation> get fall async {
    const String path = 'pig/Fall (34x28).png';
    final size = Vector2(34, 28);
    const amount = 1;

    return await _flipSpriteSheet(path: path, size: size, amount: amount);
  }

  static Future<SpriteAnimation> get ground async {
    const String path = 'pig/Ground (34x28).png';
    final size = Vector2(34, 28);
    const amount = 1;

    return await _flipSpriteSheet(path: path, size: size, amount: amount);
  }

  static Future<SpriteAnimation> get hit async {
    const String path = 'pig/Hit (34x28).png';
    final size = Vector2(34, 28);
    const amount = 2;

    return await _flipSpriteSheet(path: path, size: size, amount: amount);
  }

  static PlatformAnimations get animations => PlatformAnimations(
        idleRight: idle,
        runRight: run,
        others: {
          'hit': hit,
          'dead': dead,
          'attack': attack,
          'fall': fall,
          'ground': ground,
        },
        centerAnchor: Vector2(14, 19),
      );

  static Future<SpriteAnimation> _flipSpriteSheet(
      {required String path,
      required Vector2 size,
      required int amount}) async {
    Image image = await Flame.images.load(path);
    image = await image.flipAnimation(
      size: size,
      count: amount,
    );

    return image.getAnimation(size: size, amount: amount);
  }
}
