//import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fakemon2/vista/batallaVIsta.dart';
import 'package:flutter/material.dart';

import 'Menu_seleccion.dart';


/// `Menu_Inicial` is a StatelessWidget that represents the initial menu of the application.
/// It is implemented as a singleton, meaning there can only be one instance of this class.
class Menu_Inicial extends StatelessWidget {
  /// The single instance of `Menu_Inicial`.
  static final Menu_Inicial _instance = Menu_Inicial._internal();

  /// Factory constructor that returns the single instance of `Menu_Inicial`.
  factory Menu_Inicial() {
    return _instance;
  }

  /// Private constructor used to implement the singleton pattern.
  Menu_Inicial._internal();

  /// A boolean value that determines whether the game can be played.
  bool _canPlay = true;

  /// Builds the widget tree for `Menu_Inicial`.
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(flex: 6, child: Container()),
          Expanded(
            flex: 3,
            child: Transform.scale(
              scale: 0.8,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(flex: 1, child: Container()),
                    Expanded(
                      flex: MediaQuery.of(context).orientation ==
                          Orientation.portrait
                          ? 3
                          : 1,
                      child: ElevatedButton.icon(
                        /// If `_canPlay` is true, navigate to `Menu_seleccion` when the button is pressed.
                        onPressed: _canPlay
                            ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Menu_seleccion(),
                            ),
                          );
                        }
                            : null,
                        icon: Icon(Icons.settings_outlined,
                            color: Colors.yellow),
                        label: Text(''),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          onPrimary: Colors.white,
                          minimumSize: Size(130, 50),
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ),
                    Expanded(flex: 2, child: Container()),
                    Expanded(
                      flex: MediaQuery.of(context).orientation ==
                          Orientation.portrait
                          ? 3
                          : 1,
                      child: ElevatedButton.icon(
                        /// Navigate to `batallaUI` when the button is pressed.
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => batallaUI(),
                            ),
                          );
                        },
                        icon:
                        Icon(Icons.play_arrow_outlined, color: Colors.yellow),

                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          onPrimary: Colors.white,
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          minimumSize: Size(130, 50),
                        ),
                        label: Text(''),
                      ),
                    ),
                    Expanded(flex: 1, child: Container()),
                  ],
                ),
              ),
            ),
          ),
          Expanded(flex: 1, child: Container()),
        ],
      ),
    );
  }
}