import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hiberus/cars/data/datasources/card_api_service.dart';
import 'package:hiberus/cars/data/repositories/card_api_repository_impl.dart';
import 'package:hiberus/cars/domain/repositories/card_api_repository.dart';

final locator = GetIt.instance;

Future<void> initializeDependencies() async {
  final dio = Dio(BaseOptions(
    baseUrl: "https://docs.magicthegathering.io",
    responseType: ResponseType.json,
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
