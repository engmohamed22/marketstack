import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:marketstack/data/data_sources/marketstack_data_source.dart';

import '../../data/data_sources/i_marketstack_data_source.dart';
import '../../domain/repositories/marketstack_repository.dart';
import '../../domain/use_cases/get_stock_data_usecase.dart';
import '../../domain/use_cases/get_ticker_data_usecase.dart';
import '../../presentation/blocs/date_range_bloc/date_range_bloc.dart';
import '../../presentation/blocs/stock_bloc/stock_bloc.dart';
import '../../presentation/blocs/ticker_bloc/ticker_bloc.dart';
import '../blocs/internet_bloc/internet_bloc.dart';
import '../network/dio_network_client.dart';
import '../network/i_network_client.dart';

final injector = GetIt.instance;

Future<void> injectDependencies() async {
  injector.registerLazySingleton<Dio>(() => Dio());

  injector.registerLazySingleton<INetworkClient>(
      () => DioNetworkClient(dio: injector()));

  injector.registerLazySingleton<IMarketStackDataSource>(
      () => MarketStackDataSource(networkClient: injector()));

  injector.registerLazySingleton<MarketStackRepository>(
      () => MarketStackRepository(marketStackDataSource: injector()));

  injector.registerLazySingleton<GetStockDataUseCase>(
      () => GetStockDataUseCase(marketStackRepository: injector()));

  injector.registerLazySingleton<GetTickerDataUseCase>(
      () => GetTickerDataUseCase(marketStackRepository: injector()));

  injector.registerLazySingleton<StockBloc>(
      () => StockBloc(getStockDataUseCase: injector()));

  injector.registerLazySingleton<TickerBloc>(
      () => TickerBloc(getTickerDataUseCase: injector()));

  injector.registerLazySingleton<DateRangeBloc>(() => DateRangeBloc());
  injector.registerLazySingleton<InternetBloc>(() => InternetBloc());
}
