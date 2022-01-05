import 'package:flame/components/component.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'game/cat_game.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.util.fullScreen();
  await Flame.util.setLandscape();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flame Game'),
    );
  }
}

class MyHomePage extends StatefulWidget {

  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CatGame game=CatGame();
  final SpriteComponent _spriteComponent=SpriteComponent.square(150, "DinoSprites_mort.gif");
  final SpriteComponent _spriteComponentDino=SpriteComponent.square(150, "DinoSprites_tard.gif");

  @override
  void initState() {
    _spriteComponent.x=100;
    _spriteComponent.y=100;
    _spriteComponentDino.x=511;
    _spriteComponentDino.y=150;
    //_spriteComponentDino.angle=0.78;
    //game.add(_spriteComponent);
    //game.add(_spriteComponentDino);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: game.widget,
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
