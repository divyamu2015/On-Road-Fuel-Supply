import 'package:hive/hive.dart';

import 'location_hive.dart';

class LocationDataService {
  final String _boxName = 'locationDataBox';

  Future<void> saveLocationData(LocationDataModel data) async {
    final box = await Hive.openBox<LocationDataModel>(_boxName);
    await box.add(data);
  }

  List<LocationDataModel> getLocationDataList() {
    final box = Hive.box<LocationDataModel>(_boxName);
    return box.values.toList();
  }
}




