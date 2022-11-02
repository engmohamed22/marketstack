import 'dart:convert';

import '../../core/api_endpoints.dart';
import '../../core/network/i_network_client.dart';
import '../model/stock_pagination_model.dart';
import '../model/ticker_pagination_model.dart';
import 'i_marketstack_data_source.dart';

class MarketStackDataSource implements IMarketStackDataSource {
  final INetworkClient networkClient;

  MarketStackDataSource({required this.networkClient});

  @override
  Future<StockPaginationModel> getStockData({
    required int limit,
    required int offset,
    required String dateFrom,
    required String dateTo,
    required String symbol,
  }) async {
    String result = await networkClient.get(
        paramas: NetworkParams(
            endPoint:
                '${APIEndPoints.stockEndPoint}&symbols=$symbol&limit=$limit&offset=$offset&date_from=$dateFrom&date_to=$dateTo'));
    StockPaginationModel response =
        StockPaginationModel.fromJson(jsonDecode(result));
    return response;
  }

  @override
  Future<TickerPaginationModel> getTickerData() async {
    String result = await networkClient.get(
      paramas: NetworkParams(endPoint: APIEndPoints.tickersEndPoint),
    );
    TickerPaginationModel response =
        TickerPaginationModel.fromJson(jsonDecode(result));
    return response;
  }
}
