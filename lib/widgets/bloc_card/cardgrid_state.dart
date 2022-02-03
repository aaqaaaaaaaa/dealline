part of 'cardgrid_cubit.dart';

@immutable
abstract class CardGridState {
  late List<CardInGridViewHorizontal> cardState;
  CardGridState({required this.cardState});
}

class CardGridInitial extends CardGridState {
  CardGridInitial({required List<CardInGridViewHorizontal> cardState}) : super(cardState: cardState);
  // late List<CardInGridViewHorizontal> cardState;
  // CardGridInitial({required this.cardState});
}
// class CardGridLoadingInitial extends CardGridState {}
// // class CardGridLoadedInitial extends CardGridState {
// //   late List<CardInGridViewHorizontal> cardState;
// //   CardGridLoadedInitial({required this.cardState});
// // }
// class CardGridFailedInitial extends CardGridState {}
