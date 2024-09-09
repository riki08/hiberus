import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:hiberus/detail_card/presentation/cubit/detail_card_cubit.dart';

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

  Future<Uint8List> _getCachedImage(String url) async {
    final fileInfo = await DefaultCacheManager().getFileFromCache(
      url,
    );
    final file = await fileInfo?.file;
    final bytes = await file?.readAsBytes();
    return bytes!;
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
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    state.card!.card!.name!,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.clip,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Hero(
                    tag: state.card!.card!.id!,
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.all(5),
                      height: 250,
                      child: FutureBuilder(
                          future: _getCachedImage(state.card!.card!.imageUrl!),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Image.memory(
                                snapshot.data!,
                                fit: BoxFit.cover,
                              );
                            } else {
                              return Container(
                                width: 160,
                                alignment: Alignment.center,
                                margin: const EdgeInsets.symmetric(horizontal: 20),
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Center(
                                    child: Placeholder(
                                  child: Text("Not Image"),
                                )),
                              ); // or some other loading indicator
                            }
                          }),
                    ),
                  ),
                  Text(
                    state.card!.card!.type!,
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  if (state.card!.card!.subtypes!.isNotEmpty) ...[
                    const SizedBox(height: 10),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                          "Types:",
                          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.blue),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        height: 30,
                        padding: EdgeInsets.only(left: 20),
                        child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: state.card!.card!.subtypes!.length,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: const EdgeInsets.all(6),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                state.card!.card!.subtypes![index],
                                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(width: 6);
                          },
                        ),
                      ),
                    ),
                  ],
                  const SizedBox(height: 20),
                  const Text(
                    "Description",
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      state.card!.card!.text!,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.clip,
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              );
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
