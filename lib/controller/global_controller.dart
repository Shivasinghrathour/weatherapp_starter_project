import 'dart:ffi';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class GlobalController extends GetxController {
  // create various variable
  final RxBool _isLoding = true.obs;
  final RxDouble _lattitute = 0.0.obs;
  final RxDouble _longitute = 0.0.obs;

  // instence of these variable

  RxBool checkLoading() => _isLoding;
  RxDouble getLattitue() => _lattitute;
  RxDouble getLongitute() => _longitute;
  @override
  void onInit() {
    if (_isLoding.isTrue) {
      getLocation();
    }
    super.onInit();
  }

// for getting location of users
  getLocation() async {
    // bool variable bnaya jo check krega ki user location serviec de rha hai ki nhi
    bool isServiecEnabled;
    LocationPermission locationPermission;
    isServiecEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isServiecEnabled) {
      return Future.error("Location is not enabled");
    }
// status of permission
    locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error("Location permission are denied forever");
    } else if (locationPermission == LocationPermission.denied) {
      // request permission
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        return Future.error("Location permisson is denied");
      }
    }
    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((value) {
      _lattitute.value = value.latitude;
      _longitute.value = value.longitude;
      _isLoding.value = false;
    });
  }
}
