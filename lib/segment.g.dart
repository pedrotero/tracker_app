// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'segment.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class segmentAdapter extends TypeAdapter<segment> {
  @override
  final int typeId = 2;

  @override
  segment read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return segment(
      user: fields[2] as String,
      origen: fields[0] as double,
      destino: fields[1] as double,
    );
  }

  @override
  void write(BinaryWriter writer, segment obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.origen)
      ..writeByte(1)
      ..write(obj.destino)
      ..writeByte(2)
      ..write(obj.user);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is segmentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
