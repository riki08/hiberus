import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hiberus/cards/data/datasources/card_api_service.dart';
import 'package:hiberus/cards/data/repositories/card_api_repository_impl.dart';
import 'package:hiberus/cards/domain/repositories/card_api_repository.dart';

final locator = GetIt.instance;

Future<void> initializeDependencies() async {
  final dio = Dio(BaseOptions(
    baseUrl: "https://api.magicthegathering.io",
    contentType: 'application/json',
  ));

  locator.registerSingleton<Dio>(dio);

  //HOME
  locator.registerSingleton<CardApiService>(
    CardApiService(locator<Dio>()),
  );

  locator.registerSingleton<CardApiRepository>(
    CardApiRepositoryImpl(locator<CardApiService>()),
  );
}
