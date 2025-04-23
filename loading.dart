import 'package:flutter/material.dart';
import 'package:mausam_app/Worker/worker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  late String city = "noida";
  late String temp;
  late String hum;
  late String air_speed;
  late String des;
  late String main;
  late String icon;
  void startApp(String city) async {
    worker instance = worker(location: city);
    await instance.getData();

    temp = instance.temp;
    hum = instance.humidity;
    air_speed = instance.air_speed;
    des = instance.description;
    main = instance.main;
    icon = instance.main;
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(
        context,
        '/home',
        arguments: {
          "temp_value": temp,
          "hum_value": hum,
          "air_speed_value": air_speed,
          "des_value": des,
          "main_value": main,
          "icon_value": icon,
          "city_value": city,
        },
      );
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map? search = ModalRoute.of(context)!.settings.arguments as Map?;

    if (search?.isNotEmpty ?? false) {
      city = search?['searchText'];
    }
    startApp(city);

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 200),
              Image.asset("images/wlogo.png", width: 130, height: 130),
              Text(
                "Weather App",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 2),
              Text(
                "Made by Vineet",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w200,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              SpinKitWave(color: Colors.white, size: 50.0),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.blue[400],
    );
  }
}
