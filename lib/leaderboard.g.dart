// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leaderboard.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LeaderboardAdapter extends TypeAdapter<Leaderboard> {
  @override
  final int typeId = 3;

  @override
  Leaderboard read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Leaderboard(
      dur: fields[0] as int,
      user: fields[1] as String,
      segment: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Leaderboard obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.dur)
      ..writeByte(1)
      ..write(obj.user)
      ..writeByte(2)
      ..write(obj.segment);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LeaderboardAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
