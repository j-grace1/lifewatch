import 'package:flutter/material.dart';

import 'TestFile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProgressIndicatorExample(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  TextEditingController AgeController = TextEditingController();

  String dropdownvalue = 'Years';

  @override
  Widget build(BuildContext context) {
    int dateTimeNowYear = DateTime.now().year;
    int dateTimeNowMonth = DateTime.now().month;
    int dateTimeNowDay = DateTime.now().day;
    int dateTimeNowHour = DateTime.now().hour;
    int dateTimeNowMinutes = DateTime.now().minute;
    int dateTimeNowSeconds = DateTime.now().second;
    var items = [
      'Years',
      'Hours',
      'Minutes',
      'Seconds',
    ];

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(
          widget.title,
          style: TextStyle(fontSize: 30),
        ),
        centerTitle: true,
        backgroundColor: Colors.brown,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Image.asset(
                    'assets/images/LifeClockReal.jpeg',
                    width: 300,
                  ),
                ),
                SizedBox(
                  height: 0,
                ),
                SizedBox(
                  width: 150,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Get Started'),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.brown),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LifeWatchCountDisplay extends StatefulWidget {
  const LifeWatchCountDisplay({Key? key}) : super(key: key);

  @override
  State<LifeWatchCountDisplay> createState() => _LifeWatchCountDisplayState();
}

class _LifeWatchCountDisplayState extends State<LifeWatchCountDisplay> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  TextEditingController AgeController = TextEditingController();

  String dropdownvalue = 'Years';

  @override
  Widget build(BuildContext context) {
    int dateTimeNowYear = DateTime.now().year;
    int dateTimeNowMonth = DateTime.now().month;
    int dateTimeNowDay = DateTime.now().day;
    int dateTimeNowHour = DateTime.now().hour;
    int dateTimeNowMinutes = DateTime.now().minute;
    int dateTimeNowSeconds = DateTime.now().second;
    var items = [
      'Years',
      'Hours',
      'Minutes',
      'Seconds',
    ];

    return Container(
      padding: EdgeInsets.fromLTRB(40, 20, 40, 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Colors.brown.shade200, spreadRadius: 1, blurRadius: 15)
          ]),
      child: Column(
        children: [
          Text(
            "What's you least life Expectancy?",
            style: TextStyle(fontSize: 17),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(40, 0, 40, 10),
            child: TextField(
              controller: AgeController,
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 25),
              textAlign: TextAlign.center,
            ),
          ),
          DropdownButton(
            // Initial Value
            value: dropdownvalue,
            style: TextStyle(fontSize: 20, color: Colors.brown),

            // Down Arrow Icon
            icon: const Icon(Icons.keyboard_arrow_down),

            // Array list of items
            items: items.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            // After selecting the desired option,it will
            // change button value to selected value
            onChanged: (String? newValue) {
              setState(() {
                dropdownvalue = newValue!;
              });
            },
          ),
          SizedBox(
            height: 20,
          ),
          const Text(
            'You have pushed the button this many times:',
          ),
          Text(
            '$dateTimeNowHour hrs : $dateTimeNowMinutes min : $dateTimeNowSeconds Sec',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }
}

class LifeWatchSettingsForm extends StatefulWidget {
  const LifeWatchSettingsForm({Key? key}) : super(key: key);

  @override
  State<LifeWatchSettingsForm> createState() => _LifeWatchSettingsFormState();
}

class _LifeWatchSettingsFormState extends State<LifeWatchSettingsForm> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
