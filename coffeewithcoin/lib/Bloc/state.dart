import 'package:coffeewithcoin/Model/coinmodel.dart';

abstract class CoinListState {}

class CoinListInitial extends CoinListState {}

class CoinListLoading extends CoinListState {}

class CoinListLoaded extends CoinListState {
  final List<CoinDataModel> coins;

  CoinListLoaded(this.coins);
}

class CoinListError extends CoinListState {
  final String error;

  CoinListError(this.error);
}
