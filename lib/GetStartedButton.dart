import 'package:flutter/material.dart';
import 'package:pub/main.dart';

class GetStartedButton extends StatefulWidget {
  GetStartedButton({this.isLastPage});
  final bool isLastPage;
  @override
  _GetStartedButtonState createState() => _GetStartedButtonState();
}

class _GetStartedButtonState extends State<GetStartedButton>{

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer( 
      duration: Duration(milliseconds: 200),
      alignment:  widget.isLastPage ? Alignment(1, 1) : Alignment(1.5, 1.5),
      child: GestureDetector(
        onTap: (){
          // Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen()));
          toMainScreen(context);
        },
        child:
      Container(
      decoration: BoxDecoration(color: Color(0xFFfce4ec), borderRadius: BorderRadius.only(topLeft: Radius.circular(10))),
      height: 90,
      padding: EdgeInsets.only(left: 8, top: 8),
      width: 100,
      child: Container(
        decoration: BoxDecoration(color: Color(0xFFec407a), borderRadius: BorderRadius.only(topLeft: Radius.circular(10))),
        width: 100,
        height: 90,
        child:Center(
          child: Text("START", style: TextStyle(fontSize: 15, color: Colors.white)
        )
      )
      )
      )
      )
    );
  }
}
