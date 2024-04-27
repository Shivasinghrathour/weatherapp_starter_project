import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp_starter_project/controller/global_controller.dart';

class HeaderWigget extends StatefulWidget {
  const HeaderWigget({super.key});

  @override
  State<HeaderWigget> createState() => _HeaderWiggetState();
}

class _HeaderWiggetState extends State<HeaderWigget> {
  // city name
  String city = "";
  // for date
  String date = DateFormat("yMMMMd").format(DateTime.now());
  // global controller insilice
  GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  void initState() {
    getAddress(globalController.getLattitue().value,
        globalController.getLongitute().value);
    super.initState();
  }

// for get city name funtion
  getAddress(lat, lon) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, lon);

    Placemark placemark = placemarks[0];
    setState(() {
      city = placemark.locality!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // city name
        Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          alignment: Alignment.topLeft,
          child: Text(
            city,
            style: const TextStyle(
                fontSize: 35, fontWeight: FontWeight.w700, height: 2),
          ),
        ),
        // time
        Container(
          margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
          alignment: Alignment.topLeft,
          child: Text(
            date,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[700],
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}
