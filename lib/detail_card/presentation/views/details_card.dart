import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiberus/detail_card/presentation/cubit/detail_card_cubit.dart';
import 'package:hiberus/detail_card/presentation/widgets/detail_card_widget.dart';

class DetailsCard extends StatefulWidget {
  final String? id;

  const DetailsCard({super.key, this.id});

  @override
  State<DetailsCard> createState() => _DetailsCardState();
}

class _DetailsCardState extends State<DetailsCard> {
  late DetailCardCubit detailCardCubit;

  @override
  void initState() {
    detailCardCubit = BlocProvider.of<DetailCardCubit>(context);
    detailCardCubit.getCardById(widget.id!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("details"),
      ),
      body: BlocBuilder<DetailCardCubit, DetailCardState>(
        builder: (_, state) {
          switch (state.runtimeType) {
            case DetailCardLoading:
              return const Center(child: CircularProgressIndicator());
            case DetailCardSuccess:
              return DetailCardWidget(card: state.card!.card!);

            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
