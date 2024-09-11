import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:arshad_blocks_used/model/coinwithcoffemodel.dart';
import 'package:arshad_blocks_used/Ui/Chart/components/list.dart';

class LineChart extends StatefulWidget {
  const LineChart({Key? key}) : super(key: key);

  @override
  _LineChartState createState() => _LineChartState();
}

class _LineChartState extends State<LineChart> {
  List<CoinDataModel>? coinmarketdata;
  var coindata;

  @override
  void initState() {
    super.initState();
    fetchBitcoinMarketData();
  }

  Future<void> fetchBitcoinMarketData() async {
    try {
      final response = await http.get(
        Uri.parse('https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&sparkline=true'),
        headers: {
          'api-key': 'CG-uXyU5j8RmRF5hKJwnswDZe9z',
          'accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        var x = response.body;
        coinmarketdata = coinDataModelFromJson(x);
        setState(() {
          coindata = coinmarketdata;
        });
      } else {
        throw Exception('Failed to load Bitcoin stats: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching Bitcoin stats: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: coinmarketdata?.length ?? 0,
              itemBuilder: (context, index) {
                return Item(item: coinmarketdata![index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
