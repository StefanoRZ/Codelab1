import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


void main() {
  runApp(HorizonsApp());
}

class HorizonsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      scrollBehavior: const ConstantScrollBehavior(),
      title: 'Horizons Weather',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Horizons'),
          backgroundColor: Colors.teal[800],
        ),
        body: WeeklyForecastList(),
      ),
    );
  }
}

class WeeklyForecastList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DateTime currentDate = DateTime.now();
    final TextTheme textTheme = Theme.of(context).textTheme;
 
    return ListView.builder(
      itemCount: 7,
      itemBuilder: (BuildContext context, int index) {
        final DailyForecast dailyForecast = 
        Server.getDailyForecastByID(index);
        return Card(
          child: Row(
              children: <Widget>[
               Text(
               dailyForecast.getData(currentDate.day).toString(),
               style: textTheme.headline4,
               ),
                 Column(
                  children:<Widget> [

                  ],
                 ),
               Text(
              '${dailyForecast.highTemp} | ${dailyForecast.lowTemp}F',

              style: textTheme.subtitle2,
            ),
          ],

            ),
          );
      }
      );
  }
}


class DailyForecast {
  // Define properties and methods for DailyForecast
}

class Server {
  static List<DailyForecast> getDailyForecastList() {
    // Implement your logic to fetch daily forecasts
    return [];
  }
}
