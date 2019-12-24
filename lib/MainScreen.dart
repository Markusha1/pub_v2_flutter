import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40),bottomRight: Radius.circular(40)), color: Color(0xFF8399fe)),
              height: MediaQuery.of(context).size.height / 2.3,
              padding: EdgeInsets.all(20),
              child: SafeArea(
                child: Column(
                  children: <Widget>[
                    Align(
                alignment: Alignment(1, -1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                  Container(
                    width: 50,
                    height: 50,
                    child: CircleAvatar(backgroundImage: AssetImage('assets/images/witcher.jpeg'), maxRadius: 190, minRadius: 90),
                        ),
                        FlatButton(
                          onPressed: null,
                          child: Text("Sing out"),
                        )
                      ]
                    ),
                  ),
                  Align(
                    alignment: Alignment(-1, -1),
                    child: Text("Already saved", style: TextStyle(fontFamily: 'Raleway', fontSize: 20, color: Color(0xFFeeeeee)))
                  ),
                  Align(
                  alignment: Alignment(-1, -1),
                  child: Text("20.20", style: TextStyle(fontFamily: 'Raleway', fontSize: 30, color: Colors.white))
                  )
                ]
              ),
            )
          ),
          ListView()
        ],
      ),
    ),
      floatingActionButton: FloatingActionButton(
        onPressed: null, 
        backgroundColor: Colors.pink, 
        child: Icon(Icons.add, size: 30)
        ),
      bottomNavigationBar: BottomAppBar(color: Colors.white, shape: CircularNotchedRectangle(), child: Container(height: 30)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked
    );
  }
}