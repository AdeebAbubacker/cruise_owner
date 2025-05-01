// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_details_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserDetailsDBAdapter extends TypeAdapter<UserDetailsDB> {
  @override
  final int typeId = 1;

  @override
  UserDetailsDB read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserDetailsDB(
      name: fields[0] as dynamic,
      email: fields[1] as String,
      phone: fields[2] as dynamic,
      image: fields[3] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, UserDetailsDB obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.phone)
      ..writeByte(3)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserDetailsDBAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
