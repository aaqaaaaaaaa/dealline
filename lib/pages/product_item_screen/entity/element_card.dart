import 'package:hive/hive.dart';

// part 'group.g.dart';
part 'element_card.g.dart';
@HiveType(typeId: 1)
class ElementCard {
  @HiveField(0)
  String name;
  @HiveField(1)
  String image;
  @HiveField(2)
  String description;
  @HiveField(3)
  String price;

  ElementCard({
    required this.name,
    required this.image,
    required this.description,
    required this.price,
  });
}
