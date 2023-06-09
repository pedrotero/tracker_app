// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'segment.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SegmentAdapter extends TypeAdapter<Segment> {
  @override
  final int typeId = 2;

  @override
  Segment read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Segment(
      nombre: fields[2] as String,
      origen: (fields[0] as Map).cast<String, double>(),
      destino: (fields[1] as Map).cast<String, double>(),
      record: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Segment obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.origen)
      ..writeByte(1)
      ..write(obj.destino)
      ..writeByte(2)
      ..write(obj.nombre)
      ..writeByte(3)
      ..write(obj.record);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SegmentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
