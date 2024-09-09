import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:hiberus/cars/domain/repositories/card_api_repository.dart';
import 'package:hiberus/models/card_list_model.dart';
import 'package:hiberus/utils/resources/base_cubit.dart';
import 'package:hiberus/utils/resources/data_state.dart';

part 'card_state.dart';

class CardCubit extends BaseCubit<CardState> {
  final CardApiRepository _apiRepository;

  CardCubit(this._apiRepository) : super(const CardInitial());

  Future<void> getAllCards() async {
    if (isBusy) return;
    await run(() async {
      emit(CardLoading());
      final response = await _apiRepository.getAllCards();

      if (response is DataSuccess) {
      } else if (response is DataFailed) {
        emit(CardFailed(error: response.error));
      }
    });
  }
}
