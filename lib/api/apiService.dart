import 'dart:convert';
import 'package:http/http.dart';

class CurrentTime {
  var abbreviation;
  var client_ip;
  var datetime;
  var day_of_week;
  var day_of_year;
  var timezone;
  var unixtime;
  var utc_datetime;
  var utc_offset;
  var week_number;
  var time;

  setData(Map<String, dynamic> data) async {
    week_number = data["week_number"];
    timezone = data["timezone"];
    day_of_week = data["day_of_week"];
    day_of_year = data["day_of_year"];
    datetime = data["datetime"];
    abbreviation = data["abbreviation"];
    client_ip = data["client_ip"];
    unixtime = data["unixtime"];
    utc_offset = data["utc_offset"];
    utc_datetime = data["utc_datetime"];
  }

  final url = "http://worldtimeapi.org/api/ip";

  Future<void> getTime() async {
    try {
      final response = await get(url);
      final data = jsonDecode(response.body);
      setData(data);
      time = DateTime.parse(datetime);
    } catch (e) {
      print(e.toString());
    }
  }
}
