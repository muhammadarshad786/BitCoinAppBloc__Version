import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:coffeewithcoin/Model/coinmodel.dart';

class CoinGeckoService {
  static const baseUrl = 'https://api.coingecko.com/api/v3/coins/markets';

   Future<List<CoinDataModel>> fetchCoinData() async {
    final url = Uri.parse('$baseUrl?vs_currency=usd&sparkline=true');
    final response = await http.get(url);
   

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as String;
      return coinDataModelFromJson(json);
    } else {
      throw Exception('Failed to load coins');
    }
  }
}
