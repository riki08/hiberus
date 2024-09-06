import 'package:hiberus/models/card_list_model.dart';
import 'package:hiberus/utils/resources/data_state.dart';

abstract class CardApiRepository {
  Future<DataState<CardsModel>> getAllCards();
}
