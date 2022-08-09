import 'package:flutter/material.dart';
import '../utilities/constants.dart';
import 'package:clime_weather/services/weather.dart';

import 'city_screen.dart';

class LocationScreen extends StatefulWidget {
  final locationWeather;
  const LocationScreen({this.locationWeather});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

     late int temperature;
    late String weatherIcon ;
    late String weatherMessage;
    String? cityName;
    WeatherModel weather = WeatherModel();


  @override
  void initState() {
    // TODO: implement initState
    // print(widget.locationWeather);
    updateUI(widget.locationWeather);
    super.initState();
    // print(widget.locationWeather);
    // updateUI(widget.locationWeather);

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
         constraints: const BoxConstraints.expand(),
        child: SafeArea(
          maintainBottomViewPadding: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
             crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async{
                      var weatherData = await weather.getLocationWeather();
                      updateUI(weatherData);
                    },
                    child: const Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () async   {
                     var typedName = await Navigator.push(context, MaterialPageRoute(builder: (context){
                        return CityScreen();
                      },
                     ),
                     );
                     if(typedName != null){
                      var weatherData = weather.getCityWeather(typedName);
                      updateUI(weatherData);
                     }
                    },
                    child: const Icon(
                      Icons.map,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                     Text(
                      weatherIcon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
               Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Text(
                  '$weatherMessage in $cityName',
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
    void updateUI(dynamic weatherData) {
      setState(() {
        if (weatherData == null) {
          temperature = 0;
          weatherIcon = 'Error';
          weatherMessage = 'Unable to get weather data';
          cityName = '';
          return;
        }
        double temp =  weatherData['main']['temp'];
        temperature = temp.toInt();
        var condition = weatherData['weather'][0]['id'];
        weatherIcon = weather.getWeatherIcon(condition);
        weatherMessage = weather.getMessage(temperature);
        cityName = weatherData['name'];
      });

    }
}

// json['price'] == null ? 0.0 : json['price'].toDouble()

