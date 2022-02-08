part of 'market_cubit.dart';

class MarketState {
  late List<MagzinModel> markets;
  TextEditingController? filter = TextEditingController();
  late String? title;
  late String? region;
  MarketState({this.filter, required this.markets, this.title, this.region});
}
