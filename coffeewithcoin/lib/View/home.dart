import 'package:coffeewithcoin/Bloc/block.dart';
import 'package:coffeewithcoin/Bloc/event.dart';
import 'package:coffeewithcoin/Bloc/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoinListWidget extends StatefulWidget {
  const CoinListWidget({super.key});

  @override
  CoinListWidgetState createState() => CoinListWidgetState();
}

class CoinListWidgetState extends State<CoinListWidget> {
  final _bloc = CoinListBloc();

  @override
  void initState() {
    super.initState();
    _bloc.add(FetchCoinData());
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _bloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text('CoinGecko Data'),
        ),
        body: BlocBuilder<CoinListBloc, CoinListState>(
          builder: (context, state) {
            if (state is CoinListInitial) {
              return Center(child: CircularProgressIndicator());
            } else if (state is CoinListLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is CoinListLoaded) {
              final coins = state.coins;
              return ListView.builder(
                itemCount: coins.length,
                itemBuilder: (context, index) {
                  final coin = coins[index];
                print(coins.length);
            return   ListTile(
              
                     leading: Image.network(coin.image),
                   title: Text(coin.id),
                      
);
                },
              );
            } else if (state is CoinListError) {
              return Text('Error: ${state.error}');
            } else {
              return Text('Unexpected state');
            }
          },
        ),
      ),
    );
  }
}
