import 'package:bonfire/bonfire.dart';
import 'package:flutter/services.dart';
import 'package:kings_and_pigs/utils/dust_particle_builder.dart';
import 'package:kings_and_pigs/utils/king_spritesheet.dart';

class King extends PlatformPlayer with HandleForces {
  bool moveEnabled = true;

  King({
    required super.position,
  }) : super(
          size: Vector2(78, 58),
          animation: KingSpritesheet.animations,
        ) {
    mass = 2;
  }

  @override
  void onJoystickAction(JoystickActionEvent event) {
    if (event.event == ActionEvent.DOWN &&
        (event.id == 1 || event.id == LogicalKeyboardKey.space)) {
      jump(jumpSpeed: 200);
    }

    if (event.event == ActionEvent.DOWN &&
        (event.id == 2 || event.id == LogicalKeyboardKey.keyZ)) {
      _execAttack();
    }

    super.onJoystickAction(event);
  }

  @override
  void onJoystickChangeDirectional(JoystickDirectionalEvent event) {
    if (moveEnabled) {
      super.onJoystickChangeDirectional(event);
    }
  }

  @override
  Future<void> onLoad() {
    add(
      RectangleHitbox(
        size: Vector2.all(15),
        position: Vector2(31, 29),
      ),
    );

    return super.onLoad();
  }

  @override
  void onMove(
    double speed,
    Vector2 displacement,
    Direction direction,
    double angle,
  ) {
    if (direction.isHorizontal) {
      if (checkInterval('smoke', 300, dtUpdate)) {
        if (direction.isRightSide) {
          showSmoke(SmokeDirection.right);
        } else if (direction.isLeftSide) {
          showSmoke(SmokeDirection.left);
        }
      }
    }
    super.onMove(speed, displacement, direction, angle);
  }

  @override
  void onJump(JumpingStateEnum state) {
    if (state == JumpingStateEnum.idle) {
      animation?.playOnceOther('ground', runToTheEnd: true);
      showSmoke(SmokeDirection.center);
    }

    super.onJump(state);
  }

  @override
  void onReceiveDamage(AttackOriginEnum attacker, double damage, identify) {
    animation?.playOnceOther(
      'hit',
      runToTheEnd: true,
      useCompFlip: true,
    );
    super.onReceiveDamage(attacker, damage, identify);
  }

  @override
  void onDie() {
    moveEnabled = false;
    stopMove(forceIdle: true);
    animation?.playOnceOther(
      'dead',
      runToTheEnd: true,
      useCompFlip: true,
      onFinish: removeFromParent,
    );
    super.onDie();
  }

  void _execAttack() {
    animation?.playOnceOther(
      'attack',
      runToTheEnd: true,
      useCompFlip: true,
    );
    simpleAttackMelee(
      damage: 20,
      size: Vector2.all(40),
      direction: lastDirectionHorizontal,
      marginFromCenter: 15,
    );
  }

  void showSmoke(SmokeDirection direction) {
    final x = rectCollision.center.dx;
    final y = rectCollision.bottom;

    gameRef.add(DustParticleBuilder().build(
      priority: priority,
      position: Vector2(x, y),
      direction: direction,
    ));
  }
}
