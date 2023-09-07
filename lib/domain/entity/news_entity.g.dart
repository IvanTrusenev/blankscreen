// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NewsEntityAdapter extends TypeAdapter<NewsEntity> {
  @override
  final int typeId = 4;

  @override
  NewsEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NewsEntity(
      status: fields[0] == null ? '' : fields[0] as String,
      totalResults: fields[1] == null ? 0 : fields[1] as int,
      articles: fields[2] == null
          ? []
          : (fields[2] as List).cast<NewsArticleEntity>(),
    );
  }

  @override
  void write(BinaryWriter writer, NewsEntity obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.status)
      ..writeByte(1)
      ..write(obj.totalResults)
      ..writeByte(2)
      ..write(obj.articles);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NewsEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
