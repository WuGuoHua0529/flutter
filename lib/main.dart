import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
      //   home: Scaffold(
      //     appBar: AppBar(
      //       title: Text('按鈕測試單元')
      //     ),
      //     body: HomePage(),
      // )
       home: MyHomePage(title: 'Example App'),
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
  bool _hasBeenPressed  = false;

  List<Color> _colors = <Color>[
    Colors.blue,
    Colors.red,
    Colors.black,
    Colors.green
  ];
  int _currentColorIndex = 0;

  void _inColorIndex () {
    setState(() {
      if (_currentColorIndex == 3) {
        _currentColorIndex = 0;
      } else {
        _currentColorIndex++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('按鈕測試單元')
      ),
    // body: Center(
    body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          // fittedBox 應用
          Container(
            color: Colors.blue,
            width: 130.0,
            height: 130.0,
            margin: EdgeInsets.only(bottom: 10.0),
            child: new FittedBox(
              fit: BoxFit.contain, //原圖大小
              // fit: BoxFit.cover, // 延伸填滿
              // fit: BoxFit.fill, //填滿容器
              // fit: BoxFit.scaleDown, // 縮小尺寸並保持長寬
              // fit: BoxFit.fitHeight, //填滿高度
              // fit: BoxFit.fitWidth, //填滿寬度
              // fit: BoxFit.none, //不動
              alignment: Alignment.topLeft,
              child: new Container(
                color: Colors.yellow,
                child: new Text("FittedBox"),
              ),
            ),
          ),
          Text(
            "BoxFit.contain",
            style: new TextStyle(fontSize: 20.0),
          ),
          // button應用
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow (
                  color: Colors.black54,
                  offset: Offset(2.0, 2.0),
                  blurRadius: 4.0
                )
              ],
              gradient: LinearGradient (
                colors: [Colors.red, Colors.blue]
              )
            ),
            child: Text(
              "漸層",
              style: TextStyle(color: Colors.red, fontSize: 30.0),
            ),
          ),
          Container(
            margin: EdgeInsets.all(200.0),
            // alignment: Alignment(-1.0, 0.0),
            // color: Colors.blue,
            child: 
              IconButton(
              icon: Icon(Icons.thumb_up),
              onPressed: () {},
            ),
          ),
          // 這邊加上對齊線功能
          Row (
            children: <Widget>[
              new Baseline(
                baseline: 200, //必填
                baselineType: TextBaseline.alphabetic, //必填
                child:
                Container ( // 加上內容寬度
                  width: 100.0,
                  child: Text(
                    'F1',
                    style: new TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ) 
              ),
              new Baseline(
                baseline: 200, //必填
                baselineType: TextBaseline.alphabetic, //必填
                child: Text(
                  'F2',
                  style: new TextStyle(
                    fontSize: 18.0,
                    textBaseline: TextBaseline.alphabetic
                  ),
                ),
              ),
              new Baseline(
                baseline: 200, //必填
                baselineType: TextBaseline.alphabetic, //必填
                child: FlutterLogo(
                  size: 100,
                )
              ),
            ],
          ),
          RaisedButton(
            textColor: Colors.blue,
            child: Text('raise按鈕'),
            onPressed: btnClickEvent, //按钮的回调，手指抬起时触发，点击或者长按都会触发。
          ),
          FlatButton(
            textColor:  _hasBeenPressed  ? Colors.black : Colors.blue,
            color: _hasBeenPressed  ? Colors.blue : Colors.red,
            child: Text('flat按鈕'),
            onPressed: () => {
              setState(() {
                _hasBeenPressed  = !_hasBeenPressed;
              }),
            },
          ),
          OutlineButton(
            child: Text('outline按鈕'),
            // color 不建議使用該風格按鈕改動被景色
            textColor: _colors[_currentColorIndex],
            onPressed: () => { _inColorIndex() },
            // onPressed: btnClickEvent,
          ),
          Container(
            // constraints: BoxConstraints.expand(),
            alignment: Alignment(1, 1),
            child: 
              FloatingActionButton(
                child: Text('+'),
                onPressed: btnClickEvent,
              ),
          ),
          Container(
            // alignment: Alignment.topLeft,
            constraints: BoxConstraints.expand(
              width:  100.0,
              height: 100.0,
            ),
            // constraints: BoxConstraints(
            //   maxHeight: 50.0,
            //   maxWidth: 50.0,
            //   minWidth: 50.0,
            //   minHeight: 50.0
            // ),
            child: 
              FloatingActionButton(
                child: Text('-'),
                onPressed: btnClickEvent,
              ),
          ),
        ],
      )),
    );
  }
}

void btnClickEvent () {
  print('click');
}
