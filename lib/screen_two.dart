import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ScreenTwo extends StatefulWidget {
  const ScreenTwo({super.key});

  @override
  State<ScreenTwo> createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> with TickerProviderStateMixin {
  late AnimationController controller;
  List gridtext = [
    'Medical App',
    'Making History Notes',
    'Medical App',
    'Making History Notes'
  ];
  List gridtextLine2 = [
    '9 hours progress',
    '20 hours progress',
    '9 hours progress',
    '20 hours progress'
  ];
  List gridColor = [
    Color.fromARGB(255, 2, 102, 119),
    const Color.fromARGB(255, 175, 5, 62),
    Colors.yellow.shade600,
    Colors.blue
  ];

  @override
  void initState() {
    controller = AnimationController(
      /// [AnimationController]s can be created with `vsync: this` because of
      /// [TickerProviderStateMixin].
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: Container(
                      height: 100,
                      width: 100,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 5,
                            top: 5,
                            child: ClipOval(
                              child: Image.network(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSmCicxernIb5W2jIRbjKwiMOVIit_7XJtczA&usqp=CAU',
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            height: 60,
                            width: 60,
                            child: CircularProgressIndicator(
                              value: controller.value,
                              semanticsLabel: 'Circular progress indicator',
                              strokeWidth: 2.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    title: Text(
                      'Sourav Suman',
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    subtitle: Text(
                      'App Developer',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black38),
                    ),
                  );
                }),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: List.generate(
                4,
                (index) {
                  return Container(
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: gridColor[index],
                    ),
                    margin: const EdgeInsets.all(10),
                    child: Center(
                        child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Stack(
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  value: controller.value,
                                  semanticsLabel: 'Circular progress indicator',
                                  strokeWidth: 2.0,
                                ),
                              ),
                              Positioned(
                                left: 15,
                                top: 20,
                                child: Text(
                                  '25%',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          gridtext[index],
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        Text(
                          gridtextLine2[index],
                          style: TextStyle(
                              color: Colors.white38,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                      ],
                    )),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
