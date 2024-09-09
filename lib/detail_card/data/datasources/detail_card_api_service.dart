import 'package:dio/dio.dart';
import 'package:hiberus/detail_card/domain/models/detail_card_response.dart';
import 'package:retrofit/retrofit.dart';

part 'detail_card_api_service.g.dart';

@RestApi(parser: Parser.MapSerializable)
abstract class DetailCardApiService {
  factory DetailCardApiService(Dio dio) = _DetailCardApiService;

  @GET('/v1/cards/{id}')
  Future<HttpResponse<DetailCarResponse>> getCardById(@Path('id') String id);
}
