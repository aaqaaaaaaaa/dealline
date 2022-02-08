import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../styles/styles.dart';
import '../../widgets/bloc_card/card_grid_horizontal.dart';
import 'favorites_model.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  final _model = GroupsWidgetModel();

  @override
  Widget build(BuildContext context) {
    return GroupsWidgetModelProvider(
        model: _model, child: const _FavoriteBody());
  }
}

class _FavoriteBody extends StatelessWidget {
  const _FavoriteBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        padding: EdgeInsets.all(0),
                        onPressed: () => Navigator.pop(context),
                        icon: Image.asset(
                            'assets/images/icons/navigator_pop_icon.png')),
                    Text(
                      'Избранное',
                      style: TextStyle(color: Color(0xff2d2d2d), fontSize: 13),
                    ),
                    // Expanded(child: Card()),
                  ],
                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14),
                  child: Image.asset('assets/images/icons/poopup_menu.png'))
            ],
          ),
        ),
        body: _ElementCardListWidget());
  }
}

class _ElementCardListWidget extends StatelessWidget {
  const _ElementCardListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final groupCount =
        GroupsWidgetModelProvider.watch(context)?.model.groups.length ?? 0;

    return ListView.builder(
        controller: controller,
        scrollDirection: Axis.vertical,
        itemCount: groupCount,
        itemBuilder: (context, int index) {
          return _ElementCardListRowWidget(
            indexInList: index,
          );
        });
  }
}

class _ElementCardListRowWidget extends StatelessWidget {
  const _ElementCardListRowWidget({
    Key? key,
    required this.indexInList,
  }) : super(key: key);
  final int indexInList;

  @override
  Widget build(BuildContext context) {
    final model = GroupsWidgetModelProvider.read(context)?.model;
    final group =
        GroupsWidgetModelProvider.read(context)!.model.groups[indexInList];
    return Slidable(
      direction: Axis.horizontal,
      endActionPane: ActionPane(
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            flex: 1,
            onPressed: (context) => model?.deleteGroup(indexInList),
            backgroundColor: primaryColor,
            foregroundColor: Colors.white,
            icon: Icons.delete_outline,
            label: 'Delete',
          ),
        ],
      ),
      child: Card(
        child: ListTile(
          title: Text(group.name),
          subtitle: Text('${group.price} сум'),
          leading: Image.asset(group.image),
        ),
      ),
    );
  }
}
