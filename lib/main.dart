import 'package:flutter/material.dart';
import 'package:web/api/apiService.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CurrentTime time = new CurrentTime();

  @override
  void initState() {
    super.initState();
    time.getTime();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            backgroundColor: Colors.amber[100],
            appBar: AppBar(
              title: Text(
                "Time",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            body: Center(
              child: Text(
                "Standard : ${time.abbreviation}\n" +
                    "IP : ${time.client_ip}\n" +
                    "Time : ${time.datetime}\n" +
                    "Day of Week : ${time.day_of_week}\n" +
                    "Day of Year : ${time.day_of_year}\n" +
                    "Time Zone : ${time.timezone}\n" +
                    "Unix Time : ${time.unixtime}\n" +
                    "UTC Time : ${time.utc_datetime}\n" +
                    "UTC Offset :${time.utc_offset}\n" +
                    "Week Number : ${time.week_number}\n" +
                    "Time : ${time.time}",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
      future: time.getTime(),
    );
  }
}
