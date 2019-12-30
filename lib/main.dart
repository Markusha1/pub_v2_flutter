import 'package:flutter/material.dart';
import 'package:pub/GetStartedButton.dart';
import 'package:pub/MainScreen.dart';


void main(List<String> args) => runApp(MaterialApp(
  home: OnBoardingPage(),
  title: 'PUB',
));

class OnBoardingPage extends StatelessWidget{
  final c = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return IndicatorViePager(controller: PageController());
  }
}

class IndicatorViePager extends StatefulWidget {
  IndicatorViePager({this.controller});
  final PageController controller;
  @override
  _IndicatorViewState createState() => _IndicatorViewState();
}

class _IndicatorViewState extends State<IndicatorViePager> {
  List<Widget> list = [_BigDot(), _SimpleDot(), _SimpleDot()];
  bool isLastPage = false;
  List<Widget> _showDots(int page, int numberOfPages){
    list = List<Widget>(numberOfPages);
      for (int i = 0; i < list.length; i++){
        if(i == page) list[i] = _BigDot();
        else list[i] = _SimpleDot();
      }
      print("$list");
    return list;
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children:<Widget>[
        PageView(
            onPageChanged: (page){
              setState(() {
                _showDots(page, 3);
                if (page == 2) isLastPage = true;
                else isLastPage = false;
              });
            },
            controller: widget.controller,
            children: <Widget>[
              CustomOnBoardPage(text: "Welcome, stranger!", image: "assets/images/wallet.png"),
              CustomOnBoardPage(text: "Control your money!", image: "assets/images/price-tag.png"),
              CustomOnBoardPage(text: "Watch analytics!", image: "assets/images/analytics.png")
            ]
        ),
        Align(
            alignment: Alignment(0, 0.8),
            child: Container(
              width: 100,
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: list
              ),
            )
        ),
        Align(
          alignment: Alignment(1, 1),
          child: _SkipButton()
        ),
        Align(
          // alignment: Alignment(1, 1),
          child: GetStartedButton(isLastPage: isLastPage),
        )
      ],
    );
  }
}

  Widget _buildCustomText(String text){
    return Text(
      "$text",
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.black),
    );
  }
class CustomOnBoardPage extends StatelessWidget {
  final String text;
  final String image;
  CustomOnBoardPage({this.text, this.image});

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    var _height = MediaQuery.of(context).size.height / 2;
    return Container(
        color: Colors.white,
        child: Column(
            children: <Widget>[
              Container(
                  width: _width,
                  height: _height,
                  child: Align(
                      alignment: Alignment(0, 1),
                      child: SizedBox(
                          width: 200,
                          height: 200,
                          child: Image(image: AssetImage(image))
                      )
                  )
              ),
              Container(
                  width: _width,
                  height: _height,
                  child: Align(
                      alignment: Alignment(-0.5, -0.5),
                      child: _buildCustomText(text)
                  )
              )
            ]
        )
    );
  }
}

class _SimpleDot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 15,
      height: 15,
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
    );
  }
}

class _BigDot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 15,
      height: 15,
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.black),
    );
  }
}

class _SkipButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
       FlatButton(
        onPressed:(){
           toMainScreen(context);
           },
        child: Text('Skip')
      );
  }
}

void toMainScreen(BuildContext context){
  Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen()));
}







