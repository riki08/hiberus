import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:hiberus/detail_card/domain/models/detail_card_response.dart';
import 'package:hiberus/detail_card/domain/repositories/detail_card_api_repository.dart';
import 'package:hiberus/utils/resources/base_cubit.dart';
import 'package:hiberus/utils/resources/data_state.dart';

part 'detail_card_state.dart';

class DetailCardCubit extends BaseCubit<DetailCardState> {
  final DetailCardApiRepository apiRepository;
  DetailCardCubit(this.apiRepository) : super(const DetailCardInitial());

  Future<void> getCardById(String id) async {
    if (isBusy) return;
    await run(() async {
      emit(const DetailCardLoading());
      final response = await apiRepository.getCardById(id);

      if (response is DataSuccess) {
        print(response.data);
        emit(DetailCardSuccess(response.data));
      } else if (response is DataFailed) {
        print(response.error);
        emit(DetailCardFailed(error: response.error));
      }
    });
  }
}
