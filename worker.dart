import 'package:http/http.dart' as http;
import 'dart:convert';

class worker {
  String location;
  //Constructor
  worker({required this.location}) {}

  late String temp;
  late String humidity;
  late String air_speed;
  late String description;
  late String main;
  late String icon;
  //method
  Future<void> getData() async {
    try {
      http.Response response = await http.get(
        Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=fd722d64ef45cc1fefe1ff0540b702ca",
        ),
      );
      Map data = jsonDecode(response.body);

      print(data);
      //getting temp, humidity,
      Map temp_data = data['main'];
      String getHumidity = temp_data['humidity'].toString();
      double getTemp = temp_data['temp'] - 273.15;

      //getting air_spped
      Map wind = data['wind'];
      double getAir_speed = wind['speed'] / 0.277777777778;

      //getting Description
      List weather_data = data['weather'];
      Map weather_main_data = weather_data[0];
      String getMain_des = weather_main_data['main'];
      String getDesc = weather_main_data['description'];

      //Assigning values
      temp = getTemp.toString();
      humidity = getHumidity;
      air_speed = getAir_speed.toString();
      description = getDesc;
      main = getMain_des;
      icon = weather_main_data['icon'].toString();
    } catch (e) {
      temp = "NA";
      humidity = "NA";
      air_speed = "NA";
      description = "cant't find data";
      main = "NA";
      icon = "09n";
    }
  }
}
