import 'package:flutter/material.dart';
import 'package:heal_me/model/app_model.dart';
import 'package:intl/intl.dart';

import 'colors.dart';

PreferredSizeWidget appBar() {
  return AppBar(
    centerTitle: true,
    leading: Container(
      width: 65,
      height: 65,
      child: Icon(Icons.widgets_outlined, color: Colors.black, size: 40),
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(10.0),
    ),
    title: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Text(
            "Current location",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
          ),
          Text(
            "Semarang, INA",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
    actions: [
      Container(
        width: 50,
        height: 50,
        child: Icon(Icons.person, color: Colors.black, size: 40),
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.all(10.0),
      ),
    ],
    elevation: 0,
    backgroundColor: Colors.transparent,
  );
}

Widget searchBar() {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
    ),
    width: double.infinity,
    padding: const EdgeInsets.only(left: 10),
    height: 50,
    child: Row(
      children: [
        Icon(Icons.search, color: AppColor.blue2, size: 35),
        SizedBox(width: 10),
        Text(
          "Search a doctor or health issue",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        )
      ],
    ),
  );
}

Widget appointmentCard(AppModel? model) {
  String strList = model!.date;
  var str = strList.split('-');
  String newStr = str[2] + "-" + str[1] + "-" + str[0];
  var pt = DateTime.parse(newStr);
  var format = DateFormat.MMMMd();
  var date = format.format(pt);
  print(date);

  return Stack(
    children: [
      Container(
        width: double.infinity,
        height: 150,
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: AppColor.blue2,
        ),
      ),
      Container(
        width: double.infinity,
        height: 150,
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
        ),
        child: Column(
          children: [
            ListTile(
              leading: Image.network(model.profilepic.toString(), height: 45),
              title: Text(
                model.name.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                model.speciality.toString(),
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Divider(),
            ),
            ListTile(
              leading: Icon(Icons.timer_outlined),
              title: Text(
                model.day.toString() + " " + date + " at " + model.timing.toString(),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    ],
  );
}

Widget tab1(int check) {
  return Container(
    width: 200,
    height: 45,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(40),
    ),
    child: Center(
      child: Text(
        "Upcoming",
        style: TextStyle(
          color: (check == 0) ? AppColor.blue2 : AppColor.blue1,
          fontWeight: FontWeight.w700,
          fontSize: 18,
        ),
      ),
    ),
  );
}

Widget tab2(int check) {
  return Container(
    width: 200,
    height: 45,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(40),
    ),
    child: Center(
      child: Text(
        "Completed",
        style: TextStyle(
          color: (check == 0) ? AppColor.blue1 : AppColor.blue2,
          fontWeight: FontWeight.w700,
          fontSize: 18,
        ),
      ),
    ),
  );
}
