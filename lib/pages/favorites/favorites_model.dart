import 'package:dealline/pages/product_item_screen/entity/element_card.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class GroupsWidgetModel extends ChangeNotifier {
  var _groupList = <ElementCard>[];

  GroupsWidgetModel() {
    _setUp();
  }

  List<ElementCard> get groups => _groupList.toList();

  void _groupListenable(Box<ElementCard> box) {
    _groupList = box.values.toList();
    notifyListeners();
  }

  void deleteGroup(int indexGroup) async {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(ElementCardAdapter());
    }
    final box = await Hive.openBox<ElementCard>('group_box');
    await box.deleteAt(indexGroup);
    _groupList = box.values.toList();
  }

  void _setUp() async {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(ElementCardAdapter());
    }
    final box = await Hive.openBox<ElementCard>('group_box');
    box.listenable().addListener(() => _groupListenable(box));
    _groupListenable(box);

    _groupList = box.values.toList();
  }

  void showForm(BuildContext context) {
    Navigator.pushNamed(context, '/groups/form');
  }
}

class GroupsWidgetModelProvider extends InheritedNotifier {
  final GroupsWidgetModel model;

  const GroupsWidgetModelProvider({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(key: key, child: child, notifier: model);

  static GroupsWidgetModelProvider? watch(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<GroupsWidgetModelProvider>();
  }

  static GroupsWidgetModelProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<GroupsWidgetModelProvider>()
        ?.widget;
    return widget is GroupsWidgetModelProvider ? widget : null;
  }
}
