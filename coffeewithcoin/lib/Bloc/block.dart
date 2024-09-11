import 'package:bloc/bloc.dart';
import 'package:coffeewithcoin/Bloc/event.dart';
import 'package:coffeewithcoin/Bloc/state.dart';
import 'package:coffeewithcoin/Model/coinmodel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;


enum Status { loading, successful, error }

class CoinListBloc extends Bloc<CoinListEvent, CoinListState> {
  CoinListBloc() : super(CoinListInitial());

  @override
  Stream<CoinListState> mapEventToState(CoinListEvent event) async* {
    if (event is FetchCoinData) {
      yield CoinListLoading();
      try {
        final url = Uri.parse(
            'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&sparkline=true');
        final headers = {
          'Accepts': 'application/json',
          'X-API-Key': 'CG-uXyU5j8RmRF5hKJwnswDZe9z' // Replace with your API key
        };

        final response = await http.get(url, headers: headers);

        if (response.statusCode == 200) {
          final jsonResponse = convert.jsonDecode(response.body);
          final coins = List<CoinDataModel>.from(
              jsonResponse.map((data) => CoinDataModel.fromJson(data)));
          yield CoinListLoaded(coins);
        } else {
          final errorMessage =
              response.reasonPhrase ?? 'Error: ${response.statusCode}';
          yield CoinListError(errorMessage);
        }
      } catch (error) {
        yield CoinListError(error.toString());
      }
    }
  }
}





