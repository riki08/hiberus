import 'package:hiberus/detail_card/data/datasources/detail_card_api_service.dart';
import 'package:hiberus/detail_card/domain/models/detail_card_response.dart';
import 'package:hiberus/detail_card/domain/repositories/detail_card_api_repository.dart';
import 'package:hiberus/utils/resources/base_api_repository.dart';
import 'package:hiberus/utils/resources/data_state.dart';

class DetailCardApiRepositoryImpl extends BaseApiRepository implements DetailCardApiRepository {
  final DetailCardApiService _apiService;

  DetailCardApiRepositoryImpl(this._apiService);

  @override
  Future<DataState<DetailCarResponse>> getCardById(String id) => getStateOf<DetailCarResponse>(
        request: () => _apiService.getCardById(id),
      );
}
