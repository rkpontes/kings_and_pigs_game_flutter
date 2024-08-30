import "package:bonfire/bonfire.dart";

abstract class KingSpritesheet {
  static Future<SpriteAnimation> get idle => SpriteAnimation.load(
        'king/Idle (78x58).png',
        SpriteAnimationData.sequenced(
          amount: 11,
          stepTime: 0.1,
          textureSize: Vector2(78, 58),
        ),
      );

  static Future<SpriteAnimation> get run => SpriteAnimation.load(
        'king/Run (78x58).png',
        SpriteAnimationData.sequenced(
          amount: 8,
          stepTime: 0.1,
          textureSize: Vector2(78, 58),
        ),
      );

  static Future<SpriteAnimation> get jump => SpriteAnimation.load(
        'king/Jump (78x58).png',
        SpriteAnimationData.sequenced(
          amount: 1,
          stepTime: 0.1,
          textureSize: Vector2(78, 58),
        ),
      );

  static Future<SpriteAnimation> get fall => SpriteAnimation.load(
        'king/Fall (78x58).png',
        SpriteAnimationData.sequenced(
          amount: 1,
          stepTime: 0.1,
          textureSize: Vector2(78, 58),
        ),
      );

  static Future<SpriteAnimation> get ground => SpriteAnimation.load(
        'king/Ground (78x58).png',
        SpriteAnimationData.sequenced(
          amount: 1,
          stepTime: 0.1,
          textureSize: Vector2(78, 58),
        ),
      );

  static Future<SpriteAnimation> get attack => SpriteAnimation.load(
        'king/Attack (78x58).png',
        SpriteAnimationData.sequenced(
          amount: 3,
          stepTime: 0.1,
          textureSize: Vector2(78, 58),
        ),
      );

  static Future<SpriteAnimation> get hit => SpriteAnimation.load(
        'king/Hit (78x58).png',
        SpriteAnimationData.sequenced(
          amount: 2,
          stepTime: 0.1,
          textureSize: Vector2(78, 58),
        ),
      );

  static Future<SpriteAnimation> get dead => SpriteAnimation.load(
        'king/Dead (78x58).png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.1,
          textureSize: Vector2(78, 58),
        ),
      );

  static Future<SpriteAnimation> get doorIn => SpriteAnimation.load(
        'king/Door In (78x58).png',
        SpriteAnimationData.sequenced(
          amount: 8,
          stepTime: 0.1,
          textureSize: Vector2(78, 58),
        ),
      );

  static Future<SpriteAnimation> get doorOut => SpriteAnimation.load(
        'king/Door Out (78x58).png',
        SpriteAnimationData.sequenced(
          amount: 8,
          stepTime: 0.1,
          textureSize: Vector2(78, 58),
        ),
      );

  static PlatformAnimations get animations => PlatformAnimations(
        centerAnchor: Vector2(32, 28),
        idleRight: KingSpritesheet.idle,
        runRight: KingSpritesheet.run,
        jump: PlatformJumpAnimations(
          jumpUpRight: KingSpritesheet.jump,
          jumpDownRight: KingSpritesheet.fall,
        ),
        others: {
          'ground': KingSpritesheet.ground,
          'attack': KingSpritesheet.attack,
          'hit': KingSpritesheet.hit,
          'dead': KingSpritesheet.dead,
          'doorIn': KingSpritesheet.doorIn,
          'doorOut': KingSpritesheet.doorOut,
        },
      );
}
