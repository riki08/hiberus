import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:hiberus/detail_card/domain/models/detail_card_response.dart';

class DetailCardWidget extends StatelessWidget {
  final CardResponse card;

  const DetailCardWidget({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          card.name!,
          textAlign: TextAlign.center,
          overflow: TextOverflow.clip,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Hero(
          tag: card.id!,
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.all(5),
            height: 250,
            child: CachedNetworkImage(
              key: Key(card.id!),
              imageUrl: card.imageUrl!,
              cacheManager: CacheManager(Config(
                card.id!,
                stalePeriod: const Duration(days: 1),
                //one week cache period
              )),
              fit: BoxFit.contain,
              cacheKey: card.id,
              progressIndicatorBuilder: (context, url, downloadProgress) => Transform.scale(
                scale: 0.5,
                child: CircularProgressIndicator(
                  value: downloadProgress.progress,
                ),
              ),
              errorWidget: (context, url, error) => Container(
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
              ),
            ),
          ),
        ),
        Text(
          card.type!,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        if (card.subtypes!.isNotEmpty) ...[
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
                itemCount: card.subtypes!.length,
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
                      card.subtypes![index],
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
            card.text!,
            textAlign: TextAlign.center,
            overflow: TextOverflow.clip,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }
}
