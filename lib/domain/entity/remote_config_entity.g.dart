// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_config_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RemoteConfigEntityAdapter extends TypeAdapter<RemoteConfigEntity> {
  @override
  final int typeId = 1;

  @override
  RemoteConfigEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RemoteConfigEntity(
      mainUrl: fields[0] == null ? '' : fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, RemoteConfigEntity obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.mainUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RemoteConfigEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
