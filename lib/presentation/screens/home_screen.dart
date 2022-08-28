import 'package:flutter/material.dart';
import 'package:gym_manager_web_app/core/resources/style_resources.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Material(
              elevation: 5.0,
              child: Container(
                color: StyleResorces.scaffoldBackgroundColor,
                // child:,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(),
          )
        ],
      ),
    );
  }
}
