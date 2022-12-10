import 'package:dev_radar/network/git_requests.dart';
import 'package:dev_radar/shared/colors.dart';
import 'package:dev_radar/shared/widgets/link_text.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

class ContributorWidget extends StatelessWidget {
  const ContributorWidget({super.key, required this.contributor, required this.position});

  final Contributor contributor;
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
              contributor.avatarUrl,
            ),
          ),
          const SizedBox(width: 10),
          LinkText(
            uri: Uri.parse(contributor.htmlUrl),
            text: contributor.login,
            style: const TextStyle(
              color: CustomColors.accent,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Expanded(child: SizedBox.shrink()),
          Text(
            "${contributor.contributions} contributions",
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
