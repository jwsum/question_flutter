import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int answerOne;
  int answerTwo;
  List answerThree;

  // Question 1
  // the coordinates will be an Object with variable x and y
  int questionOne(List coordinates){
    int answer = 0;
    List verticalPair = []; //An array to store the pairs of vertical sides 
    for(Coordinate coor in coordinates){
      for(Coordinate coor_above in coordinates){
        //finding the coordinate that is above the first coordinate
        if(coor.x == coor_above.x && coor.y < coor_above.y){
          
          answer += verticalPair.length;
          //the Pair object is having two variable, the first coor and the coor_above
          verticalPair.add(Pair(coor, coor_above));
        }
      }
    }
    return answer;
  }

  //Question 2
  int questionTwo(List numbers){
    numbers.sort();
    List values = [];
    int value;
      for(int i = 0; i < numbers.length ; i++){
        if(i == 0){
          if(numbers[i] != numbers[i + 1]){
            values.add(numbers[i]);
          }
        }else if(i == numbers.length -1){
          if(numbers[i] != numbers[i - 1]){
            values.add(numbers[i]);
          }
        }else{
          if(numbers[i] != numbers[i - 1] && numbers[i] != numbers[i + 1]){
            values.add(numbers[i]);
          }
        }
      }

      if(values.length <= 1){
        value = values[0];
      }
    return value;
  }

  //Question 3
  List questionThree(List values){
    List uniqueValues = [];
    var tempValue;
    for(int i  = 0; i < values.length; i++){
      for(int j = 0; j < values.length; j++){
        if(i != j){
          if(values[i] == values[j]){
              tempValue = null;
            break;
          }else{
            tempValue = values[i];
          }
        }
      }
      if(tempValue != null){
        uniqueValues.add(tempValue);
      }
    }
    return uniqueValues;
  }

  @override
  void initState(){

    var listCoord = [Coordinate(0,0), Coordinate(1,0), Coordinate(2,0),
                    Coordinate(1,0), Coordinate(1,1), Coordinate(2,1)];
    var listNumber = [1,2,3,2,3,4,1];
    var listValue = ["a","a","c","a","a","d","b","c"];
    answerOne = questionOne(listCoord);
    answerTwo = questionTwo(listNumber);
    answerThree = questionThree(listValue);
    print("Answer1 : $answerOne");
    print("Answer2 : $answerTwo");
    print("Answer3 : $answerThree");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'AnswerOne',
            ),
            Text(
              '$answerOne',
              style: Theme.of(context).textTheme.display1,
            ),
            Text(
              'AnswerTwo',
            ),
            Text(
              '$answerTwo',
              style: Theme.of(context).textTheme.display1,
            ),
            Text(
              'AnswerThree',
            ),
            Text(
              '$answerThree',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      )
    );
  }
}

class Pair{
  Coordinate c;
  Coordinate cAbove;

  Pair(this.c, this.cAbove);
}

class Coordinate{
  int x;
  int y;

  Coordinate(this.x, this.y);
}