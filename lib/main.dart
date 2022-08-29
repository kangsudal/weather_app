import 'package:flutter/material.dart';

void main() {
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
      appBar: AppBar(
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
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          //Top
          Expanded(
            flex: 3,
            child: Stack(
              children: [
                Positioned(
                  child: Image.asset('images/aaron-burden.jpg'),
                  top: 0,
                  left: 0,
                  right: 0,
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
          ),
          //Bottom
          Expanded(
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
                        //One cell
                        Column(
                          children: [
                            Text('Now'),
                            Icon(Icons.wb_sunny_outlined),
                            Text('-120°')
                          ],
                        ),
                        Column(
                          children: [
                            Text('Now'),
                            Icon(Icons.wb_sunny_outlined),
                            Text('-120°')
                          ],
                        ),
                        Column(
                          children: [
                            Text('Now'),
                            Icon(Icons.wb_sunny_outlined),
                            Text('-120°')
                          ],
                        ),
                        Column(
                          children: [
                            Text('Now'),
                            Icon(Icons.wb_sunny_outlined),
                            Text('-120°')
                          ],
                        ),
                        Column(
                          children: [
                            Text('Now'),
                            Icon(Icons.wb_sunny_outlined),
                            Text('-120°')
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
