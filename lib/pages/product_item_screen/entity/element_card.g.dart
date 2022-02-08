// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'element_card.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ElementCardAdapter extends TypeAdapter<ElementCard> {
  @override
  final int typeId = 1;

  @override
  ElementCard read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ElementCard(
      name: fields[0] as String,
      image: fields[1] as String,
      description: fields[2] as String,
      price: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ElementCard obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.price);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ElementCardAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
