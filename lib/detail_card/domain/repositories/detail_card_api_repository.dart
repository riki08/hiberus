import 'package:hiberus/detail_card/domain/models/detail_card_response.dart';
import 'package:hiberus/utils/resources/data_state.dart';

abstract class DetailCardApiRepository {
  Future<DataState<DetailCarResponse>> getCardById(String id);
}
