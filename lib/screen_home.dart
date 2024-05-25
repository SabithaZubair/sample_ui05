import 'package:flutter/material.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> with TickerProviderStateMixin {
  late AnimationController controller;
  List leadingiconlist = [
    CircleAvatar(
        backgroundColor: Colors.red.shade600,
        child: Icon(
          Icons.alarm,
          color: Colors.white,
          size: 18,
        )),
    CircleAvatar(
        backgroundColor: Colors.yellow.shade800,
        child: Icon(
          Icons.notes_rounded,
          color: Colors.white,
          size: 18,
        )),
    CircleAvatar(
        backgroundColor: Color.fromARGB(255, 90, 1, 185),
        child: Icon(
          Icons.done_outline_rounded,
          color: Colors.white,
          size: 18,
        )),
  ];
  List titleList = ['To Do', 'In Progress', 'Done'];
  List subTitleList = [
    '5 tasks now. 1 started',
    '1 tasks now, 1 started',
    '18 tasks now. 13 started'
  ];
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
    Color.fromARGB(255, 218, 6, 77),
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
      appBar: AppBar(
        backgroundColor: Colors.orange.shade200,
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 0.0),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.menu,
                ),
                Icon(
                  Icons.search,
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 180,
            decoration: BoxDecoration(
                color: Colors.orange.shade200,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(35),
                    bottomRight: Radius.circular(35))),
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Center(
                child: ListTile(
                  leading: Container(
                    width: 70,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 9,
                          top: 7,
                          child: ClipOval(
                            child: Image.network(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSmCicxernIb5W2jIRbjKwiMOVIit_7XJtczA&usqp=CAU',
                              width: 49,
                              height: 49,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 17,
                          top: 15,
                          child: SizedBox(
                            height: 33,
                            width: 33,
                            child: Transform.scale(
                              scale: 2,
                              child: CircularProgressIndicator(
                                value: controller.value,
                                semanticsLabel: 'Circular progress indicator',
                                strokeWidth: 2.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  title: Text(
                    'Sourav Suman',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  subtitle: Text(
                    'App Developer',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black38),
                  ),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'My Tasks',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                CircleAvatar(
                  radius: 22,
                  backgroundColor: Color.fromARGB(255, 22, 125, 144),
                  child: Icon(
                    Icons.date_range,
                    color: Colors.white,
                    size: 21,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: ListView.builder(
                itemCount: 3,
                itemBuilder: (BuildContext context, index) {
                  return ListTile(
                    leading: leadingiconlist[index],
                    title: Text(
                      titleList[index],
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                    ),
                    subtitle: Text(subTitleList[index],
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            color: Colors.black38)),
                  );
                }),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 210),
            child: Text(
              'Active Projects',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
            ),
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
