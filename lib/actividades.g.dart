// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actividades.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ActividadesAdapter extends TypeAdapter<Actividades> {
  @override
  final int typeId = 1;

  @override
  Actividades read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Actividades(
      date: fields[0] as DateTime,
      totdist: fields[1] as double,
      recorr: (fields[2] as Set).cast<Polyline>(),
      dur: fields[3] as Duration,
      user: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Actividades obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.totdist)
      ..writeByte(2)
      ..write(obj.recorr.toList())
      ..writeByte(3)
      ..write(obj.dur)
      ..writeByte(4)
      ..write(obj.user);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ActividadesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
