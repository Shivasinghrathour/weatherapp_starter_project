import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:weatherapp_starter_project/controller/global_controller.dart';

class HeaderWigget extends StatefulWidget {
  const HeaderWigget({super.key});

  @override
  State<HeaderWigget> createState() => _HeaderWiggetState();
}

class _HeaderWiggetState extends State<HeaderWigget> {
  // city name
  String city = "";
  GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  void initState() {
    getAddress(globalController.getLattitue().value,
        globalController.getLongitute().value);
    super.initState();
  }

// for get city name funtion
  getAddress(lat, Lon) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, Lon);

    Placemark placemark = placemarks[0];
    setState(() {
      city = placemark.locality!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(city),
    );
  }
}
