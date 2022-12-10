import 'package:dev_radar/network/stack_requests.dart';
import 'package:dev_radar/shared/colors.dart';
import 'package:dev_radar/shared/widgets/link_text.dart';
import 'package:flutter/material.dart';

class AnswererWidget extends StatelessWidget {
  const AnswererWidget({super.key, required this.position, required this.item});

  final AnswererItem item;
  final int position;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          SizedBox(
            width: 60,
            child: Text(
              textAlign: TextAlign.center,
              position.toString(),
              style: const TextStyle(
                color: CustomColors.backgroundAccent,
                fontSize: 33,
              ),
            ),
          ),
          Container(
            height: 55,
            width: 55,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: Image.network(
              item.user.profileImage,
            ),
          ),
          const SizedBox(width: 10),
          LinkText(
            uri: Uri.parse(item.user.link),
            text: item.user.displayName,
            style: const TextStyle(
              color: CustomColors.accent,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Expanded(child: SizedBox.shrink()),
          Text(
            "score: ${item.score} with ${item.postCount} posts",
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 40),
        ],
      ),
    );
  }
}
