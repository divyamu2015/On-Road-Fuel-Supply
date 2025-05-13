// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocationDataModelAdapter extends TypeAdapter<LocationDataModel> {
  @override
  final int typeId = 0;

  @override
  LocationDataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocationDataModel(
      latitude: fields[0] as double,
      longitude: fields[1] as double,
    );
  }

  @override
  void write(BinaryWriter writer, LocationDataModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.latitude)
      ..writeByte(1)
      ..write(obj.longitude);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocationDataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
