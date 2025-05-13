// import 'package:hive/hive.dart';
// part 'add_location.g.dart';

// @HiveType(typeId: 0,)
// class AddLocationData {
//   @HiveField(0)
//   List<String> Longitude;
//   @HiveField(1)
//   List<String> Latitude;
//   AddLocationData({required this.Latitude,required this.Longitude});
// }


import 'package:hive/hive.dart';

part 'add_location.g.dart';

@HiveType(typeId: 0, adapterName: "TrackInfoAdapter")
class TrackInfo {
  @HiveField(0)
  String trackFlag;
  @HiveField(1)
  String trackInterWell;

  TrackInfo({required this.trackFlag, required this.trackInterWell});
}
