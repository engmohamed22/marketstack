import 'package:dartz/dartz.dart';

import '../../core/error/exceptions.dart';
import '../../core/error/failure.dart';
import '../../data/data_sources/i_marketstack_data_source.dart';
import '../../data/model/stock_pagination_model.dart';
import '../../data/model/ticker_pagination_model.dart';
import 'i_market_stack_repository.dart';

class MarketStackRepository implements IMarketStackRepository {
  IMarketStackDataSource marketStackDataSource;
  MarketStackRepository({required this.marketStackDataSource});

  @override
  Future<Either<Failure, StockPaginationModel>> getStockData({
    required int limit,
    required int offset,
    required String dateFrom,
    required String dateTo,
    required String symbol,
  }) async {
    try {
      StockPaginationModel result = await marketStackDataSource.getStockData(
        limit: limit,
        offset: offset,
        dateFrom: dateFrom,
        dateTo: dateTo,
        symbol: symbol,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessage, code: e.code));
    }
  }

  @override
  Future<Either<Failure, TickerPaginationModel>> getTickerData() async {
    try {
      TickerPaginationModel result =
          await marketStackDataSource.getTickerData();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessage, code: e.code));
    }
  }
}
