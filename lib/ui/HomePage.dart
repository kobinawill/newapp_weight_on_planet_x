import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new homepage();
  }
}

class homepage extends State<HomePage> {
final TextEditingController _TextControl = new TextEditingController();

  int radioValue, weightValue = 0;
  double _finalResult = 0.0;
  String finalword = "";
  double kgvalue = 0.0;



  void metrik(int value){
    setState(() {
      weightValue = value;
      if (weightValue == 5){
        kgvalue = double.parse(_TextControl.text) / 2.2046;
      }
      else{
        kgvalue = kgvalue = double.parse(_TextControl.text);
      }
    });
  }


  void radioOnChange(int value){
    setState(() {
      radioValue = value;
      debugPrint("$radioValue");
      if(_TextControl.text.isNotEmpty && kgvalue > 0){
        switch(radioValue){
          case 0:
            _finalResult = kgvalue * 0.06;
            finalword = "Your weight on Pluto is ${_finalResult.toStringAsFixed(1)}";
            break;
          case 1:
            _finalResult = kgvalue * 0.38;
            finalword = "Your weight on Mars is ${_finalResult.toStringAsFixed(1)}";
            break;
          case 2:
            _finalResult = kgvalue * 0.91;
            finalword = "Your weight on Venus is ${_finalResult.toStringAsFixed(1)}";
        }
      }
      else{
        finalword = "Please enter your weight";
      }
      if(weightValue == 5 || weightValue == 6){
      switch(weightValue){
        case 5:
        if (weightValue == 5 && (_TextControl.text.isNotEmpty && kgvalue > 0)){
            finalword = finalword + " kg";
          }
        break;
        case 6:
        if (weightValue == 6 && (_TextControl.text.isNotEmpty && kgvalue > 0)){
            finalword = finalword + " lbs";
          }
        break;
      }
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Weight On Planet X",
          style: new TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black38,
        centerTitle: true,
      ),
      backgroundColor: Colors.blueGrey,
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: new EdgeInsets.all(2.5),
          children: <Widget>[
            new Image.asset(
              'images/planet.png',
              width: 200,
              height: 133,
            ),
            new Container(
              margin: new EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _TextControl,
                    decoration: new InputDecoration(
                      labelText: "Your Weight on Earth",
                      hintText: "In pounds",
                      icon: new Icon(Icons.person_outline),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  new Padding(padding: new EdgeInsets.all(10.0)),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Radio<int>(value: 5, groupValue: weightValue, onChanged: metrik),
                      new Text("kg"),
                      new Radio<int>(value: 6, groupValue: weightValue, onChanged: metrik,),
                      new Text("lbs")
                    ],
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Radio<int>(
                          activeColor: Colors.brown,
                          value: 0, groupValue: radioValue, onChanged: radioOnChange),
                      new Text(
                        "Pluto",
                        style: new TextStyle(color: Colors.white),
                      ),
                      new Radio<int>(
                          activeColor: Colors.red,
                          value: 1, groupValue: radioValue, onChanged: radioOnChange),
                      new Text(
                        "Mars",
                        style: new TextStyle(color: Colors.white),
                      ),
                      new Radio<int>(
                          activeColor: Colors.orangeAccent,
                          value: 2, groupValue: radioValue, onChanged: radioOnChange),
                      new Text(
                        "Venus",
                        style: new TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  new Padding(padding: new EdgeInsets.all(15.5)),
                  new Text( finalword,
                  style: new TextStyle(color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 19.4),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
