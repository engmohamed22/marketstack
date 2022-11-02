import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../../data/model/ticker_pagination_model.dart';
import '../repositories/marketstack_repository.dart';

class GetTickerDataUseCase {
  MarketStackRepository marketStackRepository;

  GetTickerDataUseCase({required this.marketStackRepository});

  Future<Either<Failure, TickerPaginationModel>> call() async {
    return await marketStackRepository.getTickerData();
  }
}
