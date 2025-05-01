// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package_details_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PackageDetailsDBAdapter extends TypeAdapter<PackageDetailsDB> {
  @override
  final int typeId = 2;

  @override
  PackageDetailsDB read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PackageDetailsDB(
      packageId: fields[0] as String?,
      bookingTypeId: fields[1] as String?,
      startDate: fields[2] as DateTime?,
      endDate: fields[3] as DateTime?,
      totalAmount: fields[4] as double?,
      cruiseImage: fields[5] as String?,
      cruiseName: fields[6] as String?,
      packageName: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PackageDetailsDB obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.packageId)
      ..writeByte(1)
      ..write(obj.bookingTypeId)
      ..writeByte(2)
      ..write(obj.startDate)
      ..writeByte(3)
      ..write(obj.endDate)
      ..writeByte(4)
      ..write(obj.totalAmount)
      ..writeByte(5)
      ..write(obj.cruiseImage)
      ..writeByte(6)
      ..write(obj.cruiseName)
      ..writeByte(7)
      ..write(obj.packageName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PackageDetailsDBAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
