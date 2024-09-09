import 'package:dio/dio.dart';
import 'package:hiberus/models/card_list_model.dart';
import 'package:retrofit/retrofit.dart';

part 'card_api_service.g.dart';

@RestApi(parser: Parser.MapSerializable)
abstract class CardApiService {
  factory CardApiService(Dio dio) = _CardApiService;

  @GET('/v1/cards')
  Future<HttpResponse<CardsModel>> getAllCards();
}
