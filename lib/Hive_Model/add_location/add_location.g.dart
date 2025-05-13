// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_location.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TrackInfoAdapter extends TypeAdapter<TrackInfo> {
  @override
  final int typeId = 0;

  @override
  TrackInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TrackInfo(
      trackFlag: fields[0] as String,
      trackInterWell: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TrackInfo obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.trackFlag)
      ..writeByte(1)
      ..write(obj.trackInterWell);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TrackInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
