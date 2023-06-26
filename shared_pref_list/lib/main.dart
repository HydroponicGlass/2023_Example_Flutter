import 'package:flutter/material.dart';
import 'shared_preferences_manager.dart';
import 'Data.dart';
import 'dart:convert';

// https://itsutkarsh2711.medium.com/saving-and-reading-class-lists-in-flutter-using-sharedpreferences-1f3ec5cb8cd8

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _textEditingController = TextEditingController();
  TextEditingController _textEditingController2 = TextEditingController();
  SharedPreferencesManager _sharedPreferencesManager = SharedPreferencesManager();
  List<Data> list = [];

  @override
  void initState(){
    super.initState();
    _sharedPreferencesManager.initialize();
  }

  // 데이터를 저장하는 함수
  Future<void> _saveData() async {
    list.add(Data(name: _textEditingController.text, age: _textEditingController2.text));
    List<String> tmpList = list.map((item) => jsonEncode(item.toMap())).toList();
    _sharedPreferencesManager.saveListData('key', tmpList);
    print(tmpList);
    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(content: Text('저장완료')),  // 저장 완료 메시지 출력
    // );
  }

  // 데이터를 로드하는 함수
  Future<void> _loadData() async {
    List<String> myData = await _sharedPreferencesManager.loadListData('key'); // 'myData' 키에 저장된 데이터 로드
    print(myData);
    if(myData != null){
      list = myData.map((item) => Data.fromMap(json.decode(item))).toList();
      list.forEach((element) {
        print('${element.name}, ${element.age}');
      });
    }

    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(content: Text('로드완료: $myData')), // 로드 완료 메시지와 함께 데이터 출력
    // );
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
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _textEditingController, // 입력한 데이터를 가져오기 위한 컨트롤러
              decoration: InputDecoration(
                hintText: '저장할 name을 입력하세요.', // 힌트 텍스트
              ),
            ),
            TextField(
              controller: _textEditingController2, // 입력한 데이터를 가져오기 위한 컨트롤러
              decoration: InputDecoration(
                hintText: '저장할 age를 입력하세요.', // 힌트 텍스트
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _saveData, // 데이터 저장 버튼
                  child: Text('저장하기'),
                ),
                ElevatedButton(
                  onPressed: _loadData, // 데이터 로드 버튼
                  child: Text('불러오기'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
