import 'package:flutter/material.dart';

class GoalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height / 2;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            width: _width,
            height: _height,
          ),
          Container(
            decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.only(topLeft: Radius.circular(70))),
            width: _width,
            height: _height,
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            child: Column(
              children: <Widget>[
                TitleInput(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TitleInput extends StatefulWidget {
  @override
  _TitleInputState createState() => _TitleInputState();
}

class _TitleInputState extends State<TitleInput> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text("Title: ")
      ],
    );
  }
}