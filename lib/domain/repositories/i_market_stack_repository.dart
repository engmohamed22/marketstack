import 'package:dartz/dartz.dart';
import 'package:marketstack/core/error/failure.dart';

import '../../data/model/stock_pagination_model.dart';
import '../../data/model/ticker_pagination_model.dart';

abstract class IMarketStackRepository {
  Future<Either<Failure, StockPaginationModel>> getStockData({
    required int limit,
    required int offset,
    required String dateFrom,
    required String dateTo,
    required String symbol,
  });

  Future<Either<Failure, TickerPaginationModel>> getTickerData();
}
