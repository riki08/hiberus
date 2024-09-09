import 'package:hiberus/cards/data/datasources/card_api_service.dart';
import 'package:hiberus/cards/domain/repositories/card_api_repository.dart';
import 'package:hiberus/models/card_list_model.dart';
import 'package:hiberus/utils/resources/base_api_repository.dart';
import 'package:hiberus/utils/resources/data_state.dart';

class CardApiRepositoryImpl extends BaseApiRepository implements CardApiRepository {
  final CardApiService _apiService;

  CardApiRepositoryImpl(this._apiService);

  @override
  Future<DataState<CardsModel>> getAllCards() => getStateOf<CardsModel>(
        request: () => _apiService.getAllCards(),
      );
}
