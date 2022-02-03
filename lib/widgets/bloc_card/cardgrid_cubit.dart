import 'package:bloc/bloc.dart';
import 'package:dealline/widgets/bloc_card/card_grid_horizontal.dart';
import 'package:meta/meta.dart';

part 'cardgrid_state.dart';

class CardGridCubit extends Cubit<CardGridState> {
  List<CardInGridViewHorizontal> category;
  CardGridCubit({required this.category}) : super(CardGridInitial(cardState: category));
}
