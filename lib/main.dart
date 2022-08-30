import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_app/service/fetchData.dart';

void main() async {
  fetchData();
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          //Top
          Top(),
          //Bottom
          Bottom(),
        ],
      ),
    );
  }
}

class MyAppBar extends StatelessWidget with PreferredSizeWidget{
  const MyAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {},
        icon: Icon(Icons.menu),
        color: Colors.white,
      ),
      title: Text(
        '동동동',
        style: TextStyle(color: Colors.white),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.search),
          color: Colors.white,
        ),
      ],
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class Top extends StatelessWidget {
  const Top({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Stack(
        children: [
          Positioned(
            child: Image.asset(
              'images/aaron-burden.jpg',
              fit: BoxFit.cover,
            ),
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
          ),
          SizedBox.expand(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '128°',
                  style: TextStyle(
                    fontSize: 80,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '습도, 비없음, 풍속',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Bottom extends StatelessWidget {
  const Bottom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              //Today Title
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Today',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '동, 구',
                    style: TextStyle(fontSize: 11),
                  ),
                ],
              ),
              //Time & Icon & celcius data Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //One cell widget
                  CellWidget(
                    date: 'Now',
                    icon: Icons.cloud,
                    celcious: '-130',
                  ),
                  CellWidget(
                    date: '10시',
                    icon: Icons.cloud,
                    celcious: '-130',
                  ),
                  CellWidget(
                    date: '11시',
                    icon: Icons.cloud,
                    celcious: '-130',
                  ),
                  CellWidget(
                    date: '12시',
                    icon: Icons.cloud,
                    celcious: '-130',
                  ),
                  CellWidget(
                    date: '13시',
                    icon: Icons.cloud,
                    celcious: '-130',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CellWidget extends StatelessWidget {
  CellWidget({
    Key? key,
    required this.date,
    required this.icon,
    required this.celcious,
  }) : super(key: key);
  String date;
  IconData icon;
  String celcious;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          FittedBox(child: Text(date),fit: BoxFit.scaleDown,),
          FittedBox(child: Icon(icon),fit: BoxFit.scaleDown,),
          FittedBox(child: Text('$celcious°'),fit: BoxFit.scaleDown,),
        ],
      ),
    );
  }
}