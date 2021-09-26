import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heal_me/constants/colors.dart';
import 'package:heal_me/constants/widgets.dart';
import 'package:heal_me/services/app_service.dart';

import 'model/app_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Heal-Me Task',
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int sharedValue = 0;

  @override
  Widget build(BuildContext context) {
    Map<int, Widget> widgets = <int, Widget>{
      0: tab1(sharedValue),
      1: tab2(sharedValue),
    };
    Map<int, Widget> futures = <int, Widget>{
      0: FutureBuilder<List<AppModel>?>(
        future: NetworkCallService().getUpcoming(),
        builder: (BuildContext context, AsyncSnapshot<List<AppModel>?> snapshot) {
          if (snapshot.hasData) {
            List<AppModel>? model = snapshot.data;
            return ListView.builder(
              itemCount: model!.length,
              itemBuilder: (_, i) {
                return appointmentCard(model[i]);
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      1: FutureBuilder<List<AppModel>?>(
        future: NetworkCallService().getCompleted(),
        builder: (BuildContext context, AsyncSnapshot<List<AppModel>?> snapshot) {
          if (snapshot.hasData) {
            List<AppModel>? model = snapshot.data;
            return ListView.builder(
              itemCount: model!.length,
              itemBuilder: (_, i) {
                return appointmentCard(model[i]);
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    };
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: appBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 35.0, top: 35, right: 35.0, bottom: 5.0),
        child: Column(
          children: [
            searchBar(),
            SizedBox(height: 30),
            CupertinoSegmentedControl(
              children: widgets,
              onValueChanged: (int val) {
                setState(() {
                  sharedValue = val;
                });
              },
              groupValue: sharedValue,
              selectedColor: AppColor.blue1,
              unselectedColor: AppColor.blue2,
              padding: EdgeInsets.all(10),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Container(child: futures[sharedValue]),
            ),
          ],
        ),
      ),
    );
  }
}
