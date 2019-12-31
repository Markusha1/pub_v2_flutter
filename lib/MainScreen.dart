import 'package:flutter/material.dart';
import 'package:pub/ProgressPainter.dart';

import 'AddNewGoal.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack (
          children: <Widget>[
            Container(
              color: Colors.white
            ),
            Align(
              alignment: Alignment(0, -1),
              child: _InformationPanel()
            ),
            Align(
              alignment: Alignment(0, 0),
              child: Container(
                padding: EdgeInsets.only(top: 130, left: 30, right: 30),
                child: GridView.count(
                  childAspectRatio: 0.9,
                  crossAxisCount: 2,
                  children: <Widget>[
                    ChipItem(title: "Rent", balance: 1000.0, goal: 2000, daysLeft: 3),
                    ChipItem(title: "Iphone", balance: 0, goal: 1000, daysLeft: 5),
                    ChipItem(title: "Black day", balance: 3, goal: 500, daysLeft: 0),
                    ChipItem(title: "Macbook", balance: 100.31, goal: 1100, daysLeft: 30),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.pinkAccent,
        onPressed: (){
          _addNewItem(context);
        }
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(height: 50),
        elevation: 30,
      ),
    );
  }
}
void _addNewItem(BuildContext context){
  Navigator.push(context, MaterialPageRoute(builder: (context) => GoalScreen()));
} 

class ChipItem extends StatefulWidget {
  final String title;
  final double balance;
  final double goal;
  final int daysLeft;

  ChipItem({this.title, this.balance, this.goal, this.daysLeft});

  @override
  _ChipItemState createState() => _ChipItemState();
}

class _ChipItemState extends State<ChipItem> {
  dynamic div(double a){
    if (a % 1 == 0) return a.toInt();
    else return a;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Card(
        elevation: 15,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
        child: Column(
          children: <Widget>[
            Container(
              height: 100,
              width: 200,
              child: CustomPaint(
                foregroundPainter: ProgressPainter(currentProgress: 20, outerColor: Color(0xFFf8bbd0), progressColor: Color(0xFFe91e63)),
                child: Icon(Icons.home),
              ),
            ),
            Text("${widget.title}"),
            Text("\$${div(widget.balance)} \$${div(widget.goal)}"),
            Text("${widget.daysLeft} days left")
          ],
        ),
      ),
    );
  }
}



class _InformationPanel extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)), color: Colors.deepPurpleAccent),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/3,
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage("assets/images/witcher.jpeg"),
                          radius: 20,
                        ),
                        Icon(
                          Icons.exit_to_app,
                          color: Colors.white,
                        )
                      ],
                    ),
                    Align(
                      alignment: Alignment(-1, 0),
                        child: Text("Already saved", style: TextStyle(fontSize: 17, color: Colors.grey))),
                    Align(
                        alignment: Alignment(-1, 0),
                        child: Text("20.20", style: TextStyle(fontSize: 20, color: Colors.white))),
                  ],
                ),
              );
  }
}
