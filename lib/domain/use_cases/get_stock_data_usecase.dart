import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../../data/model/stock_pagination_model.dart';
import '../repositories/marketstack_repository.dart';

class GetStockDataUseCase {
  MarketStackRepository marketStackRepository;

  GetStockDataUseCase({required this.marketStackRepository});

  Future<Either<Failure, StockPaginationModel>> call({
    required int limit,
    required int offset,
    required String dateFrom,
    required String dateTo,
    required String symbol,
  }) async {
    return await marketStackRepository.getStockData(
      limit: limit,
      offset: offset,
      dateFrom: dateFrom,
      dateTo: dateTo,
      symbol: symbol,
    );
  }
}
