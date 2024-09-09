import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiberus/cards/domain/repositories/card_api_repository.dart';
import 'package:hiberus/cards/presentation/cubit/card_cubit.dart';
import 'package:hiberus/detail_card/domain/repositories/detail_card_api_repository.dart';
import 'package:hiberus/detail_card/presentation/cubit/detail_card_cubit.dart';
import 'package:hiberus/utils/locator.dart';
import 'package:provider/single_child_widget.dart';

abstract class Providers {
  static List<SingleChildWidget> getProviders() {
    final List<SingleChildWidget> providers = [
      BlocProvider(
        create: (context) => CardCubit(
          locator<CardApiRepository>(),
        ),
      ),
      BlocProvider(
        create: (context) => DetailCardCubit(
          locator<DetailCardApiRepository>(),
        ),
      ),
    ];
    return providers;
  }
}
