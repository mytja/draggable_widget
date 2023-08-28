import 'package:draggable_widget/draggable_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final dragController = DragController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextButton(
                  onPressed: () {
                    dragController.showWidget();
                  },
                  child: Text("Show"),
                ),
                TextButton(
                  onPressed: () {
                    dragController.hideWidget();
                  },
                  child: Text("Hide"),
                ),
              ],
            ),
          ),
          Container(
            height: 80,
            width: double.infinity,
            color: Colors.green,
          ),
          DraggableWidget(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ...List.generate(100, (int index) => index)
                      .map((e) => Container(
                            width: 100,
                            height: 100,
                            color: e % 2 == 0 ? Colors.blue : Colors.green,
                          )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
