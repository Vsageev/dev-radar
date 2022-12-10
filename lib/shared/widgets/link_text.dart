import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkText extends StatelessWidget {
  const LinkText({super.key, required this.uri, required this.text, this.style});

  final Uri uri;
  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Link(
      uri: uri,
      builder: (context, followLink) => MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () async {
            if (await canLaunchUrl(uri)) {
              await launchUrl(
                uri,
              );
            }
          },
          child: Text(text, style: style),
        ),
      ),
    );
  }
}
