import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:kings_and_pigs/game/king.dart';
import 'package:kings_and_pigs/game/pig.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Game(),
    );
  }
}

class Game extends StatelessWidget {
  const Game({super.key});

  static const tileSize = 32.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BonfireWidget(
        map: WorldMapByTiled(
          WorldMapReader.fromAsset('map/map.tmj'),
          objectsBuilder: {
            'pig': (properties) => Pig(
                  position: properties.position,
                ),
          },
        ),
        playerControllers: [
          Keyboard(),
          Joystick(directional: JoystickDirectional(), actions: [
            JoystickAction(actionId: 1),
            JoystickAction(
              actionId: 2,
              margin: const EdgeInsets.only(bottom: 50, right: 120),
              color: Colors.red,
            ),
          ]),
        ],
        player: King(
          position: Vector2(tileSize * 3, tileSize * 5),
        ),
        cameraConfig: CameraConfig(
          zoom: getZoomFromMaxVisibleTile(context, tileSize, 10),
        ),
        backgroundColor: const Color(0xFF3f3851),
        globalForces: [
          GravityForce2D(),
        ],
        showCollisionArea: false,
      ),
    );
  }
}
