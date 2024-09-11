import 'dart:convert';

import 'package:coffeewithcoin/Model/coinmodel.dart';
import 'package:coffeewithcoin/Service/apiservice.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart ' as http;



class CoinListViewModel with ChangeNotifier {
  List<CoinDataModel> _coins = [];
  bool _isLoading = false;

  List<CoinDataModel> get coins => _coins; // Public getter for coins
  bool get isLoading => _isLoading; // Public getter for isLoading

  // Instance method (not static)
  Future<void> fetchCoinData() async {
    _isLoading = true;
    notifyListeners(); // Notify listeners about loading state change

    try {
      final url = Uri.parse('${CoinGeckoService.baseUrl}?vs_currency=usd&sparkline=true');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as List<dynamic>;
        _coins = json.map((e) => CoinDataModel.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load coins (Status Code: ${response.statusCode})');
      }
    } catch (error) {
      print(error); // Log error for debugging
    } finally {
      _isLoading = false;
      notifyListeners(); // Notify listeners about loading state change
    }
  }
}

