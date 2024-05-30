// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HistoryModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HistoryModelAdapter extends TypeAdapter<HistoryModel> {
  @override
  final int typeId = 1;

  @override
  HistoryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HistoryModel(
      hotelId: fields[1] as int,
      fromDate: fields[2] as DateTime,
      toDate: fields[3] as DateTime,
      time: fields[4] as TimeOfDay,
      roomType: fields[5] as String,
      roomPrice: fields[6] as String,
      totalPrice: fields[7] as String,
    )..id = fields[0] as String?;
  }

  @override
  void write(BinaryWriter writer, HistoryModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.hotelId)
      ..writeByte(2)
      ..write(obj.fromDate)
      ..writeByte(3)
      ..write(obj.toDate)
      ..writeByte(4)
      ..write(obj.time)
      ..writeByte(5)
      ..write(obj.roomType)
      ..writeByte(6)
      ..write(obj.roomPrice)
      ..writeByte(7)
      ..write(obj.totalPrice);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HistoryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
